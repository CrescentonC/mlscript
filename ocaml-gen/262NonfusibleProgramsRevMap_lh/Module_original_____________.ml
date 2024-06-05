
(* original *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_original_____________(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec mk_lh__d1 n_0 =
  (if (n_0 < 0) then
    (`Nil)
  else
    (`Cons(n_0, (mk_lh__d1 (n_0 - 1)))));;
let rec incr_lh__d1 x_2 =
  (x_2 + 1);;
let rec rev_lh__d1 xs_2 acc_0 =
  (match xs_2 with
    | `Cons(x_1, xs_3) -> 
      ((rev_lh__d1 xs_3) (`Cons(x_1, acc_0)))
    | `Nil -> 
      acc_0);;
let rec map_lh__d1 f_0 xs_0 =
  (match xs_0 with
    | `Nil -> 
      (`Nil)
    | `Cons(x_0, xs_1) -> 
      (`Cons((f_0 x_0), ((map_lh__d1 f_0) xs_1))));;
let rec test262NonfusibleProgramsRevMap_lh__d1 xs_4 =
  ((rev_lh__d1 ((map_lh__d1 incr_lh__d1) xs_4)) (`Nil));;
let run () = 1 + (Obj.magic ((test262NonfusibleProgramsRevMap_lh__d1 (mk_lh__d1 10000))));
end;;

