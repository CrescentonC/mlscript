FROM sbtscala/scala-sbt:17.0.2_1.6.2_3.1.3
RUN apt update \
    && apt install -y build-essential python3-distutils libgmp-dev opam \
    && opam init --disable-sandboxing -y \
    && opam switch create artifact --packages=ocaml-variants.5.0.0+options,ocaml-option-flambda -y \
    && eval $(opam env) \
    && opam install zarith core_bench -y \
    && mkdir tree-sitter
WORKDIR /root/tree-sitter
RUN git clone https://github.com/serenadeai/java-tree-sitter.git \
    && git clone https://github.com/tree-sitter/tree-sitter-haskell.git
WORKDIR /root/tree-sitter/tree-sitter-haskell
RUN git checkout b6ec26f181dd059eedd506fa5fbeae1b8e5556c8
WORKDIR /root/tree-sitter/java-tree-sitter
RUN git submodule update --init --recursive \
    && git checkout f8a1f98a214a6961b55b201fbea957eacec182d4 \
    && sed -i "s/if cpp/if cpp or True/g" ./build.py \
    && ./build.py -o libtree-sitter -v ../tree-sitter-haskell \
    && cp ./libtree-sitter.so /lib/libjava-tree-sitter-ocaml-haskell.so
WORKDIR /root
CMD /bin/bash