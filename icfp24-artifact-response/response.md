
Thank you for the thorough and constructive reviews!

We first provide a general response with our proposed changes, then provide detailed answers to your comments.

# **1. General Response**

Thanks for the suggestion to clarify our core contribution!
We propose to make it clearer in the `README.md` file that the core contribution of this artifact is
**the implementation of Lumberhack's fusion strategy inference and elaboration process performed on Lumberhack's core IR**.
Other things such as the installation of the tree-sitter Haskell parser are just to handle the
various input programs (including those in the _nofib_ benchmark suites),
which are desugared into our core IR and transformed.
Any other work can reuse the IR directly by converting their own AST to it. Of course, if the source language requires additional features that cannot easily be desugared into the IR, the IR may need small adaptations, but these should be straightforward for pure languages that Lumberhack currently focuses on.

In addition, we will further clarify the installation and evaluation instructions in the `README.md` file,
such that errors like those caused by test duration configurations, which vary from machine to machine,
are documented more clearly.

We also propose separating the core contribution into a self-contained and easy-to-compile Scala project that doesn't need any of the extra Haskell toolchain stuff (which is admittedly relatively cumbersome).
This will further enable us to clean up the code and present a more standalone
and user-friendly implementation of Lumberhack that corresponds closely to the paper.

For the pipeline to run _nofib_ benchmarks and generate related plots and figures in the paper,
we also propose to make it more convenient and robust such that fewer unexpected errors will occur.


# **2. DETAILED RESPONSE**

## Review #70A

> The setup is, unfortunately, fairly cumbersome. It's written in Scala, accepts -- alternatively -- Haskell syntax, and generates OCaml. Not many people (hopefully) will be in a situation like this one to reuse this software.
> While I love the contribution made by the authors, it's hard for me to see the artifact as a reference implementation: 
>  - what parts exist because of the setup, and what's intrinsic of the contribution? (sad given that the contribution is about eliminating intermediate representations)

Thanks for the suggestion! As mentioned in the general response,
we propose to make it clearer in the `README.md` file what the core contribution of this artifact is and clarify where they are located in the code base in addition to the existing explanations
in the "Additional Artifact Description" section in README.

>  - a handful of comments in the codebase, increasing the amount of detective work required;
>  - many pieces of code were commented out, rather than removed or given a rationale on why it's there.
> What I would've hoped for this artifact was the main contribution to exist standalone (either via a parametrised AST or the glue code to exist elsewhere).  For instance, `registerExprToType` in `Deforest.scala` is still dealing with quirks inherited from the Haskell syntax.

Thanks for pointing these out! As mentioned in the general response,
we propose to further clean up the code and present a more standalone implementation of Lumberhack.


## Review #70B

> I recommend restructuring the README to provide clearer and more precise steps for different operations. This will help users follow the instructions more easily and reduce the likelihood of errors and enhance accessibility ; specifically during the installation process, configuration settings, and running various commands.

Thank you for the comments! As mentioned in the general response, we propose
to further improve our `README.md` in general to enhance accessibility.



## Review #70C

> I was able to run and fully evaluate the provided docker for ARM64 architecture on an M1 MacBook Pro. However, I could only partially evaluate the AMD64 one on a Linux box, due to errors in executing `plot.sh` (perhaps `bench.sh` also threw some errors that I didn't catch). Nonetheless, I can verify that the artifact supports the claims in the paper and provides a reusable platform for future researchers.
> 
> Note: the "Complaints" sections below are the things I hope the authors address, and "Nitpicks" are some minor comments that will strengthen the artifact IMO but not necessary; the authors may choose to address "nitpicks" if they think it is worth the effort.

Thanks for the detailed feedback to help us polish our artifact to make it more accessible!

> ## Functional
> The artifact reaches functional quality. In particular:
> - All benchmarks passed, and the generated plots for time and size look very similar to the corresponding figures in the paper.
> - Almost all examples (except for a few small ones in section 3) presented in the paper are provided in the artifact as MLscript programs. These programs and their "after fusion" results correspond to the code in the paper fairly well.

Thanks for mentioning the missing examples in section 3! We will include them in the updated version of this artifact.

> #### Complaints
> The evaluation failed on my AMD64 Linux machine. Although `bench.sh` seemingly finished without issues, `plot.sh` gave me the following error:
> ```
> Error in if (f(ratio)) { : missing value where TRUE/FALSE needed
> Calls: sprintf -> unlist -> lapply -> FUN
> Execution halted
> ```
> 
> It nonetheless generated a time plot for me, which looked wrong. The size plot seems correct though. I will attach `time.txt` and `time.pdf` in a hotcrp comment.
> 
> In addition, `table.sh` also gave me an error, perhaps due to the `plot.sh` error:
> ```
>     lh = i[3]
> IndexError: list index out of range
> ```

Thank you very much for reporting this and providing the detailed `time.txt` and `time.pdf` files!
From `time.txt` it seems that the errors trace back to the fact that the test named `Fish` only
outputs two lines of results instead of four:
there should also be results for the original and expanded programs.

We are still working on reproducing the error on our AMD64 machine.
This error is a bit surprising for us because `time.txt` shows that the output of `Fish` starts with
the following content, which says "4 benchmarks x 30s", but still it only outputs two results.
```
vvvv Fish_nofib_lh vvvv
Estimated testing time 2m (4 benchmarks x 30s). Change using '-quota'.
```

We will update the artifact accordingly as soon as we find the cause and fix it.
Thanks again for reporting this to us!


> #### Nitpicks
> The generated plots have the benchmarks in a different order than that in the paper. For example, the first 3 benchmarks on the second row are LCSS, Lambda and LastPiece in the paper, but they are Lambda, LastPiece and LCSS in the plots. It will make the correspondence easier to spot if they are arranged in the same way.

Thanks! We will fix this in the updated version.


> ## Reusable
> I believe the artifact is reusable. In particular:
> - The README document is well-structured and well-written. I have no problem following the instructions to evaluate and play with the implementation.
> - The inline feedback from compiling a program is helpful. I believe they can help readers understand the algorithm and implementation better. That said, there is still room for improvement (see below).
> - I am able to provide my own programs (including some taken from existing literature) and exercise the deforestation process. This helps me understand the algorithm and limitation, as well as comparing to other approaches. It is also quite fun!
> - Error messages are good enough. I deliberately introduced some syntactic mistakes, and most of the generated inline error messages are easy to understand and help me debug.

Thank you! We are glad that you found our diff-test approach with inlined feedback helpful in general.


> #### Complaints
> I cannot make sense of the "fusion matches" sections in the inline feedback. Take 2.1 (Fig.2) as an example:
> 
> ```
> //│ >>>>>>> fusion matches >>>>>>>
> //│ [Some 123]: 4 --->
> //│     case x⁰ of {Some v⁰ => (v⁰ + 1) | None  => 0}: 16
> //│ [None]: 5 --->
> //│     case x⁰ of {Some v⁰ => (v⁰ + 1) | None  => 0}: 16
> //│ ------------------
> //│ case x⁰ of {Some v⁰ => (v⁰ + 1) | None  => 0}: 16 --->
> //│     [Some 123]: 4
> //│     [None]: 5
> //│ <<<<<<< fusion matches <<<<<<<
> ```
> 
> What does it mean, and what are those numbers? I feel this section is important for understanding the algorithm, but it is hard to parse. I suggest the authors clarify this section in README, and ideally connect it to the paper.

Thank you for the feedback!
We concur that it is a pity we did not explain this well in the README file,
and we could have made the pretty printing correspond closer to the
fusion strategies presented in the paper.

This "fusion matches" section prints out the important fusion strategies information
for those data constructor calls and pattern-matching expressions that are deforested.
Above the `------------------`, this information is shown as the consumer (case expression)
that a producer flows into; and below that it shows the producers that a case expression consumes.
To make it clearer, for example, we could have pretty printed it to show that the fusion strategy
of the expression `[Some 123]` is
$$\lbrace Some \langle v \mapsto Int \rangle \to v + 1; None \langle \rangle \to 0 \rbrace$$
to further show how the implementation corresponds to the fusion strategies presented in the paper.

At the end of the expressions, `: <number>` shows the unique id
that Lumberhack assigns to each expression.
The numbers in the superscripts are part of the name of identifiers.
We also could have made these numbers less distracting in the pretty printing and clarified them in README.

We will improve both the implementation such that the pretty printing corresponds closer
to the fusion strategies presented in the paper, and the README file such that
this part of the output is further clarified.


> #### Nitpicks
> - The error message for unbound / out-of-scope variables and unrecognized operator (e.g., `!=`) is not ideal (some uncaught Java error).
> - It would be great if the inline feedback also shows the inferred strategies, or some information about the type inference process.
> - Is there a way to run individual task *and* update the benchmark results? This is helpful when some benchmark fails (e.g., possibly on my Linux), and I need to change some parameters to fix it. I would like to avoid running the whole `bench.sh` again as it takes a long time. I guess at least I can run the individual task using the method in README and then manually copy-paste the output to `time.txt`.
> - There are not much comments / documents in the Scala source code. While the lack of comments does not necessarily mean the code base is hard to understand (which I cannot testify due to my poor Scala fluency), I think some comments that connect the source code to the algorithm (e.g., Fig.4 and Fig.6) would be great. This can help future researchers build their work on this paper and artifact.

Thank you very much for the detailed list of feedback! We will improve these in the updated version.
