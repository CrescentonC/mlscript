package mlscript
package lumberhack

import scala.collection.mutable
import mlscript.utils.*, shorthands.*
import mlscript.Function as FunctionTerm
import Expr.*
import scala.collection.mutable.Map as MutMap
import scala.collection.mutable.Set as MutSet
import lumberhack.utils.*
import ConsStratEnum.*
import ProdStratEnum.*

type RewriteCtx = Map[Ident, Ident]
class FusionStrategy(d: Deforest) {
  val (upperBounds, lowerBounds) = d.upperBounds.toMap -> d.lowerBounds.toMap
  
  val involvedDtors = d.fusionMatch.values.flatten.toSet
  val involvedCtors = d.fusionMatch.keySet

  private def findToEndCons(v: ConsVar, cache: Set[ConsVar]): Set[ConsVar] = {
    if upperBounds.get(v.uid) match { case None => true; case Some(v) => v.isEmpty } then Set(v)
    else upperBounds(v.uid).foldLeft(Set()){(acc, ub) => ub.s match {
      case cv: ConsVar if cache(cv) => acc
      case cv: ConsVar => acc ++ findToEndCons(cv, cache + cv)
      case _ => acc
    }}
  }
  private def findToEndProd(v: ProdVar): Set[ProdVar] = {
    def find(vuid: TypeVarId, cache: Set[TypeVarId]): Set[TypeVarId] = {
      val realLowerBounds = upperBounds.filter { (_, ubs) => ubs.exists { ub =>
        ub.s match {
          case ConsVar(uid, name) => uid == vuid && !cache(uid)
          case _ => false
        }
      }}.keySet
      (if realLowerBounds.isEmpty then Set(vuid) else realLowerBounds.flatMap(b => find(b, cache + vuid)))
        .filter(lowerBounds.get(_).isEmpty)
    }
    find(v.uid, Set()).map(id => ProdVar(id, d.varsName(id))(using d.noExprId))
  }


  val ctorFinalDestinations: Map[MkCtor, Set[ConsStratEnum]] = {
    val res = MutMap.empty[MkCtor, Set[ConsStratEnum]].withDefaultValue(Set())
    d.ctorDestinations.foreach { (ctor, dests) => if involvedCtors(ctor.euid) then
      dests.foreach { dest => dest match {
        case c: (NoCons | Destruct | DeadCodeCons) => res += ctor -> (res(ctor) + c)
        // case cv: ConsVar => res += ctor -> (res(ctor) ++ findToEndCons(cv, Set(cv)))
        case cv: ConsVar => ()
        // case cv: ConsVar => if d.upperBounds(cv.uid).isEmpty then res += ctor -> (res(ctor) + cv)
        case _ => ??? // unreachable
      }}
    }
    res.toMap
  }

  val dtorFinalSources: Map[Destruct, Set[ProdStratEnum]] = {
    val res = MutMap.empty[Destruct, Set[ProdStratEnum]].withDefaultValue(Set())
    d.dtorSources.foreach { (dtor, sources) => if involvedDtors(dtor.euid) then 
      sources.foreach { src => src match {
        case s: (NoProd | MkCtor | DeadCodeProd) => res += dtor -> (res(dtor) + s)
        // case pv: ProdVar => res += dtor -> (res(dtor) ++ findToEndProd(pv))
        case pv: ProdVar => ()
        // case pv: ProdVar => if d.lowerBounds(pv.uid).isEmpty then res += dtor -> (res(dtor) + pv)
        case _ => ??? // unreachable
      }}
    }
    res.toMap
  }

  def ppCtorMap(m: Map[MkCtor, Set[ConsStratEnum]]): Str = m.toSeq.sortBy(_._1.euid.asInstanceOf[Int]).map { (ctor, dests) =>
    (d.exprs.get(ctor.euid) match {
      case Some(value) => value.pp(using InitPpConfig.showIuidOn) + s": ${ctor.euid}"
      case None => ctor.pp(using InitPpConfig)
    }) + " --->\n" + dests.toSeq.sortBy(_.euid.asInstanceOf[Int]).map {
      case dtor: Destruct => "\t" + (d.exprs.get(dtor.euid) match {
        case Some(v) => v.pp(using InitPpConfig.showIuidOn) + s": ${dtor.euid}"
        case None => dtor.pp(using InitPpConfig)
      })
      case ty => "\t" + ty.pp(using InitPpConfig)
    }.mkString("\n")
  }.mkString("\n")
  def ppDtorMap(m: Map[Destruct, Set[ProdStratEnum]]): Str = m.toSeq.sortBy(_._1.euid.asInstanceOf[Int]).map { (dtor, dests) =>
    (d.exprs.get(dtor.euid) match {
      case Some(v) => v.pp(using InitPpConfig.showIuidOn) + s": ${dtor.euid}"
      case None => dtor.pp(using InitPpConfig)
    }) + " --->\n" + dests.toSeq.sortBy(_.euid.asInstanceOf[Int]).map {
      case ctor: MkCtor => "\t" + (d.exprs.get(ctor.euid) match {
        case Some(v) => v.pp(using InitPpConfig.showIuidOn) + s": ${ctor.euid}"
        case None => ctor.pp(using InitPpConfig)
      })
      case ty => "\t" + ty.pp(using InitPpConfig)
    }.mkString("\n")
  }.mkString("\n")


  lazy val ppCtorFinalDestinations: Str = ppCtorMap(ctorFinalDestinations)
  lazy val ppDtorFinalSources: Str = ppDtorMap(dtorFinalSources)

  private def removeCtor(
    ctorDests: Map[MkCtor, Set[ConsStratEnum]],
    dtorSrcs: Map[Destruct, Set[ProdStratEnum]],
    rm: Set[ProdStratEnum]
  ): Map[MkCtor, Set[ConsStratEnum]] -> Map[Destruct, Set[ProdStratEnum]] = {
    if rm.isEmpty then ctorDests -> dtorSrcs else {
      val (newCtorDests, toDeleteCtors) = ctorDests.partition(c => !rm(c._1))
      removeDtor(newCtorDests, dtorSrcs, toDeleteCtors.values.flatten.toSet)
    }
  }
  private def removeDtor(
    ctorDests: Map[MkCtor, Set[ConsStratEnum]],
    dtorSrcs: Map[Destruct, Set[ProdStratEnum]],
    rm: Set[ConsStratEnum]
  ): Map[MkCtor, Set[ConsStratEnum]] -> Map[Destruct, Set[ProdStratEnum]] = {
    if rm.isEmpty then ctorDests -> dtorSrcs else {
      val (newDtorSrcs, toDeleteDtors) = dtorSrcs.partition(d => !rm(d._1))
      removeCtor(ctorDests, newDtorSrcs, toDeleteDtors.values.flatten.toSet)
    }
  }
  
  val afterRemoveMultipleMatch = {
    // remove those dtors with primitive ctors flowing in
    val toRmDtor = dtorFinalSources.filter(_._2.exists(p => p match {
      case _: MkCtor => false
      case _ => true
    })).keySet.asInstanceOf[Set[ConsStratEnum]]
    val res = removeDtor(ctorFinalDestinations, dtorFinalSources, toRmDtor)

    // remove those ctors with primitive dtors as destinations
    val toRmCtor = res._1.filter(_._2.exists {
      case _: Destruct => false
      case _ => true
    }).keySet.asInstanceOf[Set[ProdStratEnum]]
    val res1 = removeCtor(res._1, res._2, toRmCtor)

    
    // remove those ctors with multiple dtors
    val toRmCtor1 = res1._1.filter(_._2.size > 1).keySet.asInstanceOf[Set[ProdStratEnum]]
    removeCtor(res1._1, res1._2, toRmCtor1)
  }

  // assume that there is already no multiple match clashes, can be more efficient
  val afterRemoveRecursiveStrategies = {
    
    val ctorsInExprCache = MutMap.empty[ExprId, Set[MkCtor]]
    def getCtorsInExpr(e: Expr): Set[MkCtor] = {
      ctorsInExprCache.getOrElseUpdate(e.uid, {
        e match {
          case Const(lit: Lit) => Set.empty
          case Ref(id: Ident) => Set.empty
          case Call(lhs: Expr, rhs: Expr) => getCtorsInExpr(lhs) ++ getCtorsInExpr(rhs)
          case ce@Ctor(name: Var, args: Ls[Expr]) => args.flatMap(a => getCtorsInExpr(a)).toSet ++ d.ctorExprToType.get(ce.uid)
          case LetIn(id: Ident, rhs: Expr, body: Expr) => getCtorsInExpr(rhs) ++ getCtorsInExpr(body)
          case LetGroup(defs, body) => defs.values.flatMap(getCtorsInExpr(_)).toSet ++ getCtorsInExpr(body)
          case me@Match(scrut: Expr, arms: Ls[(Var, Ls[Ident], Expr)]) => {
            val dtorType = d.dtorExprToType(me.uid)
            afterRemoveMultipleMatch._2.get(dtorType) match {
              case _ => getCtorsInExpr(scrut) ++ arms.flatMap(a => getCtorsInExpr(a._3))
            }
          }
          case IfThenElse(scrut: Expr, thenn: Expr, elze: Expr) => getCtorsInExpr(scrut) ++ getCtorsInExpr(thenn) ++ getCtorsInExpr(elze)
          case Function(param: Ident, body: Expr) => getCtorsInExpr(body)
          case Sequence(fst: Expr, snd: Expr) => getCtorsInExpr(fst) ++ getCtorsInExpr(snd)
        }
      })
    }

    def getCtorsInStrategy(ctor: MkCtor, dtor: Destruct): Set[MkCtor] = {
      val res = d.exprs(dtor.euid).asInstanceOf[Expr.Match].arms.find(a => a._1 == ctor.ctor || a._1.name == "_").map { m =>
        getCtorsInExpr(m._3)
      }.getOrElse(Set())
      res
    }

    def findCycle(ctor: MkCtor, dtor: Destruct): Set[MkCtor] = d.Trace.trace("findCycle: [" + ctor.pp(using InitPpConfig) + " ---> " + dtor.pp(using InitPpConfig) + "]"){
      val cache = MutSet(ctor)

      def go(strats: Set[(MkCtor, ConsStratEnum)]): Set[MkCtor] = {
        val res = strats.flatMap((c, d) => getCtorsInStrategy(c, d.asInstanceOf[Destruct]))
        val retained = res.flatMap(c => afterRemoveMultipleMatch._1.get(c).flatMap(d => {
          // since it's aleaday after strategy clash elimination
          assert(d.size == 1)
          Some(c -> d.head)
        }))
        val cycled = retained.filter(c => !cache.add(c._1))
        if retained.isEmpty then Set.empty else
          if cycled.nonEmpty then cycled.map(_._1) else go(retained)
      }
      go(Set(ctor -> dtor))
    }(s => "remove: " + s.map(_.pp(using InitPpConfig)).mkString(";;"))

    val toRmCtor = afterRemoveMultipleMatch._1.flatMap { (c, ds) =>
      assert(ds.size == 1)
      findCycle(c, ds.head.asInstanceOf[Destruct])
    }
    val res = removeCtor(afterRemoveMultipleMatch._1, afterRemoveMultipleMatch._2, toRmCtor.toSet)
    d.Trace.log("remove cycle done")
    res
  }

  
  val finallyFilteredStrategies = afterRemoveRecursiveStrategies
  val scopeExtrusionInfo: Map[ExprId, List[Ident]] = {
    finallyFilteredStrategies._2.keys.map { de =>
      val expr = d.exprs(de.euid).asInstanceOf[Expr.Match]
      expr.uid -> (expr.arms.flatMap { (_, ids, body) =>
        body.outOfScopeIds(using (ids ++ d.prgm.get.defAndExpr._1.keys).toSet)
      }.distinct)
    }.toMap
  }
}


enum CalledInfo {
  case NeverCalled
  case NotLinearlyCalled
  case LinearlyCalledWith(i: Int)
}
trait ExprRewrite { this: Expr =>

  def rewriteExpandWithLimit(using
    ctx: Map[Ident, Ident],
    currentPath: List[Ref],
    pathToIdent: Map[List[Ref], Ident],
    knots: Map[List[Ref], List[Ref]],
    newd: Deforest,
    inDef: Option[Ident]
  ): Expr = this match {
    case ref@Ref(id) =>
      if id.isDef then
        val newPath = ref :: currentPath
        Ref(pathToIdent(knots.getOrElse(newPath, newPath)))
      else
        Ref(ctx(id))
    case Const(lit) => Const(lit)
    case IfThenElse(s, t, e) => IfThenElse(s.rewriteExpandWithLimit, t.rewriteExpandWithLimit, e.rewriteExpandWithLimit)
    case Call(lhs, rhs) => Call(lhs.rewriteExpandWithLimit, rhs.rewriteExpandWithLimit)
    case Sequence(f, s) => Sequence(f.rewriteExpandWithLimit, s.rewriteExpandWithLimit)
    case Ctor(name, args) => Ctor(name, args.map(_.rewriteExpandWithLimit))
    case LetIn(id, rhs, body) =>
      val newId = id.copyToNewDeforest
      val newCtx = ctx + (id -> newId)
      LetIn(newId, rhs.rewriteExpandWithLimit(using newCtx), body.rewriteExpandWithLimit(using newCtx))
    case LetGroup(defs, body) =>
      val newIdsMap = (defs.keys.map(i => i -> i.copyToNewDeforest)).toMap
      val newCtx = ctx ++ newIdsMap
      LetGroup(
        defs.map { case (d, rhs) =>
          newIdsMap(d) -> rhs.rewriteExpandWithLimit(using newCtx)
        },
        body.rewriteExpandWithLimit(using newCtx)
      )
    case Match(scrut, arms) =>
      Match(scrut.rewriteExpandWithLimit, arms.map {(ctor, args, body) =>
        val newArgs = args.map(a => a -> a.copyToNewDeforest)
        val newCtx = ctx ++ newArgs
        (ctor, newArgs.map(_._2), body.rewriteExpandWithLimit(using newCtx))
      })
    case Function(param, body) =>
      val newParam = param.copyToNewDeforest
      Function(newParam, body.rewriteExpandWithLimit(using ctx + (param -> newParam)))
  }

  def copyWithDeadDefElim(using ctx: RewriteCtx, newd: Deforest): Expr = {
    this match {
      case Const(lit) => Const(lit)
      case Call(lhs, rhs) => Call(lhs.copyWithDeadDefElim, rhs.copyWithDeadDefElim)
      case Sequence(f, s) => Sequence(f.copyWithDeadDefElim, s.copyWithDeadDefElim)
      case Ctor(name, args) => Ctor(name, args.map(_.copyWithDeadDefElim))
      case LetIn(id, rhs, body) =>
        val newId = id.copyToNewDeforest
        LetIn(newId, rhs.copyWithDeadDefElim(using ctx + (id -> newId)), body.copyWithDeadDefElim(using ctx + (id -> newId)))
      case LetGroup(defs, body) =>
        val newIdsMap = (defs.keys.map(i => i -> i.copyToNewDeforest)).toMap
        val newCtx = ctx ++ newIdsMap
        LetGroup(
          defs.map { case (d, rhs) =>
            newIdsMap(d) -> rhs.copyWithDeadDefElim(using newCtx)
          },
          body.copyWithDeadDefElim(using newCtx)
        )
      case Match(scrut, arms) =>
        Match(scrut.copyWithDeadDefElim, arms.map {(ctor, args, body) =>
          val newArgs = args.map(a => a -> a.copyToNewDeforest)
          given RewriteCtx = ctx ++ newArgs
          (ctor, newArgs.map(_._2), body.copyWithDeadDefElim)
        })
      case IfThenElse(s, t, e) => IfThenElse(s.copyWithDeadDefElim, t.copyWithDeadDefElim, e.copyWithDeadDefElim)
      case Function(param, body) =>
        val newParam = param.copyToNewDeforest
        Function(newParam, body.copyWithDeadDefElim(using ctx + (param -> newParam)))
      case ref@Ref(id) => Ref(ctx(id)) // a parameter or match binder or builtin keyword
    } 
  }

  def rewriteFusion(using
    ctx: RewriteCtx,
    needForce: Set[Ident],
    fusionMatch: Map[ExprId, ExprId],
    newd: Deforest,
    inDef: Option[Ident],
    scopeExtrusionInfo: Map[ExprId, List[Ident]],
  ): Expr = this.deforest.Trace.trace(s"fusion handling ${this.pp(using InitPpConfig)}"){
    def inexpensiveMatchingArmBody(e: Expr): Boolean = e match {
      case _: (Function | Const) => true
      case Ref(Ident(_, Var(v), _)) => v != "error"
      case Ctor(_, args) => args.forall(a => inexpensiveMatchingArmBody(a))
      case Sequence(a, b) => inexpensiveMatchingArmBody(a) && inexpensiveMatchingArmBody(b)
      case IfThenElse(b, t, f) => inexpensiveMatchingArmBody(b) && inexpensiveMatchingArmBody(t) && inexpensiveMatchingArmBody(f)
      case Match(s, arms) => inexpensiveMatchingArmBody(s) && (arms.forall(a => inexpensiveMatchingArmBody(a._3)))
      case LetIn(_, rhs, body) => inexpensiveMatchingArmBody(rhs) && inexpensiveMatchingArmBody(body)
      case LetGroup(lets, body) => inexpensiveMatchingArmBody(body) && lets.forall(l => inexpensiveMatchingArmBody(l._2))
      case Call(_, _) => false
    }
    this match {
      case Const(lit) => Const(lit)
      case Call(lhs, rhs) => Call(lhs.rewriteFusion, rhs.rewriteFusion)
      case Sequence(f, s) => Sequence(f.rewriteFusion, s.rewriteFusion)
      case LetIn(id, rhs, body) =>
        val newId = id.copyToNewDeforest
        val newCtx = ctx + (id -> newId)
        LetIn(newId, rhs.rewriteFusion(using newCtx), body.rewriteFusion(using newCtx))
      case LetGroup(defs, body) =>
        val newIdsMap = (defs.keys.map(i => i -> i.copyToNewDeforest)).toMap
        val newCtx = ctx ++ newIdsMap
        LetGroup(
          defs.map { case (d, rhs) =>
            newIdsMap(d) -> rhs.rewriteFusion(using newCtx)
          },
          body.rewriteFusion(using newCtx)
        )
      case IfThenElse(s, t, e) => IfThenElse(s.rewriteFusion, t.rewriteFusion, e.rewriteFusion)
      case Function(param, body) =>
        val newParamId = param.copyToNewDeforest
        val newCtx = ctx + (param -> newParamId)
        Function(newParamId, body.rewriteFusion(using newCtx))
      case Ref(id) => 
        val mappedId = ctx.getOrElse(id, id)
        if needForce(mappedId) then
          Ref(mappedId)
        else
          Ref(mappedId)
      case Match(scrut, arms) => {
        if fusionMatch.valuesIterator.contains(this.uid) then {
          val extrudedIds = scopeExtrusionInfo(this.uid)
          // make a call the triggerd the computation moved due to deforestation to keep termination behavior
          val noNeedThunking = {
            // val nonDeadBranches = newd.isNotDeadBranch(newd.dtorExprToType(this.uid))
            arms.zipWithIndex.filter(x => true).forall {
              case ((_, _, body), _) => inexpensiveMatchingArmBody(body)
            } // && !nonDeadBranches(-1)
          }
          if extrudedIds.isEmpty && (!noNeedThunking) then
          // if extrudedIds.isEmpty then
            Call(scrut.rewriteFusion, Ctor(Var("lh_Unit"), Nil))
          else
            extrudedIds.foldLeft(scrut.rewriteFusion){
              (acc, id) =>
                val mappedId = ctx.getOrElse(id, id)
                val maybeForcedId = if needForce(mappedId) then
                  Ref(mappedId)
                else
                  Ref(mappedId)
                Call(acc, maybeForcedId)
            }
        } else {
          Match(scrut.rewriteFusion, arms.map{(n, args, body) => (n, args, body.rewriteFusion)})
        }
      }
      case ctor@Ctor(name, args) => fusionMatch.get(this.uid).map { matchId =>
        val matchArm = newd.exprs(matchId).asInstanceOf[Match].arms.find(a => a._1 == name || a._1.name == "_").get
        // ignore unused fields
        val allFvs = matchArm._3.getFreeVarsInExpr
        val usedFieldsWithArgs = {
          if matchArm._1.name == "_" then // id pattern or wildcard pattern
            (matchArm._2 zip (ctor :: Nil)).filter(ida => true)
          else
            (matchArm._2 zip args).filter(ida => true)
        }

        val (newIds, newArgs) = usedFieldsWithArgs.unzip.mapFirst(_.map(i => i -> i.copyToNewDeforest))
        val newCtx = ctx ++ newIds.toMap
        
        val extrudedIds = scopeExtrusionInfo(matchId).map(original =>
          original -> original.copyToNewDeforest
        )
        val innerAfterExtrusionHandling =
          // NOTE: extrudedIds may contain same keys as in newCtx, need to override those entries
          matchArm._3.rewriteFusion(using newCtx ++ extrudedIds, needForce ++ newIds.map(_._2).toSet)
        val inner = {
          val res = extrudedIds.foldRight(innerAfterExtrusionHandling){ (newId, acc) =>
            Function(newId._2, acc)
          }
          val noNeedThunking = {
            // val nonDeadBranches = newd.isNotDeadBranch(newd.dtorExprToType(matchId))
            newd.exprs(matchId).asInstanceOf[Match].arms.zipWithIndex.filter(x => true).forall {
              case ((_, _, body), _) => inexpensiveMatchingArmBody(body)
            } // && !nonDeadBranches(-1)
          }
          
          if extrudedIds.isEmpty && (!noNeedThunking) then
          // if extrudedIds.isEmpty then
            Function(newd.nextIdent(false, Var("_lh_dummy")), res)
          else
            res
        }
        val fused = (newIds zip newArgs).foldLeft[Expr](inner){case (acc, ((_, param), argExpr)) => 
          LetIn(param, argExpr.rewriteFusion, acc)
        }
        fused
      }.getOrElse(Ctor(name, args.map(_.rewriteFusion)))
    }
  }(res => s"done handling fusion with result: ${res.pp(using InitPpConfig)}")

  lazy val getFreeVarsInExpr: Set[Ident] = this match {
    case Const(lit: Lit) => Set.empty
    case Ref(id) => if Deforest.lumberhackKeywords(id.tree.name) then Set.empty else Set(id)
    case Call(lhs: Expr, rhs: Expr) => lhs.getFreeVarsInExpr ++ rhs.getFreeVarsInExpr
    case Ctor(name: Var, args: Ls[Expr]) => args.flatMap(_.getFreeVarsInExpr).toSet
    case LetIn(id: Ident, rhs: Expr, body: Expr) => (rhs.getFreeVarsInExpr ++ body.getFreeVarsInExpr) - id
    case LetGroup(defs, body) =>
      (defs.values.flatMap(_.getFreeVarsInExpr).toSet ++ body.getFreeVarsInExpr) -- defs.keys
    case Match(scrut: Expr, arms: Ls[(Var, Ls[Ident], Expr)]) =>
      scrut.getFreeVarsInExpr ++ (arms.flatMap {(_, newIds, body) => body.getFreeVarsInExpr -- newIds})
    case IfThenElse(scrut: Expr, thenn: Expr, elze: Expr) =>
      scrut.getFreeVarsInExpr ++ thenn.getFreeVarsInExpr ++ elze.getFreeVarsInExpr
    case Function(param: Ident, body: Expr) => body.getFreeVarsInExpr - param
    case Sequence(fst: Expr, snd: Expr) => fst.getFreeVarsInExpr ++ snd.getFreeVarsInExpr
  }
  def outOfScopeIdsSet(using set: Set[Ident]): Set[Ident] = this.getFreeVarsInExpr -- set
  def outOfScopeIds(using set: Set[Ident]): List[Ident] = {
    this.outOfScopeIdsSet.toList.sortBy(_.pp(using InitPpConfig.showIuidOn))
  }

  def substId(using ctx: RewriteCtx, d: Deforest, inDef: Option[Ident]): Expr = this match {
    case c: Const => c
    case Ref(id) => Ref(ctx.getOrElse(id, id))
    case Call(f, p) => Call(f.substId, p.substId)
    case Ctor(n, args) => Ctor(n, args.map(_.substId))
    case LetIn(id, value, body) => LetIn(id, value.substId, body.substId)
    case LetGroup(defs, body) => LetGroup(defs.mapValues(_.substId).toMap, body.substId)
    case Match(scrut, arms) => Match(scrut.substId, arms.map((n, args, body) => (n, args, body.substId)))
    case IfThenElse(cond, thenn, elze) => IfThenElse(cond.substId, thenn.substId, elze.substId)
    case Sequence(f, s) => Sequence(f.substId, s.substId)
    case Function(p, body) => Function(p, body.substId(using ctx.filterKeys(_ != p).toMap))
  }
  def floatOutLambdas(using
    newd: Deforest,
    inDef: Option[Ident],
  ): Expr = {
    def mergeFunctionsInDifferentBranches(fs: List[Function]): List[Ident] -> List[Expr] = {
      val fsWithParamOut = fs.map(_.takeParamsOut)
      val minLength = fsWithParamOut.map(_._1.length).min
      val popOutParamIds = (0 until minLength).map(i => newd.nextIdent(false, Var(s"_lh_floatOutId_$i")))
      val newBodies = fsWithParamOut.map { case (ps, body) =>
        val psSplit = ps.splitAt(minLength)
        val mapping = psSplit._1.zip(popOutParamIds).toMap
        val newBody = body.substId(using mapping)
        psSplit._2.foldRight(newBody)(Function(_, _))
      }
      popOutParamIds.toList -> newBodies
    }
    this match {
      case e: (Call | Const | Ref | Ctor) => e
      case Function(param, body) => Function(param, body.floatOutLambdas)
      case LetIn(id, v, body) => body.floatOutLambdas match {
        case f: Function => {
          val (allArg, fBody) = f.takeParamsOut
          allArg.foldRight[Expr](LetIn(id, v, fBody))(Function(_, _))
        }
        case _ => this
      }
      case LetGroup(defs, body) => body.floatOutLambdas match {
        case f: Function => {
          val (allArg, fBody) = f.takeParamsOut
          allArg.foldRight[Expr](LetGroup(defs, fBody))(Function(_, _))
        }
        case _ => this
      }
      case Sequence(fst, snd) => snd.floatOutLambdas match {
        case f: Function => {
          val (allArg, fBody) = f.takeParamsOut
          allArg.foldRight[Expr](Sequence(fst, fBody))(Function(_, _))
        }
        case _ => this
      }
      case IfThenElse(b, t, e) => (t.floatOutLambdas, e.floatOutLambdas) match {
        case (f1: Function, f2: Function) => {
          val mergeRes = mergeFunctionsInDifferentBranches(f1 :: f2 :: Nil)
          mergeRes._1.foldRight[Expr](IfThenElse(b, mergeRes._2(0), mergeRes._2(1)))(Function(_, _))
        }
        case (t, e) => IfThenElse(b, t, e)
      }
      case Match(s, arms) => {
        val armsPoppedOut = arms.map(_._3.floatOutLambdas)
        if armsPoppedOut.forall(_.isInstanceOf[Function]) then
          val mergeRes = mergeFunctionsInDifferentBranches(armsPoppedOut.asInstanceOf[List[Function]])
          val newMatchArms = arms.zip(mergeRes._2).map { case (ctor, vars, _) -> newBody =>
            (ctor, vars, newBody)
          }
          mergeRes._1.foldRight[Expr](Match(s, newMatchArms))(Function(_, _))
        else
          this
      }
    }
  }


  def primIdize(using d: Deforest, inDef: Option[Ident]): Expr =
    Call(
      Ref(d.lumberhackKeywordsIds("primId")), 
      this match {
        case c: (Const | Ref) => c
        case Call(f, p) => Call(f.primIdize, p.primIdize)
        case Ctor(n, args) => Ctor(n, args.map(_.primIdize))
        case LetIn(id, value, body) => LetIn(id, value.primIdize, body.primIdize)
        case LetGroup(defs, body) => LetGroup(defs.mapValues(_.primIdize).toMap, body.primIdize)
        case Match(scrut, arms) => Match(scrut.primIdize, arms.map((n, args, body) => (n, args, body.primIdize)))
        case IfThenElse(cond, thenn, elze) => IfThenElse(cond.primIdize, thenn.primIdize, elze.primIdize)
        case Sequence(f, s) => Sequence(f.primIdize, s.primIdize)
        case Function(p, body) => Function(p, body.primIdize)
      }
    )
}

trait ProgramRewrite { this: Program =>
  def copyDefsToNewDeforest(using newd: Deforest): Program -> Map[Expr.Ref, Expr.Ref] -> RewriteCtx = {
    val refMaps = scala.collection.mutable.Map.empty[Expr.Ref, Expr.Ref]
    def copyExpr(e: Expr)(using ctx: RewriteCtx, newd: Deforest, inDef: Option[Ident]): Expr = e match {
      case Expr.Const(lit: Lit) => Expr.Const(lit)
      case r@Expr.Ref(id: Ident) =>
        val res = Expr.Ref(ctx(id))
        assert(!refMaps.contains(res))
        refMaps += (res -> r)
        res
      case Expr.Call(lhs: Expr, rhs: Expr) => Expr.Call(copyExpr(lhs), copyExpr(rhs))
      case Expr.Sequence(fst: Expr, snd: Expr) => Expr.Sequence(copyExpr(fst), copyExpr(snd))
      case Expr.Ctor(name: Var, args: Ls[Expr]) => Expr.Ctor(name, args.map(copyExpr))
      case Expr.LetIn(id: Ident, rhs: Expr, body: Expr) =>
        val newId = id.copyToNewDeforest
        Expr.LetIn(newId, copyExpr(rhs)(using ctx + (id -> newId)), copyExpr(body)(using ctx + (id -> newId)))
      case Expr.LetGroup(defs: Map[Ident, Expr], body: Expr) => {
        val newDefIds = defs.map { case (id, rhs) => id -> id.copyToNewDeforest }
        val newDefs = defs.map { case (id, rhs) => newDefIds(id) -> copyExpr(rhs)(using ctx ++ newDefIds) }
        Expr.LetGroup(
          newDefs,
          copyExpr(body)(using ctx ++ newDefIds)
        )
      }
      case Expr.Match(scrut: Expr, arms: Ls[(Var, Ls[Ident], Expr)]) =>
        Expr.Match(copyExpr(scrut), arms.map {(ctor, args, body) =>
          val newArgs = args.map(a => a -> a.copyToNewDeforest)
          given RewriteCtx = ctx ++ newArgs
          (ctor, newArgs.map(_._2), copyExpr(body))
        })
      case Expr.IfThenElse(scrut: Expr, thenn: Expr, elze: Expr) => Expr.IfThenElse(copyExpr(scrut), copyExpr(thenn), copyExpr(elze))
      case Expr.Function(param: Ident, body: Expr) =>
        val newParam = param.copyToNewDeforest
        Expr.Function(newParam, copyExpr(body)(using ctx + (param -> newParam)))
    }
    
    given ctx: RewriteCtx = newd.lumberhackKeywordsIds.values.map(id => id -> id)
      ++ this.defAndExpr._1.keySet.map(id => id -> id.copyToNewDeforest) |> (_.toMap)

    Program(
      this.defAndExpr._2.map { e => given Option[Ident] = None; R(copyExpr(e)) }
      ::: this.defAndExpr._1.map { (id, body) =>
        given Option[Ident] = Some(ctx(id))
        L(ProgDef(ctx(id), copyExpr(body)))
      }.toList
    ) -> refMaps.toMap -> ctx
  }

  def expansionBFSWithLimit(
    toVisit: List[List[Ref]],
    visited: List[List[Ref] -> Ident],
    knots: Map[List[Ref], List[Ref]],
    nameMap: Map[String, Int]
  )(using
    newd: Deforest,
    limit: Int,
    callGraph: Map[Ident, Set[Ref]]
  ): List[List[Ref] -> Ident] -> Map[List[Ref], List[Ref]] = {
    def keepSearching(caller: Ident, h: List[Ref], t: List[List[Ref]]) = {
      val callee = callGraph(caller).map(_ :: h)
      val newNameMap = nameMap.updatedWith(caller.tree.name)(opt => Some(opt.getOrElse(0) + 1))
      expansionBFSWithLimit(
        t ++ callee,
        (h -> newd.nextIdent(
          true,
          Var(caller.tree.name + toSubscript(s"_${newNameMap(caller.tree.name)}")))
        ) :: visited,
        knots,
        newNameMap
      )
    }
    toVisit match {
      case Nil => visited -> knots
      case h :: t => {
        val caller = h.head.id
        val possibleKnotPath = h.tail.span(_.id != caller)._2
        if possibleKnotPath.size > 0 then
          expansionBFSWithLimit(t, visited, knots + (h -> possibleKnotPath), nameMap)
        else
          if visited.size < limit then
            keepSearching(caller, h, t)
          else
            visited.find(_._1.head.id == caller) match {
              case Some((prevPath, id)) => expansionBFSWithLimit(t, visited, knots + (h -> prevPath), nameMap)
              case None => keepSearching(caller, h, t)
            }
      }
    }
  }

  def expandedWithLimit(
    lim: Int,
  ): Program -> Deforest = {
    given newd: Deforest(false)
    // val copiedOriginalProgam -> refMaps -> initContext = this.copyDefsToNewDeforest
    val initCtx: Map[Ident, Ident] = newd.lumberhackKeywordsIds.values.map(id => id -> id).toMap
    val callGraph = this.d.callsInfo

    val res = expansionBFSWithLimit(callGraph._1.map(_ :: Nil).toList, Nil, Map.empty, Map.empty)(using newd, lim, callGraph._2.toMap)

    assert({
      val newIds = res._1.map(_._2)
      val newIdsSet = newIds.toSet
      res._2.values.forall(p => res._1.exists(_._1 == p)) && newIds.size == newIds.toSet.size
    })

    val newDefs = res._1.map { case path -> id =>
      Left(ProgDef(
        id,
        this.defAndExpr._1(path.head.id).rewriteExpandWithLimit(
          using initCtx, path, res._1.toMap, res._2, newd, Some(id)
        )
      ))
    }
    val newTopLevelExprs = this.defAndExpr._2.map(e => Right(e.rewriteExpandWithLimit(
      using initCtx, Nil, res._1.toMap, res._2, newd, None
    )))

    // println("\n" + res._1.map { case path -> id =>
    //   path.map(_.pp(using InitPpConfig.showRefEuidOn)).mkString(" · ") + s" :: ${id.tree.name}"
    // }.mkString("\n"))

    // println("\n" + res._2.map { case later -> knot =>
    //   later.map(_.pp(using InitPpConfig.showRefEuidOn)).mkString(" · ") + " -> " + knot.map(_.pp(using InitPpConfig.showRefEuidOn)).mkString(" · ")
    // }.mkString("\n"))

    Program(newDefs ::: newTopLevelExprs)(using newd) -> newd
  }


  lazy val copyToNewDeforestWithDeadDefElim = {
    given newd: Deforest(false)
    val newCalls = this.usedDefs
    // println(newCalls.size)
    val newInitCtx = newCalls.map(
      i => i -> newd.nextIdent(i.isDef, Var(i.tree.name + "_lh"))
    ) ++ newd.lumberhackKeywordsIds.values.map(id => id -> id) |> (_.toMap)
    
    Program(
      this.contents.flatMap {
        case Left(ProgDef(id, body)) if newInitCtx.contains(id) =>
          Some(Left(ProgDef(newInitCtx(id), body.copyWithDeadDefElim(using newInitCtx, newd))))
        case Left(ProgDef(id, body)) => None
        case Right(expr) => Some(Right(expr.copyWithDeadDefElim(using newInitCtx, newd)))
      }
    )
  }

  def rewrite(d: Deforest, fusionStrategy: FusionStrategy): Program = {
    // given Map[ExprId, ExprId] = d.fusionMatch.map { (p, cs) => p -> cs.head }.toMap
    given Deforest = d
    given Map[ExprId, ExprId] = fusionStrategy.finallyFilteredStrategies._1.map { (ctor, dtors) =>
      assert(dtors.size == 1 && dtors.head.isInstanceOf[Destruct])
      ctor.euid -> dtors.head.euid
    }
    given Map[ExprId, List[Ident]] = fusionStrategy.scopeExtrusionInfo
    Program(
      this.defAndExpr._2.map { e => given Option[Ident] = None; R(e.rewriteFusion(using Map.empty, Set.empty)) }
      ::: this.defAndExpr._1.map { (id, body) =>
        given Option[Ident] = Some(id)
        L(ProgDef(id, body.rewriteFusion(using Map.empty, Set.empty)))
      }.toList
    )
  }

  lazy val floatOutLambdas: Program -> Deforest = {
    val newd: Deforest = Deforest(false)
    val copied -> _ -> _ = this.copyDefsToNewDeforest(using newd)
    val (newProg, finalD) = (copied, newd)

    val prgm = Program(
      newProg.defAndExpr._2.map { e => given Option[Ident] = None; R(e.floatOutLambdas(using finalD)) }
      ::: newProg.defAndExpr._1.map { case (id, body) =>
        given Option[Ident] = Some(id)
        val preLambdaCnt = body match {
          case f: Function => f.takeParamsOut._1.length
          case _ => 0
        }
        val afterPoppedOut = body.floatOutLambdas(using finalD)
        val afterLambdaCnt = afterPoppedOut match {
          case f: Function => f.takeParamsOut._1.length
          case _ => 0
        }
        if afterLambdaCnt > preLambdaCnt then {
          // println(s"${id.tree.name}: $preLambdaCnt -> $afterLambdaCnt") else ()
        }
        L(ProgDef(id, afterPoppedOut))
      }.toList
    )(using finalD)
    finalD(prgm)
    prgm -> finalD
  }

}