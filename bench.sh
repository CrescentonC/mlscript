#!/bin/sh

dirlist=$(ls new-nofib-ocaml-gen)

# special test durations for some tests that last longer
Cryptarithm_nofib_lh=900
Fish_nofib_lh=20
LastPiece_nofib_lh=20
Mate_nofib_lh=60
Secretary_nofib_lh=300


for dir in $dirlist
do
  (
  cd new-nofib-ocaml-gen/$dir
  echo ""
  echo vvvv $dir vvvv
  cmd=$(head -2 ./main.ml | tail -1)
  if [ "$dir" = "Cryptarithm_nofib_lh" ]
  then
    c=$cmd" -q"" $Cryptarithm_nofib_lh"
  elif [ "$dir" = "Fish_nofib_lh" ]
  then
    c=$cmd" -q"" $Fish_nofib_lh"
  elif [ "$dir" = "LastPiece_nofib_lh" ]
  then
    c=$cmd" -q"" $LastPiece_nofib_lh"
  elif [ "$dir" = "Mate_nofib_lh" ]
  then
    c=$cmd" -q"" $Mate_nofib_lh"
  elif [ "$dir" = "Secretary_nofib_lh" ]
  then
    c=$cmd" -q"" $Secretary_nofib_lh"
  else
    c=$cmd" -q"" 10"
  fi

  eval $c
  )
done