# ICFP 2024 Artifact

Name: The Long Way to Deforestation: A Type Inference and Elaboration Technique for Removing Intermediate Data Structures

## Artifact Instructions

### Setting up the Artifact

- Using the Docker Image
  
  TODO:

- Setting up from Scratch

  You need [JDK supported by Scala][supported-jdk-versions], [sbt][sbt], [`java-tree-sitter`][java-tree-sitter] (Java binding of tree-sitter)
  and [`tree-sitter-haskell`][tree-sitter-haskell] (Haskell syntax for tree-sitter)
  to compile the project and run the tests. The `java-tree-sitter` and `tree-sitter-haskell` is needed to
  parse input Haskell programs into our core language AST so that Lumberhack can perform optimization on them.

  We recommend you to install JDK and `sbt` via [coursier][coursier].

  After cloning the `java-tree-sitter` and `tree-sitter-haskell` from GitHub,
  some modifications are needed before we start to compile the tree-sitter library due to some compatibility issues.
  - Always enable c++ compilation for `java-tree-sitter` (explained at point 3 from [this issue](https://github.com/serenadeai/java-tree-sitter/pull/18)).
    This can be done by `sed -i "s/if cpp/if cpp or True/g" ./build.py` at the root directory of `java-tree-sitter`
  - Checkout to commit `b6ec26f181dd059eedd506fa5fbeae1b8e5556c8` for `tree-sitter-haskell`

  After the above changes are made, run `./build.py -o libtree-sitter -v ../tree-sitter-haskell` at the root
  directory of `java-tree-sitter` to compile the dynamic library. Then move the output file to
  one of the `java.library.path` (which can be shown by executing `java -XshowSettings:properties`).

  After installing the prerequisites, change your working directory to the root of this repository and
  launch the SBT shell by typing `sbt` in the terminal.

  ----

  You need []
  

  [supported-jdk-versions]: https://docs.scala-lang.org/overviews/jdk-compatibility/overview.html
  [sbt]: https://www.scala-sbt.org/
  [coursier]: https://get-coursier.io/
  [java-tree-sitter]: https://github.com/serenadeai/java-tree-sitter
  [tree-sitter-haskell]: https://github.com/tree-sitter/tree-sitter-haskell



### Executing the Artifact

- To perform and test Lumberhack's optimization on the `nofib` benchmark tests we presented in the paper:

  run
`sbt 'testOnly mlscript.lumberhack.DiffTestLumberhack'`.
The output OCaml programs will be located in `new-nofib-ocaml-gen`, grouped by sub-directories following their names.
These sub-directories contain both the unoptimized programs and the optimized ones, and each of the sub-directories also includes a `main.ml` that contains codes
utilizing OCaml's benchmark library [`core_bench`](https://opam.ocaml.org/packages/core_bench/) to
benchmark both the original program and the optimized ones and show the execution time and GC data.

  After OCaml programs are generated, the script `bench.sh` can be used to run all of them.
Some programs require longer running time to enable `core_bench` to report
reliable 95% confidence intervals, and their test durations
are adjusted accordingly in `bench.sh`.
Depending on the machine executing the tests, the numbers may need to be further adjusted.

-  [TODO: to run each nofib program individually, cd to the corresponding directory and `eval $(head -2 ./mail.ml | tail -1)`, may also need to change time]

- To write your own programs and test Lumberhack's optimization on them
  
  The testing infrastructure is set up so that if there are any unstaged changes (as determined by `git`) in any test file
(those in `lumberhack/shared/src/test/resources`), only the corresponding files will be tested.
So you can make select modifications to some test files and run the test command again,
and it will only run your modified tests. There is an `Empty.mls` file for you to start.
Currently, we support the MLscript (explained below) syntax and a subset of Haskell syntax (so that we can port
the `nofib` benchmarks). To use the Haskell syntax, add `:lhInHaskell` at the beginning of
your Haskell programs.
  - [TODO: describe MLscript syntax]
  - [TODO: describe Haskell syntax (and no empty lines allowed)]




-----

## Project Structure

In this artifact, the implementation of Lumberhack is intertwined with MLscript,
a nascent functional programming language intended for real-world usage. This allows
Lumberhack to leverage the DiffTests utility implemented for MLscript.
Additionally, this also makes it possible for Lumberhack to take MLscript
programs as inputs and perform optimization on them.
Although the support for generating MLscript programs is not available yet, it is
anticipated that Lumberhack will be integrated into the MLscript compiler in the future.
[TODO: the examples in the introduction section of the paper are written in MLscript in this artifact]


The `lumberhack` directory contains the sources of implementation of Lumberhack
[TODO:]

The `shared` directory contains the sources for MLscript.

- The `shared/src/main/scala/mlscript` directory contains the sources of the MLscript compiler.
- The `shared/src/test/scala/mlscript` directory contains the sources of the testing infrastructure.
[TODO:]





<!-- # MLscript

What would TypeScript look like if it had been designed with type inference and soundness in mind?

We provide one possible answer in MLscript, an object-oriented and functional programming language with records, generic classes, mix-in traits, first-class unions and intersections, instance matching, and ML-style principal type inference.
These features can be used to implement expressive class hierarchies as well as extensible sums and products.

MLscript supports union, intersection, and complement (or negation) connectives, making sure they form a Boolean algebra, and add enough structure to derive a sound and complete type inference algorithm.

## Getting Started

### Project Structure

#### Sub-Projects

- The ts2mls sub-project allows you to use TypeScript libraries in MLscript. It can generate libraries' declaration information in MLscript by parsing TypeScript AST, which can be used in MLscript type checking.

#### Directories

- The `shared/src/main/scala/mlscript` directory contains the sources of the MLscript compiler.

- The `shared/src/test/scala/mlscript` directory contains the sources of the testing infrastructure.

- The `shared/src/test/diff` directory contains the actual tests.

- The `ts2mls/js/src/main/scala/ts2mls` directory contains the sources of the ts2mls module.

- The `ts2mls/js/src/test/scala/ts2mls` directory contains the sources of the ts2mls declaration generation test code.

- The `ts2mls/jvm/src/test/scala/ts2mls` directory contains the sources of the ts2mls diff test code.

- The `ts2mls/js/src/test/typescript` directory contains the TypeScript test code.

- The `ts2mls/js/src/test/diff` directory contains the declarations generated by ts2mls.

### Prerequisites

You need [JDK supported by Scala][supported-jdk-versions], [sbt][sbt], [Node.js][node.js], and TypeScript to compile the project and run the tests.

We recommend you to install JDK and sbt via [coursier][coursier]. The versions of Node.js that passed our tests are from v16.14 to v16.17, v17 and v18. Run `npm install` to install TypeScript. **Note that ScalaJS cannot find the global installed TypeScript.** We explicitly support TypeScript v4.7.4.

[supported-jdk-versions]: https://docs.scala-lang.org/overviews/jdk-compatibility/overview.html
[sbt]: https://www.scala-sbt.org/
[node.js]: https://nodejs.org/
[coursier]: https://get-coursier.io/

### Running the tests

Running the main MLscript tests only requires the Scala Build Tool installed.
In the terminal, run `sbt mlscriptJVM/test`.

Running the ts2mls MLscript tests requires NodeJS, and TypeScript in addition.
In the terminal, run `sbt ts2mlsTest/test`.

You can also run all tests simultaneously.
In the terminal, run `sbt test`.

### Running tests individually

Individual tests can be run with `-z`.
For example, `~mlscriptJVM/testOnly mlscript.DiffTests -- -z parser` will watch for file changes and continuously run all parser tests (those that have "parser" in their name).

You can also indicate the test you want in `shared/src/test/scala/mlscript/DiffTests.scala`:

```scala
  // Allow overriding which specific tests to run, sometimes easier for development:
  private val focused = Set[Str](
    // Add the test file path here like this:
    "shared/src/test/diff/mlscript/Methods.mls"
  ).map(os.RelPath(_))
```

To run the tests in ts2mls sub-project individually,
you can indicate the test you want in `ts2mls/js/src/test/scala/ts2mls/TSTypeGenerationTests.scala`:

```scala
private val testsData = List(
    // Put all input files in the `Seq`
    // Then indicate the output file's name
    (Seq("Array.ts"), "Array.d.mls")
  )
```

### Running the web demo locally

To run the demo on your computer, compile the project with `sbt fastOptJS`, then open the `local_testing.html` file in your browser.

You can make changes to the type inference code
in `shared/src/main/scala/mlscript`,
have it compile to JavaScript on file change with command
`sbt ~fastOptJS`,
and immediately see the results in your browser by refreshing the page with `F5`. -->
