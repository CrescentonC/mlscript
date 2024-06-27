package mlscript
package lumberhack

import lumberhack.Expr.Ref
import mlscript.utils.shorthands.*
import mlscript.utils.lastWords
import scala.collection.mutable
import mlscript.utils.{AnyOps, StringOps}
import mlscript.lumberhack.utils.PrettyPrintConfig
import mlscript.lumberhack.utils.InitPpConfig
import mlscript.lumberhack.utils.{toSubscript, toSuperscript}

type TypeVar
type ExprId = Uid[Expr]
type TypeVarId = Uid[TypeVar]
type Cnstr = ProdStrat -> ConsStrat
type ProdStrat = Strat[ProdStratEnum]
type ConsStrat = Strat[ConsStratEnum]

case class Strat[+T <: (ProdStratEnum | ConsStratEnum)](val s: T) {
  def pp(using config: PrettyPrintConfig): Str = s.pp
}
trait ToStrat[+T <: (ProdStratEnum | ConsStratEnum)] { self: T =>
  def toStrat(): Strat[T] = Strat(this)
  def pp(using config: PrettyPrintConfig): Str
}
trait MkCtorTrait { this: ProdStratEnum.MkCtor =>
  override def equals(x: Any): Boolean = x match {
    case r: ProdStratEnum.MkCtor => this.ctor == r.ctor && this.args == r.args && this.euid == r.euid
    case _ => false
  }
  override lazy val hashCode: Int = (this.ctor, this.args, this.euid).hashCode()
}
trait DestructTrait { this: ConsStratEnum.Destruct =>
  override def equals(x: Any): Boolean = x match {
    case r: ConsStratEnum.Destruct => this.destrs == r.destrs && this.euid == r.euid
    case _ => false
  }
  override lazy val hashCode: Int = (this.destrs, this.euid).hashCode()
}
enum ProdStratEnum(using val euid: ExprId) extends ToStrat[ProdStratEnum] {
  case NoProd()(using ExprId) extends ProdStratEnum with ToStrat[NoProd]
  case MkCtor(ctor: Var, args: Ls[ProdStrat])(using ExprId) extends ProdStratEnum
    with ToStrat[MkCtor]
    with MkCtorTrait
  case Sum(ctors: Ls[Strat[MkCtor]])(using ExprId) extends ProdStratEnum with ToStrat[Sum]
  case ProdFun(lhs: ConsStrat, rhs: ProdStrat)(using ExprId) extends ProdStratEnum with ToStrat[ProdFun]
  case ProdVar(uid: TypeVarId, name: String)(using ExprId)
    extends ProdStratEnum
    with ToStrat[ProdVar]
  case DeadCodeProd()(using ExprId) extends ProdStratEnum with ToStrat[DeadCodeProd]

  def pp(using config: PrettyPrintConfig): Str = this match
    case NoProd() => "NoProd"
    case MkCtor(ctor, args) if args.length > 0 => s"${ctor.name}(${args.map(_.pp).mkString(", ")})"
    case MkCtor(ctor, _) => ctor.name
    case Sum(ls) => s"Sum[${ls.map(_.pp).mkString(", ")}]"
    case ProdFun(l, r) => s"${l.pp} => ${r.pp}"
    case pv@ProdVar(uid, n) =>
      (if config.showVuid then s"$uid" else "") + s"'$n"
    case DeadCodeProd() => "DeadCodeProd"

}
enum ConsStratEnum(using val euid: ExprId) extends ToStrat[ConsStratEnum] {
  case NoCons()(using ExprId) extends ConsStratEnum with ToStrat[NoCons]
  case Destruct(destrs: Ls[Destructor])(using ExprId) extends ConsStratEnum
    with ToStrat[Destruct]
    with DestructTrait
  case ConsFun(lhs: ProdStrat, rhs: ConsStrat)(using ExprId) extends ConsStratEnum with ToStrat[ConsFun]
  case ConsVar(uid: TypeVarId, name: String)(using ExprId)
    extends ConsStratEnum
    with ToStrat[ConsVar]
  case DeadCodeCons()(using ExprId) extends ConsStratEnum with ToStrat[DeadCodeCons]

  def pp(using config: PrettyPrintConfig): Str = this match
    case NoCons() => "NoCons"
    case DeadCodeCons() => "DeadCodeCons"
    case Destruct(x) => s"Destruct(${x.map(_.pp).mkString(", ")})"
    case ConsFun(l, r) => s"${l.pp} => ${r.pp}"
    case cv@ConsVar(uid, n) =>
      (if config.showVuid then s"$uid" else "") + s"'$n"
}
import ProdStratEnum.*, ConsStratEnum.*, Expr.*
case class Destructor(ctor: Var, argCons: Ls[Strat[ConsVar]]) {
  def pp(using config: PrettyPrintConfig): Str =
    if argCons.length > 0 then s"${ctor.name}(${argCons.map(_.pp).mkString(", ")})" else ctor.name
}
object ProdStratEnum {
  def prodBool(using ExprId) = Sum(
    MkCtor(Var("True"), Nil).toStrat() :: MkCtor(Var("False"), Nil).toStrat() :: Nil
  )
  def prodInt(using ExprId) = MkCtor(Var("Int"), Nil)
  def prodFloat(using ExprId) = MkCtor(Var("Float"), Nil)
  def prodChar(using ExprId) = MkCtor(Var("Char"), Nil)
  def prodString(using d: Deforest, euid: ExprId): ProdStratEnum = {
    NoProd()(using euid)
  }
  def prodString(s: Str)(using ExprId): MkCtor = s.headOption match {
    case Some(_) => MkCtor(Var("LH_C"), prodChar.toStrat() :: prodString(s.tail).toStrat() :: Nil)
    case None => MkCtor(Var("LH_N"), Nil)
  }
  def prodIntBinOp(using id: ExprId, d: Deforest) = ProdFun(
    consInt(using d.noExprId).toStrat(),
    ProdFun(consInt(using d.noExprId).toStrat(), prodInt(using d.noExprId).toStrat())(using d.noExprId).toStrat()
  )
  def prodFloatBinOp(using id: ExprId, d: Deforest) = ProdFun(
    consFloat(using d.noExprId).toStrat(),
    ProdFun(consFloat(using d.noExprId).toStrat(), prodFloat(using d.noExprId).toStrat())(using d.noExprId).toStrat()
  )
  def prodFloatUnaryOp(using id: ExprId, d: Deforest) = ProdFun(
    consFloat(using d.noExprId).toStrat(), prodFloat(using d.noExprId).toStrat()
  )
  def prodIntEq(using id: ExprId, d: Deforest) = ProdFun(
    consInt(using d.noExprId).toStrat(),
    ProdFun(consInt(using d.noExprId).toStrat(), prodBool(using d.noExprId).toStrat())(using d.noExprId).toStrat()
  )
  def prodBoolBinOp(using id: ExprId, d: Deforest) = ProdFun(
    consBool(using d.noExprId).toStrat(),
    ProdFun(consBool(using d.noExprId).toStrat(), prodBool(using d.noExprId).toStrat())(using d.noExprId).toStrat()
  )
  def prodBoolUnaryOp(using id: ExprId, d: Deforest) = ProdFun(
    consBool(using d.noExprId).toStrat(),
    prodBool(using d.noExprId).toStrat()
  )
}
object ConsStratEnum {
  def consBool(using ExprId) = Destruct(
    Destructor(Var("True"), Nil) :: Destructor(Var("False"), Nil) :: Nil
  )
  def consInt(using ExprId) = Destruct(Destructor(Var("Int"), Nil) :: Nil)
  def consFloat(using ExprId) = Destruct(Destructor(Var("Float"), Nil) :: Nil)
  def consChar(using ExprId) = Destruct(Destructor(Var("Char"), Nil) :: Nil)
}
case class Ctx(bindings: Map[Ident, Strat[ProdVar]]) {
  def apply(id: Ident): Strat[ProdVar] =
    bindings.getOrElse(id, lastWords(s"binding not found: " + id))
  def + (b: Ident -> Strat[ProdVar]): Ctx =
    copy(bindings = bindings + b)
  def ++ (bs: Iterable[Ident -> Strat[ProdVar]]): Ctx =
    copy(bindings = bindings ++ bs)
}
object Ctx {
  def empty = Ctx(Map.empty)
}

class Deforest(var debug: Boolean) {
  object Trace {
    private val noPostTrace: Any => String = _ => ""
    private var indent = 0
    private[lumberhack] def trace[T](pre: => String)(thunk: => T)(post: T => String = noPostTrace): T = {
      log(pre, color = Console.CYAN)
      indent += 1
      val res =
        try thunk
        finally indent -= 1
      if (!(post eq noPostTrace)) log(post(res), color = Console.CYAN)
      res
    }
    private[lumberhack] def summary(str: String) =
      val made = str.split('\n').mkString("\\")
      if (made.length > 100) made.take(100) + Console.RESET + Console.MAGENTA + "..." + Console.RESET else made
    private[lumberhack] def log(msg: => String, color: String = Console.RED): Unit =
      if debug then println("| " * indent + color + msg + Console.RESET)
  }
  import Trace.*
  
  var prgm: Option[Program] = None
  var constraints: Ls[Cnstr] = Nil
  val exprs: mutable.Map[ExprId, Expr] = mutable.Map.empty
  val varsName = mutable.Map.empty[TypeVarId, Str]
  
  val vuid = Uid.TypeVar.State()
  val iuid = Uid.Ident.State()
  val euid = Uid.Expr.State()
  val noExprId = euid.nextUid
  def nextIdent(isDef: Bool, name: Var): Ident = Ident(isDef, name, iuid.nextUid(name.name))

  def freshVar(n: String)(using ExprId): ((ProdStratEnum & ToStrat[ProdVar]), (ConsStratEnum & ToStrat[ConsVar])) =
    val vid = vuid.nextUid
    val pv = ProdVar(vid, n)
    val cv = ConsVar(vid, n)
    varsName += vid -> n
    log(s"fresh var '$n")
    (pv, cv)
  def freshVar(n: Ident)(using ExprId): ((ProdStratEnum & ToStrat[ProdVar]), (ConsStratEnum & ToStrat[ConsVar])) =
    freshVar(n.pp(using InitPpConfig.showIuidOn))
  
  val tailPosExprIds = mutable.Set.empty[ExprId]
  val callsInfo = (mutable.Set.empty[Ref], mutable.Map.empty[Ident, Set[Ref]])
  val ctorExprToType = mutable.Map.empty[ExprId, MkCtor]
  val dtorExprToType = mutable.Map.empty[ExprId, Destruct]
  val exprToProdType = mutable.Map.empty[ExprId, ProdStrat]
  private def registerExprToType(e: Expr, s: ProdStrat) = {
    // just to handle the initial program translated from haskell since its ExprId may got duplicated, just
    // a check to make sure things does not break here
    def eq(a: ProdStrat, b: ProdStrat): Boolean = (a.s, b.s) match {
      case (NoProd(), NoProd()) => true
      case (MkCtor(c1, a1), MkCtor(c2, a2)) => c1 == c2 && a1.zip(a2).foldLeft(true){ case (acc, (a1, a2)) => acc && eq(a1, a2) }
      case (Sum(ctors1), Sum(ctors2)) => ctors1.zip(ctors2).foldLeft(true){ case (acc, (cs1, cs2)) => acc && eq(cs1, cs2) }
      case (ProdFun(_, rhs1), ProdFun(_, rhs2)) => eq(rhs1, rhs2)
      case (ProdVar(_, n1), ProdVar(_, n2)) => n1 == n2
      case (DeadCodeProd(), DeadCodeProd()) => true
      case _ => false
    }
    exprToProdType.get(e.uid) match {
      case None => {
        exprToProdType += e.uid -> s
        s
      }
      case Some(value) =>
        if eq(value, s) then
          value
        else
          lastWords(s"${e.pp(using InitPpConfig.showEuidOn)} registered two prod strategies:\n already has ${value.pp(using InitPpConfig)}, but got ${s.pp(using InitPpConfig)}")
    }
  }

  def process(e: Expr, isTail: Boolean)(using ctx: Ctx, calls: mutable.Set[Ref]): ProdStrat = trace(s"process ${e.uid}: ${e.pp(using InitPpConfig)}") {
    if isTail then tailPosExprIds += e.uid else ()
    val res: ProdStratEnum = e match
      case Call(primFun@Ref(lazyOrForce), e) if Set("lazy", "force", "lumberhack_obj_magic")(lazyOrForce.tree.name) =>
        process(e, false).s
      case Call(Ref(fromLargeStr), Const(StrLit(largeStr))) if fromLargeStr.tree.name == "from_large_str" =>
        NoProd()(using e.uid)
      case Call(Ref(z_of_string), Const(StrLit(largeInt))) if z_of_string.tree.name == "z_of_string" =>
        NoProd()(using e.uid)
      case Call(Ref(err), callee) if err.tree.name == "error" =>
        process(callee.primIdize(using this, None), false)
        freshVar("_lh_rigid_error_var")(using e.uid)._1
      case Const(IntLit(_)) => prodInt(using noExprId)
      case Const(DecLit(_)) => prodFloat(using noExprId) // floating point numbers as integers type
      case Const(CharLit(_)) => prodChar(using noExprId)
      // str lits are handled by fromHaskell; do not handle str lits in mls now
      // case Const(StrLit(strLit)) => prodString(strLit)(using noExprId) // Strings constants are lists of chars
      case Const(l) => NoProd()(using e.uid)
      case Ref(Ident(_, Var(primitive), _)) if Deforest.lumberhackKeywords(primitive) => {
        if Deforest.lumberhackIntComparisonFun(primitive) || Deforest.lumberhackIntComparisonOps(primitive) then
          prodIntEq(using e.uid, this)
        else if Deforest.lumberhackIntValueFun(primitive) || Deforest.lumberhackIntValueBinOps(primitive) then
          prodIntBinOp(using e.uid, this)
        else if Deforest.lumberhackBoolBinOps(primitive) then
          prodBoolBinOp(using e.uid, this)
        else if Deforest.lumberhackBoolUnaryOps(primitive) then
          prodBoolUnaryOp(using e.uid, this)
        else if Deforest.lumberhackFloatBinOps(primitive) then
          prodFloatBinOp(using e.uid, this)
        else if Deforest.lumberhackFloatUnaryOps(primitive) then
          prodFloatUnaryOp(using e.uid, this)
        else if primitive == "error" then
          freshVar("_lh_rigid_error_var")(using e.uid)._1
        else if (Set("primitive", "primId") ++ Deforest.lumberhackPolyOps)(primitive) then
          NoProd()(using e.uid) // `primitive`, `primId`
        else if primitive == "string_of_int" then
          ProdFun(consInt(using noExprId).toStrat(), prodString(using this, noExprId).toStrat())(using e.uid)
        else if primitive == "string_of_z" then
          ProdFun(consInt(using noExprId).toStrat(), prodString(using this, noExprId).toStrat())(using e.uid)
        else if primitive == "string_of_float" then
          ProdFun(consFloat(using noExprId).toStrat(), prodString(using this, noExprId).toStrat())(using e.uid)
        else if primitive == "char_of_int" then
          ProdFun(consInt(using noExprId).toStrat(), prodChar(using noExprId).toStrat())(using e.uid)
        else if primitive == "int_of_char" then
          ProdFun(consChar(using noExprId).toStrat(), prodInt(using noExprId).toStrat())(using e.uid)
        else if primitive == "float_of_int" then
          ProdFun(consInt(using noExprId).toStrat(), prodFloat(using noExprId).toStrat())(using e.uid)
        else if primitive == "int_of_float" then
          ProdFun(consFloat(using noExprId).toStrat(), prodInt(using noExprId).toStrat())(using e.uid)
        else if primitive == "ceiling" then
          ProdFun(consFloat(using noExprId).toStrat(), prodFloat(using noExprId).toStrat())(using e.uid)
        else if primitive == "z_of_int" || primitive == "z_to_int" then
          prodBoolUnaryOp(using e.uid, this)
        else
          lastWords("lazy, force and lumberhack_obj_magic should not be handled here")
      }
      case r @ Ref(id) =>
        if id.isDef then {
          calls.add(r)
        }
        ctx(id).s.copy()(using e.uid)
      case Call(f, a) =>
        val fp = process(f, false)
        val ap = process(a, false)
        val sv = freshVar(s"${e.uid}_callres")(using e.uid)
        constrain(fp, ConsFun(ap, sv._2.toStrat())(using noExprId).toStrat())
        sv._1
      case ce@Ctor(name, args) =>
        val ctorType = MkCtor(name, args.map(a => process(a, false)))(using e.uid)
        this.ctorExprToType += ce.uid -> ctorType.asInstanceOf[MkCtor]
        ctorType
      case me@Match(scrut, arms) =>
        val sp = process(scrut, false)
        val (detrs, bodies) = arms.map { (v, as, e) =>
          if v.name.isCapitalized then { // normal pattern
            val as_tys = as.map(a => a -> freshVar(a)(using noExprId))
            val ep = process(e, true && isTail)(using ctx ++ as_tys.map(v => v._1 -> v._2._1.toStrat()))
            (Destructor(v, as_tys.map(a_ty => a_ty._2._2.toStrat())), ep)
          } else if v.name == "_" then { // id pattern or wildcard pattern ("_", id :: Nil (or Nil), armBodyExpr)
            val newIdCtx = as.headOption.map { newId =>
              val idVar = freshVar(newId)(using noExprId)
              (newId -> idVar._1.toStrat(), idVar._2.toStrat())
            }
            val ep = process(e, true && isTail)(using ctx ++ newIdCtx.map(_._1))
            (Destructor(v, newIdCtx.map(_._2).toList), ep)
          } else if v.name.toIntOption.isDefined then { // int literal pattern: ("3", Nil, armBodyExpr)
            val ep = process(e, true && isTail)
            (Destructor(Var("Int"), Nil), ep)
          } else if v.name.matches("'.'") then {
            val ep = process(e, true && isTail)
            (Destructor(Var("Char"), Nil), ep)
          } else { lastWords(s"unreachable: unknown kind of match arm: ${v.name}") }
        }.unzip
        val dtorType = Destruct(detrs)(using e.uid).toStrat()
        constrain(sp, dtorType)
        val res = freshVar(s"${e.uid}_matchres")(using e.uid)
        bodies.foreach(constrain(_, res._2.toStrat()))
        // register from expr to type
        this.dtorExprToType += me.uid -> dtorType.s
        res._1
      case Function(param, body) =>
        val sv = freshVar(param)(using noExprId)
        ProdFun(sv._2.toStrat(),
          process(body, false)(using ctx + (param -> sv._1.toStrat()))
        )(using e.uid)
      case IfThenElse(scrut, thenn, elze) =>
        constrain(process(scrut, false), consBool(using noExprId).toStrat())
        val res = freshVar(s"${e.uid}_ifres")(using e.uid)
        constrain(process(thenn, true && isTail), res._2.toStrat())
        constrain(process(elze, true && isTail), res._2.toStrat())
        res._1
      case LetIn(id, rhs, body) =>
        val v = freshVar(id)(using noExprId)
        constrain(process(rhs, false)(using ctx + (id -> v._1.toStrat())), v._2.toStrat())
        process(body, true && isTail)(using ctx + (id -> v._1.toStrat())).s
      case LetGroup(defs, body) =>
        assert(defs.nonEmpty)
        val vs = defs.keys.map(k => k -> freshVar(k)(using noExprId)).toMap
        given newCtx: Ctx = ctx ++ vs.mapValues(_._1.toStrat()).toMap
        defs.foreach { case (id, rhs) =>
          val t = process(rhs, false)(using newCtx)
          constrain(t, vs(id)._2.toStrat())
        }
        process(body, true && isTail)(using newCtx).s
      case Sequence(fst, snd) =>
        process(fst, false)
        process(snd, true && isTail).s

    registerExprToType(e, res.toStrat())
  }(r => s"=> ${r.pp(using InitPpConfig)}")

  def apply(p: Program): Ls[Ident -> ProdStrat] = trace(s"apply ${summary(p.pp(using InitPpConfig))}") {
    if constraints.nonEmpty then return Nil
    val vars: Map[Ident, Strat[ProdVar]] = p.contents.collect {
      case L(ProgDef(id, body)) =>
        id -> freshVar(id.pp(using InitPpConfig))(using noExprId)._1.toStrat()
    }.toMap

    val ctx = Ctx.empty ++ vars
    p.contents.map {
      case L(ProgDef(id, body)) => {
        val calls = mutable.Set.empty[Ref]
        val p = process(body, true)(using ctx, calls)
        val v = vars(id).s
        constrain(p, ConsVar(v.uid, v.name)(using noExprId).toStrat())
        callsInfo._2.addOne(id -> calls.toSet)
      }
      case R(e) => {
        val calls = mutable.Set.empty[Ref]
        val topLevelProd = process(e, true)(using ctx, calls)
        constrain(topLevelProd, NoCons()(using noExprId).toStrat())
        callsInfo._1.addAll(calls)
      }
    }
    vars.toList
  }(r => s"=> ${summary(r.map(v => s"${v._1.pp(using InitPpConfig)}: ${v._2.pp(using InitPpConfig)}").mkString(", "))}")
  
  def constrain(prod: ProdStrat, cons: ConsStrat): Unit = {
    (prod.s, cons.s) match
      case (p, c) => constraints ::= (prod, cons)
  }
  
  def isRealCtorOrDtor(id: ExprId): Boolean =
    if id == noExprId then
      false
    else
      exprs(id) match {
        case cd: (Expr.Ctor | Expr.Match) => true
        case _ => false
      }
  
  type Cache = scala.collection.mutable.Map[Cnstr, Cnstr -> Int]


  val fusionMatch = mutable.Map.empty[ExprId, Set[ExprId]]
  val upperBounds = mutable.Map.empty[TypeVarId, Ls[ConsStrat]].withDefaultValue(Nil)
  val lowerBounds = mutable.Map.empty[TypeVarId, Ls[ProdStrat]].withDefaultValue(Nil)
  val ctorDestinations = mutable.Map.empty[ProdStratEnum.MkCtor, Set[ConsStratEnum]].withDefaultValue(Set())
  val dtorSources = mutable.Map.empty[ConsStratEnum.Destruct, Set[ProdStratEnum]].withDefaultValue(Set())
  val isNotDead = mutable.Set.empty[
    ProdStratEnum.MkCtor |
    ProdStratEnum.ProdFun |
    ProdStratEnum.Sum |
    ProdStratEnum.NoProd
  ]
  // val isNotDeadBranch = mutable.Map.empty[Destruct, Set[Int]]
  val errorTypes = scala.collection.mutable.Set.empty[ProdStratEnum | ConsStratEnum]
  def resolveConstraints: Unit = {
    // if constraint resolver has already been executed, do not execute it more than once
    if lowerBounds.keys.nonEmpty || upperBounds.keys.nonEmpty then return ()
    def handle(c: Cnstr)(using cache: Cache, numOfTypeCtor: Int): Unit = trace(s"handle [${c._1.pp(using InitPpConfig.showVuidOn)} <: ${c._2.pp(using InitPpConfig.showVuidOn)}]") {
      val prod = c._1
      val cons = c._2

      cache.get(c) match
        case S(inCache) =>
          log(s">> done [${prod.pp(using InitPpConfig)} : ${cons.pp(using InitPpConfig)}]")
          log(s">> with [${inCache._1._1.pp(using InitPpConfig)} : ${inCache._1._2.pp(using InitPpConfig)}]")
          return ()
        case N => ()

      cache += (c -> (c -> numOfTypeCtor))

      (prod.s, cons.s) match
        case (ProdVar(v, pn), ConsVar(w, cn))
          if v === w || pn == "_lh_rigid_error_var" || cn == "_lh_rigid_error_var" => ()
        case (np@NoProd(), NoCons()) =>
        case (np@NoProd(), ConsFun(l, r)) =>
          given Int = numOfTypeCtor + 1
          handle(l -> NoCons()(using noExprId).toStrat())
          handle(NoProd()(using noExprId).toStrat() -> r)
        case (prodFun@ProdFun(l, r), NoCons()) =>
          given Int = numOfTypeCtor + 1
          handle(r -> NoCons()(using noExprId).toStrat())
          handle(NoProd()(using noExprId).toStrat() -> l)
        case (np@NoProd(), dtor@Destruct(ds)) =>
          // isNotDeadBranch.update(dtor, (0 until ds.length).toSet)
          given Int = numOfTypeCtor + 1
          if this.isRealCtorOrDtor(dtor.euid) then {
            dtorSources += dtor -> (dtorSources(dtor) + prod.s)
          }
          ds foreach { case Destructor(ctor, argCons) =>
            argCons foreach { c => handle(prod, c) }
          }
        case (ctorType@MkCtor(ctor, args), NoCons()) =>
          given Int = numOfTypeCtor + 1
          if this.isRealCtorOrDtor(ctorType.euid) then {
            ctorDestinations += ctorType -> (ctorDestinations(ctorType) + cons.s)
          }
          args foreach { p => handle(p, cons) }
        case (pv@ProdVar(v, n), _) if n == "_lh_rigid_error_var" => ()
        case (_, cv@ConsVar(v, n)) if n == "_lh_rigid_error_var" => ()
        case (pv@ProdVar(v, _), _) =>
          cons.s match {
            case dtor: Destruct if lowerBounds(v).isEmpty && this.isRealCtorOrDtor(dtor.euid) =>
              dtorSources += dtor -> (dtorSources(dtor) + pv)
            case _ => ()
          }
          upperBounds += v -> (cons :: upperBounds(v))
          lowerBounds(v).foreach(lb_strat => handle(lb_strat -> cons))
        case (_, cv@ConsVar(v, _)) =>
          prod.s match {
            case ctor: MkCtor if upperBounds(v).isEmpty && this.isRealCtorOrDtor(ctor.euid) =>
              ctorDestinations += ctor -> (ctorDestinations(ctor) + cv)
            case _ => ()
          }
          lowerBounds += v -> (prod :: lowerBounds(v))
          upperBounds(v).foreach(ub_strat => handle(prod -> ub_strat))
        case (prodFun@ProdFun(lhs1, rhs1), ConsFun(lhs2, rhs2)) =>
          given Int = numOfTypeCtor + 1
          handle(lhs2 -> lhs1)
          handle(rhs1 -> rhs2)
        case (mkctor@MkCtor(ctor, args), dtors@Destruct(ds)) =>
          // these three primitive types are handled differently: they do not need to be fused
          if (ctor.name != "Int") && (ctor.name != "Char") && (ctor.name != "Float") then {
            given Int = numOfTypeCtor + 1
            (ds.indexWhere {case Destructor(ds_ctor, argCons) => ds_ctor == ctor || ds_ctor.name == "_"}) match {
              case -1 =>
                // isNotDeadBranch.updateWith(dtors) {
                //   case None => Some(Set(-1))
                //   case Some(idxs) => Some(idxs + (-1))
                // }
              case armIndex => {
                // isNotDeadBranch.updateWith(dtors) {
                //   case None => Some(Set(armIndex))
                //   case Some(idxs) => Some(idxs + armIndex)
                // }
                val Destructor(ds_ctor, argCons) = ds(armIndex)  
                if ds_ctor == ctor then {
                  assert(args.size == argCons.size)
                  // register the fusion match
                  args lazyZip argCons foreach { case (a, c) =>
                    handle(a, c)
                  }

                } else if ds_ctor.name == "_" then { // both wildcard pattern and id pattern
                  (prod :: Nil) lazyZip argCons foreach { case (a, c) =>
                    handle(a, c)
                  }
                }
                if (this.isRealCtorOrDtor(prod.s.euid) && this.isRealCtorOrDtor(cons.s.euid)) then {
                  fusionMatch.updateWith(prod.s.euid)(_.map(_ + cons.s.euid).orElse(Some(Set(cons.s.euid))))
                  dtorSources += cons.s.asInstanceOf[Destruct] -> (dtorSources(cons.s.asInstanceOf[Destruct]) + prod.s)
                  ctorDestinations += prod.s.asInstanceOf[MkCtor] -> (ctorDestinations(prod.s.asInstanceOf[MkCtor]) + cons.s)
                }
              }
            }
          } else {
            if ds.exists(d => d.ctor != ctor && d.ctor.name != "_") then ()
          }
        case (sum@Sum(ctors), Destruct(ds)) =>
          given Int = numOfTypeCtor + 1
          ctors.foreach { ctorStrat => ctorStrat.s match
            case MkCtor(ctor, args) => {
              ds.find(d => d.ctor == ctor || d.ctor.name == "_") match {
                case Some(value) if args.size == value.argCons.size && value.ctor.name != "_" =>
                  val d = value
                  if d.ctor.name == "_" then {
                    args lazyZip d.argCons foreach {
                      case (a, c) => handle(a, c)
                    }
                  } else {
                    (prod :: Nil) lazyZip d.argCons foreach { case (a, c) =>
                      handle(a, c)
                    }
                  }
                case _ => ()
              }
            }
          }
        case (sum@Sum(ctors), NoCons()) =>
          ctors.foreach(handle(_, cons))
        case (f: ProdFun, Destruct(ds)) if ds.find(_.ctor.name == "_").isDefined =>
          val dtor = ds.find(_.ctor.name == "_").get
          (prod :: Nil) lazyZip dtor.argCons foreach { case (a, c) =>
            handle(a, c)
          }
        case _ => ()
    }()
    
    given Cache = scala.collection.mutable.Map.empty
    given Int = 0
    
    constraints foreach handle
    assert(lowerBounds.values.flatten.forall(!_.s.isInstanceOf[ProdVar]))
    propagateDeadCodeConsProd
  }
  


  lazy val lumberhackKeywordsIds: Map[String, Ident] = Deforest.lumberhackKeywords.map {
    n => n -> this.nextIdent(false, Var(n))
  }.toMap

  def propagateDeadCodeConsProd: Unit = {
    val emptyPathDeadCodeCons = DeadCodeCons()(using noExprId)
    val emptyPathDeadCodeProd = DeadCodeProd()(using noExprId)
    val cacheProd = mutable.Set.empty[ProdStrat]
    val cacheCons = mutable.Set.empty[ConsStrat]
    def handleProd(p: ProdStrat): Unit = {
      if cacheProd.add(p) then
        p.s match {
          case DeadCodeProd() => ()
          case NoProd() => ()
          case ctorType@MkCtor(ctor, args) =>
            if this.isRealCtorOrDtor(ctorType.euid) then
              ctorDestinations += ctorType -> (ctorDestinations(ctorType) + emptyPathDeadCodeCons)
            args.foreach(a => handleProd(a))
          case Sum(ls) => ls.foreach(m => handleProd(m))
          case ProdFun(l, r) =>
            handleCons(l)
            handleProd(r)
          case ProdVar(uid, n) =>
            upperBounds += uid -> (emptyPathDeadCodeCons.toStrat() :: upperBounds(uid))
            lowerBounds(uid).foreach(l => handleProd(l))
        }
    }
    def handleCons(c: ConsStrat): Unit = {
      if cacheCons.add(c) then
        c.s match {
          case DeadCodeCons() => ()
          case NoCons() => ()
          case dtorType@Destruct(ds) => {
            if this.isRealCtorOrDtor(dtorType.euid) then
              dtorSources += dtorType -> (dtorSources(dtorType) + emptyPathDeadCodeProd)
            ds.foreach { case Destructor(_, args) => args.foreach(a => handleCons(a)) }
          }
          case ConsVar(uid, n) =>
            lowerBounds += uid -> (emptyPathDeadCodeProd.toStrat() :: lowerBounds(uid))
            upperBounds(uid).foreach(u => handleCons(u))
          case ConsFun(l, r) =>
            handleCons(r)
            handleProd(l)
        }
    }
    varsName.keys.foreach { uid =>
      if upperBounds(uid).isEmpty then
        upperBounds += uid -> (emptyPathDeadCodeCons.toStrat() :: upperBounds(uid))
        lowerBounds(uid).foreach(l => handleProd(l))
      if lowerBounds(uid).isEmpty then
        lowerBounds += uid -> (emptyPathDeadCodeProd.toStrat() :: lowerBounds(uid))
        upperBounds(uid).foreach(u => handleCons(u))
    }
  }

}


object Deforest {
  lazy val lumberhackKeywords: Set[String] =
    (lumberhackIntFun ++ lumberhackIntBinOps ++ lumberhackBoolBinOps ++ lumberhackBoolUnaryOps ++ lumberhackPolyOps
      ++ lumberhackFloatBinOps ++ lumberhackFloatUnaryOps)
      + "string_of_int" + "int_of_char" + "char_of_int" + "ceiling" + "float_of_int" + "int_of_float" + "string_of_float"
      + "primitive" + "primId" + "error" + "lazy" + "force" + "lumberhack_obj_magic" + "from_large_str"
      + "z_of_int" + "z_to_int" + "z_of_string" + "string_of_z" + "internal_tmp_error_for_patmat_ast_conversion"
  lazy val lumberhackPolyOps: Set[String] = Set("polyEq", "polyLt", "polyGt", "polyLeq", "polyGeq", "polyNeq")
  lazy val lumberhackBinOps = lumberhackIntBinOps ++ lumberhackBoolBinOps ++ lumberhackFloatBinOps
  lazy val lumberhackIntFun: Set[String] = lumberhackIntValueFun ++ lumberhackIntComparisonFun
  lazy val lumberhackIntValueFun: Set[String] = Set("add", "minus", "mult", "div", "mod", "z_add", "z_sub", "z_mul", "z_div", "z_mod")
  lazy val lumberhackIntComparisonFun: Set[String] = Set("eq", "lt", "gt", "leq", "geq", "neq", "z_equal", "z_lt", "z_gt", "z_leq", "z_geq")
  lazy val lumberhackIntBinOps: Set[String] = lumberhackIntValueBinOps ++ lumberhackIntComparisonOps
  lazy val lumberhackIntValueBinOps: Set[String] = Set("+", "-", "*", "/", "%", "mod")
  lazy val lumberhackIntComparisonOps: Set[String] = Set("==", ">", "<", ">=", "<=", "/=")
  lazy val lumberhackBoolBinOps: Set[String] = Set("&&", "||")
  lazy val lumberhackBoolUnaryOps: Set[String] = Set("not")
  lazy val lumberhackFloatBinOps: Set[String] = Set("+.", "-.", "*.", "/.", "**")
  lazy val lumberhackFloatUnaryOps: Set[String] = Set("sqrt", "tan", "sin", "cos")

}