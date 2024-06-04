FROM sbtscala/scala-sbt:eclipse-temurin-jammy-11.0.22_7_1.9.9_3.3.3
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
    && cp ./libtree-sitter.so /lib/libjava-tree-sitter-haskell.so
WORKDIR /root
RUN echo "eval \$(opam env 2> /dev/null)" >> ./.bashrc
RUN apt install r-base \
    && R -e "install.packages(c('RColorBrewer', 'ggplot2', 'gridExtra'), repos='http://cran.rstudio.com/')"
CMD /bin/bash