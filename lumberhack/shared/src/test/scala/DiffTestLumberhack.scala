package mlscript
package lumberhack

import mlscript.{DiffTests, ModeType, TypingUnit, Term, Pgrm}
import mlscript.utils.shorthands.Str
import mlscript.utils.*
import mlscript.codegen.Helpers.inspect as showStructure
import scala.collection.mutable.StringBuilder
import mlscript.lumberhack.utils.*
import scala.collection.mutable.Buffer

class DiffTestLumberhack extends DiffTests {
  import DiffTestLumberhack.*
  override val timeLimit = TimeLimit
  override protected lazy val files = allFiles.filter { file =>
    val fileName = file.baseName
    validExt(file.ext) && ((modified.isEmpty || modified(file.relativeTo(pwd))) || lumberhackLocalTest(fileName))
  }

  override def postProcess(
    mode: ModeType,
    basePath: List[Str],
    testName: Str,
    unit: TypingUnit,
    output: Str => Unit,
    prgmStr: Seq[String]
  ): Unit = {
    output(">>>>>>>>>> after expansion >>>>>>>>>>")

    val originalD = Deforest(mode.stdout)
    val (allowErr, evaluate, filteredEntities) = unit.entities match {
      case Var(flags) :: t if flags.startsWith("_LUMBERHACK") => (
        flags.contains("_LUMBERHACK_ERROR") || mode.lhError,
        flags.contains("_LUMBERHACK_EVAL") || mode.lhEval,
        t
      )
      case l => (mode.lhError, mode.lhEval, l)
    }
    try {
      val (originalProgram, newD) = if mode.lhInHaskell then
        val p = FromHaskell(prgmStr.mkString("\n"))(using Deforest(mode.stdout), output)
        p.d(p)
        val newp = p.copyToNewDeforestWithDeadDefElim
        newp.d(newp)
        val res = newp.expandedWithLimit(newp.contents.length * 2)
        res
      else
        val p = Program.fromPgrm(Pgrm(filteredEntities))(using originalD)
        p.d(p)
        val newp = p.copyToNewDeforestWithDeadDefElim
        newp.d(newp)
        val res = newp.expandedWithLimit(newp.contents.length * 2)
        res
      given d: Deforest = newD
      d.debug = mode.stdout || mode.verbose
      d(originalProgram)
      
      if mode.stdout || mode.verbose then {
        output(originalProgram.pp(using InitPpConfig.multilineOn.showIuidOn.showEuidOn)) 
      }
      output(originalProgram.pp(using InitPpConfig.multilineOn.showIuidOn))
      if mode.lhGenOCaml then
        output("\t\t---------- unoptimized ocaml gen ----------")
        val progStr = (new OCamlGenTests(true, mode))(originalProgram)
        output(progStr.linesIterator.map("\t\t" + _).mkString("\n"))
        output("\t\t---------- unoptimized ocaml gen ----------")


      output("<<<<<<<<<< after expansion <<<<<<<<<<")
    
      val deforestRes = fuser(using originalProgram, d, mode, evaluate, output)

      
      if mode.lhGenOCaml then
        output("\n>>>>>>>>>> Generated OCaml >>>>>>>>>>")
        val ocamlGen = new OCamlGenTests(true, mode)
        try {
          ocamlGen.makeBenchFilesSeparate((
            Some("original" -> {
              if mode.lhInHaskell then
                val p = FromHaskell(prgmStr.mkString("\n"))(using Deforest(mode.stdout), output);
                p.d(p)
                val newp = p.copyToNewDeforestWithDeadDefElim
                newp.d(newp)
                {
                  // output haskell code to some files
                  val benchName = (newp.defAndExpr._2 match {
                    case Expr.Call(Expr.Ref(test), Expr.Call(Expr.Ref(primId), _)) :: Nil
                      if test.tree.name.startsWith("test") && primId.tree.name == "primId" =>
                      test.tree.name.drop(4).filter(_ <= 0x7f).reverse.dropWhile(_ == '_').reverse // keep only valid ASCII characters, and drop the possibly last "_"
                    // with manually fuse tests
                    case Expr.Call(Expr.Ref(test), Expr.Call(Expr.Ref(primId1), arg1))
                      :: Expr.Call(Expr.Ref(testManual), Expr.Call(Expr.Ref(primId2), arg2))
                      :: Nil
                      if test.tree.name.startsWith("test") && primId1.tree.name == "primId"
                        && testManual.tree.name.startsWith("testManual") && primId1 == primId2
                        && arg1.pp(using InitPpConfig) == arg2.pp(using InitPpConfig) =>
                      test.tree.name.drop(4).filter(_ <= 0x7f).reverse.dropWhile(_ == '_').reverse // keep only valid ASCII characters, and drop the possibly last "_"
                    case _ => lastWords(
                      "benchmark requires a method of name `testxxx` calling a value wrapped in `primId`"
                        + "\n and if there are manually fused benchmarks, there should be a call to `testManual`"
                        + "with exact the same parameter following the `testxxx`"
                    )
                  }).emptyOrElse(newp.hashCode().toString())
                }
                newp
              else originalProgram
            }) ::
            (if mode.lhInHaskell then Some("lumberhack_only_expanded" -> originalProgram) else None) ::
            Some("lumberhack" -> deforestRes._1) :: 
            Some("lumberhack_float_out" -> deforestRes._1.floatOutLambdas._1) ::
            Nil
          ).flatten, mode.lhUseZarith)
          output("benchmark file generated")
        } catch { case e =>
          output(s"cannot generate benchmark files: ${e.getMessage()}\n")
          val progStr = ocamlGen(deforestRes._1)
          output(progStr)
        }
        output("<<<<<<<<<< Generated OCaml <<<<<<<<<<")

      if newD.errorTypes.nonEmpty then
        throw Exception(s"type error ${newD.errorTypes}")
      
      if allowErr then throw Exception("expect to fail but pass")
    } catch {
      case e => if allowErr then {
        output("!!!!!!ERROR!!!!!!")
        output(s"${e.toString()}")
        if mode.stdout || mode.verbose then {
          output(s"\n${e.getStackTrace().take(10).map(_.toString()).mkString("\n")}\n")
        }
        output("!!!!!!ERROR!!!!!!")
      } else { throw e }
    }
  }



  def fuser(
    using p: Program,
    d: Deforest,
    mode: ModeType,
    evaluate: Boolean,
    output: Str => Unit
  ): (Program, Deforest, FusionStrategy) = {
    d.resolveConstraints


    val fusionStrategy = FusionStrategy(d)
    if mode.stdout || mode.verbose then {
      output("\n>>>>>>> fusion matches >>>>>>>")
      output(fusionStrategy.ppCtorFinalDestinations)
      output("------------------")
      output(fusionStrategy.ppDtorFinalSources)
      output("<<<<<<< fusion matches <<<<<<<")
      output("\n>>>>>>> fusion matches >>>>>>>")
      output(fusionStrategy.ppCtorMap(fusionStrategy.finallyFilteredStrategies._1))
      output("------------------")
      output(fusionStrategy.ppDtorMap(fusionStrategy.finallyFilteredStrategies._2))
      output("<<<<<<< fusion matches <<<<<<<")
    }



    val prgmAfterFusion = p.rewrite(d, fusionStrategy)
    output("\n>>>>>>> after fusion >>>>>>>")
    output(prgmAfterFusion.floatOutLambdas._1.pp(using InitPpConfig.multilineOn.showIuidOn))
    output("<<<<<<< after fusion <<<<<<<")


    val newD = Deforest(mode.stdout || mode.verbose)
    val newP = prgmAfterFusion.copyDefsToNewDeforest(using newD)._1._1
    if mode.stdout || mode.verbose then {
      output("\n>>>>>>> program after copying to new deforest >>>>>>>")
      output(newP.pp(using InitPpConfig.multilineOn.showIuidOn))
      output("<<<<<<< program after copying to new deforest <<<<<<<")
    }
    newD(newP)

    (newP, newD, fusionStrategy)
  }

}

object DiffTestLumberhack {
  import org.scalatest.time._
  private val TimeLimit =
    if (sys.env.get("CI").isDefined) Span(25, Seconds)
    else Span(90, Seconds)
  private val pwd = os.pwd
  private val dir = pwd/"lumberhack"/"shared"/"src"/"test"/"resources"
  private val allFiles = os.walk(dir)
  private val validExt = Set("mls")
  private val modified: Set[os.RelPath] = DiffTests.findModifiedFiles(dir)
  private val lumberhackLocalTest = Set[Str]()
}

import mlscript.utils.shorthands.*
class OCamlGenTests(
  usePolymorphicVariant: Boolean,
  val mode: ModeType,
  backToBuiltInType: Boolean = false
) extends OCamlGen(usePolymorphicVariant, backToBuiltInType) {
  var largeStrIdents = scala.collection.mutable.Map.empty[String, Int]
  val largeStrPrefix = "lh_large_str_"
  override def handleLargeString(s: String): Document =
    val nextId = this.largeStrIdents.getOrElseUpdate(s, largeStrIdents.size)
    Raw(s"${largeStrPrefix}${nextId}")

  var largeIntIdents = scala.collection.mutable.Map.empty[String, Int]
  val largeIntPrefix = "lh_large_int_"
  override def handleLargeInt(s: String): Document =
    val nextId = this.largeIntIdents.getOrElseUpdate(s, largeIntIdents.size)
    Raw(s"${largeIntPrefix}${nextId}")

  def makeBenchFilesSeparate(programs: List[String -> Program], useZarith: Bool): Unit = {
    assert(mode.lhLessExpansion)
    assert(programs.length >= 2)
    assert(programs.head._1 == "original")
    val benchName = (programs.head._2.defAndExpr._2 match {
      case Expr.Call(Expr.Ref(test), Expr.Call(Expr.Ref(primId), _)) :: Nil
        if test.tree.name.startsWith("test") && primId.tree.name == "primId" =>
        test.tree.name.drop(4).filter(_ <= 0x7f).reverse.dropWhile(_ == '_').reverse // keep only valid ASCII characters, and drop the possibly last "_"
      // with manually fuse tests
      case Expr.Call(Expr.Ref(test), Expr.Call(Expr.Ref(primId1), arg1))
        :: Expr.Call(Expr.Ref(testManual), Expr.Call(Expr.Ref(primId2), arg2))
        :: Nil
        if test.tree.name.startsWith("test") && primId1.tree.name == "primId"
          && testManual.tree.name.startsWith("testManual") && primId1 == primId2
          && arg1.pp(using InitPpConfig) == arg2.pp(using InitPpConfig) =>
        test.tree.name.drop(4).filter(_ <= 0x7f).reverse.dropWhile(_ == '_').reverse // keep only valid ASCII characters, and drop the possibly last "_"
      case _ => lastWords(
        "benchmark requires a method of name `testxxx` calling a value wrapped in `primId`"
          + "\n and if there are manually fused benchmarks, there should be a call to `testManual`"
          + "with exact the same parameter following the `testxxx`"
      )
    }).emptyOrElse(programs.hashCode().toString())

    val longestNameSize = programs.maxBy(_._1.length)._1.length + "Module_".length + 1

    val commonFileString = (
      "Lumherhack_Common",
      s"""
module Lumherhack_Common = struct
let explode_string s = List.init (String.length s) (String.get s);;
let rec listToTaggedList s = match s with
  | h::t -> `LH_C(h, listToTaggedList(t))
  | [] -> `LH_N;;
let string_of_int i = listToTaggedList (explode_string (string_of_int i));;
let string_of_float f = listToTaggedList (explode_string (string_of_float f))
${if !useZarith then "end;;" else "let string_of_z z = listToTaggedList (explode_string (Z.to_string z));;\nend;;"}
"""
    )

    val largeStrFileString = {
      ("Lumberhack_LargeStr", "")
    }

    val originalDefsString = (programs.head._2.defAndExpr._2 match {
      case e :: Nil =>
        (
          "Module_original".padTo(longestNameSize, '_'),
          "\n(* original *)\n" +
          "open Lumherhack_Common.Lumherhack_Common;;\n" +
          "open Lumberhack_LargeStr.Lumberhack_LargeStr;;\n" +
          s"module ${"Module_original".padTo(longestNameSize, '_')}(LH_Dum: sig end): sig val run: unit -> int end = struct\n" +
          apply(
            Program(
              programs.head._2.contents.filter(_.isLeft)
            )(using programs.head._2.d),
            false
          ) +
          s"\nlet run () = 1 + (Obj.magic (${this.rec(e).print}));" +
          "\nend;;\n"
        )
      case e :: m :: Nil =>
        (
          "Module_original".padTo(longestNameSize, '_'),
          "\n(* original *)\n" +
          "open Lumherhack_Common.Lumherhack_Common;;\n" +
          "open Lumberhack_LargeStr.Lumberhack_LargeStr;;\n" +
          s"module ${"Module_original".padTo(longestNameSize, '_')}(LH_Dum: sig end): sig val run: unit -> int val run_manual: unit -> int end = struct\n" +
          apply(
            Program(
              programs.head._2.contents.filter(_.isLeft)
            )(using programs.head._2.d),
            false
          ) +
          s"\nlet run () = 1 + (Obj.magic (${this.rec(e).print}));" +
          s"\nlet run_manual () = 1 + (Obj.magic (${this.rec(m).print}));" +
          "\nend;;\n"
        )
      case _ => lastWords("unreachable")
    })
      
      

    val restMergedDefsString = programs.tail.map { case (name, prgm) =>
      (
        s"Module_$name".padTo(longestNameSize, '_'),
        (
          s"\n\n(* $name *)\n" +
          "open Lumherhack_Common.Lumherhack_Common;;\n" +
          "open Lumberhack_LargeStr.Lumberhack_LargeStr;;\n" +
          s"module ${s"Module_$name".padTo(longestNameSize, '_')}(LH_Dum: sig end): sig val run: unit -> int end = struct\n" +
          apply(
            Program(
              prgm.contents.filter {
                case Left(ProgDef(id, _)) => true
                case _ => false
              }
            )(using prgm.d),
            false
          ) +
          s"\nlet run () = 1 + (Obj.magic (${this.rec(prgm.defAndExpr._2.head).print}));" +
          "\nend;;\n"
        )
      )
    }

    val mainFileString = {
      val compileAndRunCommand = {
        val allFileNames =
          (commonFileString ::
          largeStrFileString ::
          originalDefsString ::
          restMergedDefsString).map("./" + _._1 + ".ml") :+ "./main.ml"
        "ocamlfind ocamlopt -rectypes -thread -O3 -w -A " +
        allFileNames.mkString(" ") +
        s" -o $benchName.out" +
        s" -linkpkg -package \"core_unix.command_unix\" -linkpkg -package \"core_bench\" "+
        (if useZarith then "-linkpkg -package \"zarith\" " else "") +
        s"&& ./$benchName.out +time"
      }
      
      val mainGen = {
        val benchRunGen =
          (programs.head._2.defAndExpr._2 match {
            case e :: Nil =>
              (s"original_${benchName}" ->
                s"let open ${val n = "Module_original".padTo(longestNameSize, '_'); s"$n.$n"}(struct end) in (run ())") :: Nil
            case e :: m :: Nil => List(
              (s"original_${benchName}" -> s"let open ${val n = "Module_original".padTo(longestNameSize, '_'); s"$n.$n"}(struct end) in (run ())"),
              (s"manual_${benchName}" -> s"let open ${val n = "Module_original".padTo(longestNameSize, '_'); s"$n.$n"}(struct end) in (run_manual ())")
            )
            case _ => lastWords("unreachable")
          }) ++
          (programs.tail.map { case (name, prgm) =>
            s"${name}_${benchName}" -> s"let open ${val n = s"Module_$name".padTo(longestNameSize, '_'); s"$n.$n"}(struct end) in (run ())"
          })
          
        stack(
          Raw("Command_unix.run (Bench.make_command ["),
          Indented(Stacked(
            benchRunGen.map { case (name, doc) =>
              Raw(s"Bench.Test.create ~name:\"$name\" (fun () -> ignore ($doc));")
            },
            false
          )),
          Raw("])")
        )
      }

      (
        "main",
        Stacked(
          Raw(s"(*\n$compileAndRunCommand\n*)") ::
          Raw("open Core_bench;;") ::
          mainGen ::
          Nil,
          false
        ).print
      )
    }

    val mainFileStringReversed = {
      val compileAndRunCommand = {
        val allFileNames =
          (commonFileString ::
          largeStrFileString ::
          originalDefsString ::
          restMergedDefsString).map("./" + _._1 + ".ml") :+ "./mainRev.ml"
        "ocamlfind ocamlopt -rectypes -thread -O3 -w -A " +
        allFileNames.mkString(" ") +
        s" -o ${benchName}Rev.out" +
        s" -linkpkg -package \"core_unix.command_unix\" -linkpkg -package \"core_bench\" "+
        (if useZarith then "-linkpkg -package \"zarith\" " else "") +
        s"&& ./${benchName}Rev.out +time"
      }
      
      val mainGen = {
        val benchRunGen =
          (programs.tail.map { case (name, prgm) =>
            s"${name}_${benchName}" -> s"let open ${val n = s"Module_$name".padTo(longestNameSize, '_'); s"$n.$n"}(struct end) in (run ())"
          }).reverse ++
          (programs.head._2.defAndExpr._2 match {
            case e :: Nil =>
              (s"original_${benchName}" ->
                s"let open ${val n = "Module_original".padTo(longestNameSize, '_'); s"$n.$n"}(struct end) in (run ())") :: Nil
            case e :: m :: Nil => List(
              (s"original_${benchName}" -> s"let open ${val n = "Module_original".padTo(longestNameSize, '_'); s"$n.$n"}(struct end) in (run ())"),
              (s"manual_${benchName}" -> s"let open ${val n = "Module_original".padTo(longestNameSize, '_'); s"$n.$n"}(struct end) in (run_manual ())")
            )
            case _ => lastWords("unreachable")
          })
        stack(
          Raw("Command_unix.run (Bench.make_command ["),
          Indented(Stacked(
            benchRunGen.map { case (name, doc) =>
              Raw(s"Bench.Test.create ~name:\"$name\" (fun () -> ignore ($doc));")
            },
            false
          )),
          Raw("])")
        )
      }

      (
        "mainRev",
        Stacked(
          Raw(s"(*\n$compileAndRunCommand\n*)") ::
          Raw("open Core_bench;;") ::
          mainGen ::
          Nil,
          false
        ).print
      )
    }

    import sys.process.*
    import java.io._
    val pathPrefix = if benchName.contains("_nofib") then s"./new-nofib-ocaml-gen/$benchName" else s"./ocaml-gen/$benchName"
    s"mkdir -p $pathPrefix".!
    (commonFileString ::
    (
      "Lumberhack_LargeStr",
      {
        val largeStrDefs = this.largeStrIdents.map { case (s, id) =>
          s"let ${largeStrPrefix}${id} = listToTaggedList (explode_string \"${s}\");;"
        }.mkString("\n")
        val largeIntDefs = this.largeIntIdents.map { case (i, id) =>
          s"let ${largeIntPrefix}${id} = Z.of_string \"$i\";;"
        }.mkString("\n")
        "open Lumherhack_Common.Lumherhack_Common;;\n" +
        s"module Lumberhack_LargeStr = struct\n$largeStrDefs\n${if largeIntDefs.isEmpty() then "" else largeIntDefs + "\n"}" +
        s"${if this.usePolymorphicVariant then "end" else (generateTypeInfo(programs.head._2.d) + "\nend")};;\n"
      }
    ) ::
    originalDefsString ::
    restMergedDefsString :::
    (mainFileString :: Nil)).foreach { case (fileName, fileContent) =>
      val fw = new FileWriter(s"$pathPrefix/$fileName.ml", false)
      fw.write(fileContent + "\n")
      fw.close()
    }
  }
}
