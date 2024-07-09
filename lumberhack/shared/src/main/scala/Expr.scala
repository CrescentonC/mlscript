package mlscript
package lumberhack

import mlscript.utils.*, shorthands.*
import lumberhack.utils.*
import scala.collection.mutable.Map as MutMap

case class Ident(isDef: Bool, tree: Var, uid: Uid[Ident]) {
  def pp(using config: PrettyPrintConfig): Str = s"${tree.name}${if config.showIuid then s"${toSuperscript(uid.toString)}" else ""}"
  def copyToNewDeforest(using newd: Deforest): Ident = newd.nextIdent(isDef, tree)
}
case class ProgDef(id: Ident, body: Expr)
case class Program(contents: Ls[ProgDef \/ Expr])(using val d: Deforest) extends ProgramRewrite {
  d.prgm = Some(this)
  private def takeParamsOut(e: Expr): List[Ident] -> Expr = e match {
    case Expr.Function(p, b) => takeParamsOut(b).mapFirst(p :: _)
    case _ => Nil -> e
  }
  def pp(using config: PrettyPrintConfig): Str =
    contents.sortBy{
      case Left(pdef) => pdef.id.pp(using InitPpConfig)
      case Right(expr) => ""
    }.map {
      case L(pd) =>
        val (params, body) = takeParamsOut(pd.body)
        s"def ${pd.id.pp(using InitPpConfig)}${
          val ps = params.map(_.pp).mkString(", ")
          if ps.nonEmpty then s"($ps)" else ""
        } = ${body.pp}"
      case R(e: Expr.LetIn) => e.pp.linesIterator.filter(_.nonEmpty).map(_.drop(1)).mkString("\n")
      case R(e) => e.pp
    }.mkString("\n")
  
  
  lazy val defAndExpr: (Map[Ident, Expr], List[Expr]) = contents.partitionMap(identity).mapFirst(_.map(pd => pd.id -> pd.body).toMap)


  lazy val usedDefs: Set[Ident] = {
    def getAllCalls(calls: Set[Ident]): Set[Ident] = {
      val newCalls = this.d.callsInfo._2.filterKeys(id => calls(id)).values.flatten.map(_.id).toSet ++ calls
      if newCalls.size == calls.size then calls else getAllCalls(newCalls)
    }
    getAllCalls(this.d.callsInfo._1.map(_._1).toSet)
  }


  lazy val topLevelDefsOrder: List[List[Ident]] = {
    val callGraph = d.callsInfo._2.map(_.mapSecond(_.map(_.id))).toMap
    var nextIndex = 0
    val indecies = MutMap.empty[Ident, Int]
    val lowlinks = MutMap.empty[Ident, Int]
    var stack: List[Ident] = Nil
    val onStack = scala.collection.mutable.Set.empty[Ident]
    def getCurrentScc(i: Ident)(acc: List[Ident]): List[Ident] = {
      val h :: t = stack : @unchecked
      stack = t
      onStack.remove(h)
      if h != i then
        getCurrentScc(i)(h :: acc)
      else
        h :: acc
    }
    def dfs(i: Ident)(res: List[List[Ident]]): List[List[Ident]] = {
      indecies += i -> nextIndex
      lowlinks += i -> nextIndex
      nextIndex += 1
      stack = i :: stack
      onStack += i
      val tmpRes = callGraph(i).foldLeft(res) { case acc -> w =>
        if !indecies.contains(w) then
          val tmp = dfs(w)(acc)
          lowlinks(i) = lowlinks(i).min(lowlinks(w))
          tmp
        else if onStack.contains(w) then
          lowlinks(i) = lowlinks(i).min(indecies(w))
          acc
        else
          acc
      }
      if lowlinks(i) == indecies(i) then
        getCurrentScc(i)(Nil) :: tmpRes
      else
        tmpRes
    }

    d.callsInfo._1.foldLeft[List[List[Ident]]](Nil) { case acc -> r =>
      if !indecies.contains(r.id) then
        dfs(r.id)(acc)
      else
        acc
    }.reverse
  }
}

object Program {
  def fromPgrm(p: Pgrm)(using d: Deforest): Program = {
    val (_, (typeDefs, stmts)) = p.desugared
    given ctx: Expr.Ctx = d.lumberhackKeywordsIds ++ stmts.iterator.collect {
      case Def(_, nme, _, _) => nme.name -> d.nextIdent(true, nme)
    } |> (_.toMap)
    Program(stmts.map {
      case t: Term => R(Expr.fromTerm(t)(using d, ctx, None))
      case Def(_, nme, L(rhs), _) =>
        L(ProgDef(ctx(nme.name), Expr.fromTerm(rhs)(using d, ctx, Some(ctx(nme.name)))))
      case t => throw new Exception("unsupported: " + t)
    })
  }
}

trait RefTrait { this: Expr.Ref =>
  override def equals(x: Any): Boolean = x match {
    case r@Expr.Ref(otherId) => this.id == otherId && this.uid == r.uid
    case _ => false
  }
  override def hashCode(): Int = (this.id, this.uid).hashCode()
}
trait FunctionTrait { this: Expr.Function =>
  lazy val takeParamsOut: List[Ident] -> Expr = (this.body match {
    case f: Expr.Function => f.takeParamsOut
    case b => Nil -> b
  }).mapFirst(this.param :: _)
}

trait CallTrait { this: Expr.Call =>
  // NOTE: the order of arguments is reversed
  lazy val takeArgumentsOut: Expr -> List[Expr] = (this.lhs match {
    case c: Expr.Call => c.takeArgumentsOut
    case other => other -> Nil
  }).mapSecond(args => rhs :: args)
}
enum Expr(using val deforest: Deforest, val inDef: Option[Ident]) extends ExprRewrite {
  case Const(lit: Lit)(using Deforest, Option[Ident])
  case Ref(id: Ident)(using Deforest, Option[Ident]) extends Expr with RefTrait
  case Call(lhs: Expr, rhs: Expr)(using Deforest, Option[Ident]) extends Expr with CallTrait
  case Ctor(name: Var, args: Ls[Expr])(using Deforest, Option[Ident])
  case LetIn(id: Ident, rhs: Expr, body: Expr)(using Deforest, Option[Ident])
  case LetGroup(defs: Map[Ident, Expr], body: Expr)(using Deforest, Option[Ident])
  case Match(scrut: Expr, arms: Ls[(Var, Ls[Ident], Expr)])(using Deforest, Option[Ident])
  case IfThenElse(scrut: Expr, thenn: Expr, elze: Expr)(using Deforest, Option[Ident])
  case Function(param: Ident, body: Expr)(using Deforest, Option[Ident]) extends Expr with FunctionTrait
  case Sequence(fst: Expr, snd: Expr)(using Deforest, Option[Ident])
  
  type MultiLineExprs = LetIn | Sequence | LetGroup

  val uid: Uid[Expr] = deforest.euid.nextUid
  deforest.exprs += uid -> this
  
  private def getAllCallParams(c: Call): Expr -> List[Expr] = {
    c.lhs match {
      case cc: Call => getAllCallParams(cc).mapSecond(_ ::: (c.rhs :: Nil))
      case _ => c.lhs -> (c.rhs :: Nil)
    }
  }
  def pp(using config: PrettyPrintConfig): Str =
    val res: fansi.Str = (if (config.showEuid) Console.CYAN + uid.toString + ": " + Console.RESET else "") + (
      this match
        case Const(lit) => Console.YELLOW + lit.idStr + Console.RESET
        case Ref(id) => if id.isDef
          then id.tree.name + (if config.showRefEuid then s"^$uid" else "")
          else id.pp
        case Call(Call(Ref(Ident(_, Var(op), _)), fst), snd) if Deforest.lumberhackBinOps(op) => s"(${fst.pp} $op ${snd.pp})"
        case c: Call =>
          val (f, ps) = getAllCallParams(c)
          s"${f.pp}(${ps.map(_.pp).mkString(", ")})"
        case Sequence(fst, snd) if config.multiline =>
          val sndStr = snd match {
            case b: MultiLineExprs => b.pp.dropWhile(c => c == '\n' || c.isWhitespace)
            case _ => {
              val res = snd.pp
              val resLines = res.linesIterator.toSeq
              if resLines.length > 1 then {
                resLines.map("\t" + _).mkString("\n").dropWhile(c => c == '\n' || c.isWhitespace)
              } else { res }
            }
          }
          s"\n\t${fst.pp}\n\t$sndStr"
        case Sequence(fst, snd) => s"${fst.pp}; ${snd.pp}"
        case Ctor(name, args) =>
          s"${Console.BLUE}[$name${Console.RESET}${args.map(" " + _.pp).mkString + Console.BLUE}]${Console.RESET}"
        case LetGroup(defs, body) if config.multiline => {
          val lets = ({
            val firstRhs = defs.head._2 match {
              case r: MultiLineExprs => r.pp.linesIterator.map("\t" + _).mkString("\n")
              case r => {
                val res = r.pp
                val resLines = res.linesIterator.toSeq
                if resLines.length > 1 then {
                  resLines.map("\t" + _).mkString("\n").dropWhile(c => c == '\n' || c.isWhitespace)
                } else { res }
              }
            }
            s"let ${defs.head._1.pp} = $firstRhs"
          } :: (defs.tail.map { case (d, rhs) =>
            val rhsStr = rhs match {
              case r: MultiLineExprs => rhs.pp.linesIterator.map("\t" + _).mkString("\n")
              case _ => {
                val res = rhs.pp
                val resLines = res.linesIterator.toSeq
                if resLines.length > 1 then {
                  resLines.map("\t" + _).mkString("\n").dropWhile(c => c == '\n' || c.isWhitespace)
                } else { res }
              }
            }
            s"and ${d.pp} = $rhsStr"
          }.toList)).mkString("\n").linesIterator.map("\t" + _).mkString("\n")
          val bodyStr = body match {
            case b: MultiLineExprs => b.pp.dropWhile(c => c == '\n' || c.isWhitespace)
            case _ => {
              val res = body.pp
              val resLines = res.linesIterator.toSeq
              if resLines.length > 1 then {
                resLines.map("\t" + _).mkString("\n").dropWhile(c => c == '\n' || c.isWhitespace)
              } else { res }
            }
          }
          s"\n$lets \n\tin $bodyStr"
        }
        case LetGroup(defs, body) => {
          "SINGLE_LINE_LET_GROUP_STUB"
        }
        case LetIn(id, rhs, body) if config.multiline => {
          val rhsStr = rhs match {
            case r: MultiLineExprs => rhs.pp.linesIterator.map("\t" + _).mkString("\n")
            case _ => {
              val res = rhs.pp
              val resLines = res.linesIterator.toSeq
              if resLines.length > 1 then {
                resLines.map("\t" + _).mkString("\n").dropWhile(c => c == '\n' || c.isWhitespace)
              } else { res }
            }
          }
          val bodyStr = body match {
            case b: MultiLineExprs => b.pp.dropWhile(c => c == '\n' || c.isWhitespace)
            case _ => {
              val res = body.pp
              val resLines = res.linesIterator.toSeq
              if resLines.length > 1 then {
                resLines.map("\t" + _).mkString("\n").dropWhile(c => c == '\n' || c.isWhitespace)
              } else { res }
            }
          }
          s"\n\t${Console.BOLD}let${Console.RESET} ${id.pp} = ${rhsStr}" + s"\n\t${Console.BOLD}in${Console.RESET} $bodyStr"
        }
        case LetIn(id, rhs, body) => s"${Console.BOLD}let${Console.RESET} ${id.pp} = ${rhs.pp}" + s"\n${Console.BOLD}in${Console.RESET} ${body.pp}"
        case Match(scrut, arms) if config.multiline => s"${Console.BOLD}case${Console.RESET} ${scrut.pp} ${Console.BOLD}of${Console.RESET} {${
          "\n\t" + arms.map { case (v, ids, e) =>
            s"${if ((v.name == "_" && ids.isEmpty) // wildcard pattern
                  || v.name.isCapitalized // normal pattern
                  || (v.name.matches("'.'") || v.name.toIntOption.isDefined) // literal pattern
                ) then Console.BLUE + v.name + Console.RESET + " " else ""}" +
            s"${ids.map(_.pp).mkString(" ")} => ${
              e.pp.linesIterator.map("\t" + _).mkString("\n").dropWhile(_ == '\t')
            }"
          }.mkString("\n\t| ")
        }}"
        case Match(scrut, arms) => s"${Console.BOLD}case${Console.RESET} ${scrut.pp} ${Console.BOLD}of${Console.RESET} {${
          arms.map { case (v, ids, e) =>
            s"${if ((v.name == "_" && ids.isEmpty) // wildcard pattern
                  || v.name.isCapitalized // normal pattern
                  || (v.name.matches("'.'") || v.name.toIntOption.isDefined) // literal pattern
                ) then Console.BLUE + v.name + Console.RESET + " " else ""}" +
            s"${ids.map(_.pp).mkString(" ")} => ${e.pp}"
          }.mkString(" | ")
        }}"
        case Function(param, body) => s"(${Console.BOLD}fun${Console.RESET} ${param.pp} -> ${body.pp})"
        case IfThenElse(scrut, thenn, elze) => 
          s"${Console.BOLD}if${Console.RESET} ${scrut.pp} ${Console.BOLD}then${Console.RESET} " +
          s"${thenn.pp} ${Console.BOLD}else${Console.RESET} ${elze.pp}"
    )
    res.plainText
  
}
object Expr {
  type Ctx = Map[Str, Ident]
  def fromStrLit(s: Str)(using deforest: Deforest, inDef: Option[Ident]): Ctor = s.headOption match {
    case Some(a) => Ctor(Var("LH_C"), Const(CharLit(a)) :: fromStrLit(s.tail) :: Nil)
    case None => Ctor(Var("LH_N"), Nil)
  }
  def fromTerm(t: Term)(using d: Deforest, ctx: Ctx, inDef: Option[Ident]): Expr = t match
    case Var(char) if char.matches("'.'") => Const(CharLit(char(1)))
    case StrLit(str) => fromStrLit(str)
    case lit: Lit => Const(lit)
    case v @ Var(nme) =>
      if (nme.isCapitalized) Ctor(v, Nil)
      else Ref(ctx(nme))
    case Lam(Tup((N -> Fld(false, false, v: Var)) :: args), b) =>
      val id = d.nextIdent(false, v)
      given Ctx = ctx + (v.name -> id)
      args match {
        case Nil => Function(id, fromTerm(b))
        case _ :: _ => Function(id, fromTerm(Lam(Tup(args), b)))
      }
    case App(v: Var, Tup(args)) if v.name.isCapitalized => Ctor(v, args.map(a => fromTerm(a._2.value)))
    case App(l, Tup((N -> Fld(_, _, a)) :: args)) => args.foldLeft(Call(fromTerm(l), fromTerm(a))) {
      case (c, (N -> Fld(_, _, a))) => Call(c, fromTerm(a))
      case _ => ???
    }
    case Let(false, name, rhs, body) =>
      val id = d.nextIdent(false, name) // TODO deforest local let bindings? false ~> true
      given Ctx = ctx + (name.name -> id)
      LetIn(id, fromTerm(rhs), fromTerm(body))
    case If(IfOpApp(lhs, Var("is"), IfBlock(lines)), N)
      if lines.forall { _ match {
        case L(IfThen(App(Var(ctor), Tup((N -> Fld(false, false, _: Var)) :: _)), _)) => ctor.isCapitalized
        case L(IfThen(Var(ctor), _)) => ctor != "Int" && ctor != "String"
        case L(IfThen(l: Lit, _)) => true
        case _ => false
      } } => Match(
        fromTerm(lhs),
        lines.map {
          case L(IfThen(App(ctorName: Var, Tup(args)), rhs)) => {
            val argMap = args.map { case (N -> Fld(false, false, a: Var)) => (a.name, d.nextIdent(false, a)); case _ => ??? };
            (ctorName, argMap.unzip._2, fromTerm(rhs)(using d, ctx ++ argMap))
          }
          case L(IfThen(name: Var, rhs)) if name.name.isCapitalized => (name, Nil, fromTerm(rhs))  // constructor with no field (including True and False)
          case L(IfThen(name: Var, rhs)) if name.name == "_" => (name, Nil, fromTerm(rhs))         // wildcard pattern
          case L(IfThen(name: Var, rhs)) if name.name.matches("'.'") =>                            // char literal pattern
            (name, Nil, fromTerm(rhs))
          case L(IfThen(name: Var, rhs)) =>                                                        // id pattern
            val newId = d.nextIdent(false, name)
            (Var("_"), newId :: Nil, fromTerm(rhs)(using d, ctx + (name.name -> newId)))
          // other literal pattern
          case L(IfThen(lit: Lit, rhs)) => lit match {
            case IntLit(value) => (Var(value.toString()), Nil, fromTerm(rhs))
            case _ => lastWords(s"unsupported pattern: ${lit}")
          }
          case _ => ???
        }
      )
    case If(IfThen(expr, rhs), S(elze)) =>
      IfThenElse(fromTerm(expr), fromTerm(rhs), fromTerm(elze))
    case Bra(false, t) => fromTerm(t)
    case Blk((e: Term) :: Nil) => fromTerm(e)
    case Blk((e: Term) :: t) => Sequence(fromTerm(e), fromTerm(Blk(t)))
    case Blk((NuFunDef(_, name, Nil, L(e))) :: t) =>
      val id = d.nextIdent(false, name) // TODO deforest local let bindings? false ~> true
      given Ctx = ctx + (name.name -> id)
      LetIn(id, fromTerm(e), fromTerm(Blk(t)))
      
    // single element tuple as brackets
    case Tup((N -> Fld(_, _, t)) :: Nil) => fromTerm(t)
    case _ => lastWords(s"unsupported: $t (${t.getClass})") // unsupported
}

