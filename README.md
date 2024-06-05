# ICFP 2024 Artifact

Name: The Long Way to Deforestation: A Type Inference and Elaboration Technique for Removing Intermediate Data Structures

## Abstract

This artifact consists of an `sbt` project with a
Scala implementation of Lumberhack as introduced in the
corresponding paper. Lumberhack aims to improve the efficiency
of programs by eliminating intermediate data structures.
We provide a test suite containing
all the examples in the paper and all the `nofib` benchmarks
we have ported and presented in the paper. Related
scripts in bash, R and Python to generate the figures and tables
in the paper are also contained in this artifact.

## Artifact Instructions

### Setting up the Artifact

- Using the Docker Image
  
  We have built Docker images containing all necessary dependencies
  compiled for both `amd64` and `arm64` platforms and
  exported them to archived files.
  One can load the `amd64` image and launch a container with the following command:

  ```
  docker load -i lumberhack-docker-amd64.tar
  docker run -it --rm lumberhack/lumberhack-docker:v0-amd64
  ```
  
  If one wants to use the `arm64` image, the commands are:
  
  ```
  docker load -i lumberhack-docker-arm64.tar
  docker run -it --rm lumberhack/lumberhack-docker:v0-arm64
  ```
  
  The user will be attached to the shell of the container after the image gets
  pulled and the container is launched.
  Please `cd` to `lumberhack/` and launch the SBT shell by typing `sbt`.

- Setting up from Scratch

  1. **To compile the project and run the tests**: you need [JDK (≥11) supported by Scala][supported-jdk-versions], [`sbt`][sbt], [`java-tree-sitter`][java-tree-sitter] (Java binding of tree-sitter)
  and [`tree-sitter-haskell`][tree-sitter-haskell] (Haskell syntax for tree-sitter). `java-tree-sitter` and `tree-sitter-haskell` are needed to
  parse input Haskell programs into our core language AST so that Lumberhack can perform optimization on them.

      We recommend you install JDK and `sbt` via [coursier][coursier].

      Then, install `java-tree-sitter` (including its submodules) and `tree-sitter-haskell` by cloning them from GitHub.
      After that, some modifications are needed before we start to compile the tree-sitter library due to some compatibility issues.
      The changes are:
      - Enabling c++ compilation for `java-tree-sitter` (explained at point 3 from [this PR](https://github.com/serenadeai/java-tree-sitter/pull/18)).
      This can be done by executing
        ```sh
        sed -i "s/if cpp/if cpp or True/g" ./build.py
        ```
        at the root directory of `java-tree-sitter`
      - Checking out to commit `b6ec26f181dd059eedd506fa5fbeae1b8e5556c8` for `tree-sitter-haskell`

      After the above changes are made, run at the root directory of `java-tree-sitter`:
      ```sh
      ./build.py -o libjava-tree-sitter-haskell -v ../tree-sitter-haskell
      ``` 
      to compile the dynamic library. Then copy the output file to
      `java.library.path` (which can be shown by executing `java -XshowSettings:properties`).
      On linux machine, this can be done by the following command because `/lib` should be a
      `java.library.path`.
      ```sh
      cp ./libjava-tree-sitter-haskell.so /lib/libjava-tree-sitter-haskell.so
      ```

      After installing the prerequisites, change your working directory to the root of this repository and
      launch the SBT shell by typing `sbt` in the terminal.

  2. **To compile the output OCaml programs and run the benchmarks**: you need the
  [optimizing OCaml compiler flambda][flambda] (the version we use is 5.0.0),
  the library [core_bench][core_bench] and [zarith][zarith].

      We recommend you install the above dependencies via `opam`:
      ```sh
      opam switch create artifact --packages=ocaml-variants.5.0.0+options,ocaml-option-flambda -y
      eval $(opam env)
      opam install zarith core_bench -y
      ```

  3. **To generate the plots we used in the paper**: you need [R (≥3.5)][R] and
  R packages [ggplot2][ggplot2], [RColorBrewer][RColorBrewer], [gridExtra][gridExtra].

      After installing R, run the following command in your shell to install the required packages:
      ```sh
      R -e "install.packages(c('RColorBrewer', 'ggplot2', 'gridExtra'), repos='http://cran.rstudio.com/')"
      ```


  [supported-jdk-versions]: https://docs.scala-lang.org/overviews/jdk-compatibility/overview.html
  [sbt]: https://www.scala-sbt.org/
  [coursier]: https://get-coursier.io/
  [java-tree-sitter]: https://github.com/serenadeai/java-tree-sitter
  [tree-sitter-haskell]: https://github.com/tree-sitter/tree-sitter-haskell
  [flambda]: https://opam.ocaml.org/packages/ocaml-option-flambda/#
  [core_bench]: https://opam.ocaml.org/packages/core_bench/
  [zarith]: https://opam.ocaml.org/packages/zarith/
  [R]: https://www.r-project.org/
  [ggplot2]: https://cran.r-project.org/web/packages/ggplot2/index.html
  [gridExtra]: https://cran.r-project.org/web/packages/gridExtra/index.html
  [RColorBrewer]: https://cran.r-project.org/web/packages/RColorBrewer/index.html



### Evaluation Instructions

This section describes how to run Lumberhack and its generated OCaml program, as well as
how to generate the plots and tables we used in the paper. For the correspondence
between this artifact and the paper, please refer to [the section below](#correspondence-with-the-paper).

- To perform and test Lumberhack's optimization on the `nofib` benchmarks we presented in the paper:

  run the following command in your shell:
  ```sh
  sbt 'testOnly mlscript.lumberhack.DiffTestLumberhack'
  ```
  This will start the `sbt` shell and execute the `sbt` command `testOnly mlscript.lumberhack.DiffTestLumberhack`.
  Alternatively, you can start `sbt` shell first and then execute manually the command `testOnly mlscript.lumberhack.DiffTestLumberhack`.

  The output OCaml programs will be located in `new-nofib-ocaml-gen`, grouped by sub-directories following their names.
  These sub-directories contain both the unoptimized programs and the optimized ones, and each of the sub-directories also includes a `main.ml` that contains codes
  utilizing OCaml's benchmark library [`core_bench`](https://opam.ocaml.org/packages/core_bench/) to
  benchmark both the original program and the optimized ones and show the execution time and GC data.

  After OCaml programs are generated, run the following command
  to compile them using `flambda` and execute them.
  ```sh
  ./bench.sh
  ```
  The raw output from `core_bench` about the execution stats and the compiled
  binary size information will be printed to stdout, `plot/time.txt` and `plot/size.txt`.
  
  **NOTE**: some programs require longer running duration to enable `core_bench` to report
  reliable 95% confidence intervals, and their test durations
  are adjusted accordingly in `bench.sh` based on the results of
  executing the tests from the authors' machines
  (at the current setting, benchmarking all the 38 programs should finish within around 3 hours).
  Depending on the machine executing the tests, the numbers may need to be further adjusted.
  To make the adjustment, modify `bench.sh` and add an `elif` case after line 35:
  ```sh
  ...
  elif [ "$dir" = "<benchmark_name>" ]
  then
    c=$cmd" -q"" <duration_in_seconds>"
  ...
  ```

- To test output OCaml benchmark programs individually:
  `cd` to the corresponding sub-directory in `new-nofib-ocaml-gen`
  and run the following command to show the suggested command for
  compiling and running the generated OCaml programs.
  ```sh
  echo $(head -2 ./main.ml | tail -1)
  ```
  The suggested command is composed of two commands, the first
  compiles the OCaml programs using `ocamlopt -O3` to produce
  an executable `<benchmark_name>.out`, the second launches
  the generated executable: `./<benchmark_name>.out +time`.
  The `+time` flag tells `core_bench` to measure the
  95% confidence interval. The default benchmarking
  duration is 10 seconds, and it can be changed by passing
  `-q <time_in_seconds>` to the executable. More options
  are also provided by `core_bench`, and they can be listed by
  running `./<benchmark_name>.out --help`.
  

- To write one's own programs and test Lumberhack's optimization on them:
  
  The testing infrastructure (DiffTest) for Lumberhack's `sbt` project is set up so that
  if there are any unstaged changes (as determined by `git`) in any test file
  (those in `lumberhack/shared/src/test/resources`), only the corresponding files will be processed.
  So one can make selected modifications to some test files and run the test command (`testOnly mlscript.lumberhack.DiffTestLumberhack`) again in `sbt` shell,
  and only your modified tests will be run.
  There is a `lumberhack/shared/src/test/resources/PaperExamples.mls` file with examples for you to start editing
  and getting new results from Lumberhack.

  Test output (program after expansion, producer/consumer matches and program after optimization)
  is inserted **in place** in the test file after each corresponding block, as comments beginning with `//│`.
  This makes it very easy and convenient to see the test results for each code block.
  For this reason, we recommend using an editor that automatically reloads open files on changes.
  VSCode and Sublime Text work well for this.
  
  To let Lumberhack also generate OCaml programs in addition to inserting the output
  to the test files, a DiffTest flag `:lhGenOCaml` is needed to
  be inserted at the first line of the input program. Also, a function
  with name `test<benchmark_name>` accepting exactly one parameter should
  be defined and called in the top level of the input program. The call to that
  function should follow the form `test<benchmark_name>(primId(arg))`, where
  `primId` is needed to ensure that the data produced by `arg`, which is meant
  to be the unknown input at compile time, will not be fused by Lumberhack.
  There are examples in `lumberhack/shared/src/test/resources/PaperExamples.mls`
  for your reference.

  Currently, we support input programs using
  a subset of either MLscript syntax ([explained below](#supported-mlscript-syntax)) or
  Haskell syntax (so that we can port the `nofib` benchmarks).
  We recommend using MLscript syntax to manually write programs as inputs to Lumberhack, because
  the generated output tends to be more readable due to less name mangling.

  - The supported MLscript syntax is [described below](#supported-mlscript-syntax).
    We also implemented the example programs we described in the paper using
    this syntax in `lumberhack/shared/src/test/resources/PaperExamples.mls`.
    One can refer to that for a general idea of the MLscript syntax.
  - The Haskell syntax is supported to the extent that suffices to enable us to port the related
    `nofib` benchmarks. In the list below (including but not limited to),
    we outline some unsupported Haskell features that are more related to programs
    testing a deforestation optimizer.
    During the porting, these are manually desugared to more elementary language
    constructs.
      - the "as" pattern: `ls@(x:xs)`
      - lambda definition with patterns as its parameters: `\(x:xs) -> ...`
      - `let` groups: `let a = x; b = x in ...`
      - `let` bindings with patterns as its binder: `let (x:xs) = [1] in ...`
      - `where` clauses that refer to variables defined at the outer scope: `f x = g x where g _ = x`
    
    One can also refer to the programs we have ported
    (located in `lumberhack/shared/src/test/resources/nofib_benchmarks`) for more
    detail. When a Haskell program is provided as input for Lumberhack in a DiffTest
    `.mls` file, a DiffTest flag `:lhInHaskell` is needed to be inserted at the first line
    of the input Haskell program.

  Note that Lumberhack ignores definitions that are never used.
  So, for example, Lumberhack will *not* do anything to the following
  input program:
  ```
  let rec map(f, xs) = if xs is
    Nil then Nil
    Cons(x, xs) then Cons(f(x), map(f, xs))
  let main(ls) = map(x => x * 2, map(x => x + 1, ls))
  ```
  If we refer to `main` in the top-level expression like below, Lumberhack will work.
  ```
  let rec map(f, xs) = if xs is
    Nil then Nil
    Cons(x, xs) then Cons(f(x), map(f, xs))
  let main(ls) = map(x => x * 2, map(x => x + 1, ls))
  main
  ```
  Also, due to how DiffTest works, the input programs cannot contain any empty lines.

- To generate plots in the paper:

  After the execution of `bench.sh`, `plot/time.txt` and `plot/size.txt`
  should be ready. Then run
  ```bash
  ./plot.sh
  ```
  The scripts in `plot/` will be automatically called, and the plots
  will be generated as `plot/size.pdf` and `plot/time.pdf`. `plot/size.csv` and `plot/time.csv`
  will also be generated along the way as intermediate files, which
  collect information in `csv` format from the raw outputs from `core_bench`.

  Additionally, to generate the tables (in `csv` format) we present in Appendix D
  (table 1 and table 2), run
  ```sh
  ./table.sh
  ```


### Correspondence with the Paper

- All the examples shown throughout the paper are presented in MLscript syntax in `lumberhack/shared/src/test/resources/PaperExamples.mls`.

- After `./bench.sh` successfully finishes, `./plot.sh` will output Fig. 8 and Fig. 9
  in section 6.3 Analysis of Results.

- An `csv` table aggregating the data in Table 1 and Table 2 in Appendix D can be generated
  by `./table.sh`.



## Supported MLscript Syntax

- Function definition
  ```
  let f(param1, param2) = ...
  ```
  This defines a non-recursive function `f` taking two parameters `param1`.
  and `param2`.
  
  Function and variable names should start with non-capitalized letters.
  To define a recursive function, use `let rec f(param1, param2) = ...`.

- Lambda definition
  ```
  x => body
  ```
  This defines a lambda function taking `x` as its parameter with `body` as its body.

- Function call
  ```
  f(arg1, arg2)
  ```
  This calls the function `f` with two arguments `arg1` and `arg2`

- `let` binding
  ```
  let x = rhs in body
  ```
  This binds the value of `rhs` to the variable `x`, which will be visible in `body`.
  To define recursive `let rec` bindings, use `let rec x = rhs in body`.

- Data constructor calls
  ```
  Cons(arg1, arg2)
  Nil
  ```
  The first line creates a `Cons` data structure with `arg1` and `arg2` as its arguments.
  The second line creates a `Nil` data structure, which takes no argument.
  Data constructor names should start with capitalized letters.

- Pattern matching
  ```
  if x is
    Cons(h, t) then branch1
    Nil then branch2
  ```
  The above MLscript program shares the same semantics with the following OCaml program:
  ```OCaml
  match x with
    | `Cons(h, t) -> branch1
    | `Nil -> branch2
  ```
  **NOTE**: we do not support nested patterns for input programs written in the MLscript syntax

- Integer and operations on integers are totally conventional

- Special symbols
  - `primitive` stands for any code that is unknown or irrelevant for Lumberhack
  - `primId`: this "primitive identity" annotation takes one argument
     and prevents Lumberhack from fusing values produced by its argument with the rest of the program
     by treating its argument as something unknown.
     It is usually used by us to mark the input of programs.



## Additional Artifact Description

In this artifact, the implementation of Lumberhack is presented together with MLscript,
a nascent functional programming language intended for real-world usage. This allows
Lumberhack to leverage the DiffTests utility implemented for MLscript.
Additionally, this also enables Lumberhack to use the lexer and parser for MLscript,
such that MLscript programs can be taken as inputs for Lumberhack.
Although the support for generating MLscript programs is not available yet, it is
anticipated that Lumberhack will be integrated into the MLscript compiler in the future.

The implementation of Lumberhack is self-contained, meaning that there is no dependency
on MLscript after input MLscript programs are translated into Lumberhack's core AST.
The `shared` directory contains the sources for MLscript, and
the sources for Lumberhack are located in `lumberhack`,
whose project structure is illustrated as follows.

- `lumberhack/shared/src/main/scala/CodeGen.scala` contains the implementation of the
  translation from Haskell's parse tree from tree-sitter to Lumberhack's AST.
  The implementation of the generation of OCaml programs from the optimized programs in Lumberhack's core AST is also implemented in this file.

- `lumberhack/shared/src/main/scala/Deforest.scala` contains the implementation of Lumberhack's
  fusion strategy inference algorithm.

- `lumberhack/shared/src/main/scala/Expr.scala` contains the implementation of Lumberhack's core Language AST.

- `lumberhack/shared/src/main/scala/Main.scala` contains a dummy implementation of the entry point function
  for Lumberhack, because currently Lumberhack takes its inputs solely from the DiffTest files located
  in `lumberhack/shared/src/test/resources`.
  
  The overall workflow of Lumberhack can be found at
  `lumberhack/shared/src/test/scala/DiffTestLumberhack.scala`.

- `lumberhack/shared/src/main/scala/Rewrite.scala` contains the implementation of
  Lumberhack's transformation, including expansion, fusion and floating-out.

- `lumberhack/shared/src/main/scala/Uid.scala` contains the implementation of a `Uid` class
  which helps the assignment of unique id to expressions, type variables and identifiers.

- `lumberhack/shared/src/main/scala/utils/Document.scala` contains the implementation of a `Document`
  class and several helper functions that facilitate the pretty printing of programs.
