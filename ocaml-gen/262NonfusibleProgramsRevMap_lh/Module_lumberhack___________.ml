

(* lumberhack *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack___________(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec rev_lh__d1 xs_1 acc_0 =
  (xs_1 acc_0);;
let rec map_lh__d1 f_0 xs_2 =
  (match xs_2 with
    | `Nil -> 
      (fun acc_1 -> 
        acc_1)
    | `Cons(x_1, xs_3) -> 
      (let rec xs_4 = ((map_lh__d1 f_0) xs_3) in
        (let rec x_2 = (f_0 x_1) in
          (fun acc_2 -> 
            ((rev_lh__d1 xs_4) (`Cons(x_2, acc_2)))))));;
let rec incr_lh__d1 x_0 =
  (x_0 + 1);;
let rec test262NonfusibleProgramsRevMap_lh__d1 xs_0 =
  ((rev_lh__d1 ((map_lh__d1 incr_lh__d1) xs_0)) (`Nil));;
let rec mk_lh__d1 n_0 =
  (if (n_0 < 0) then
    (`Nil)
  else
    (`Cons(n_0, (mk_lh__d1 (n_0 - 1)))));;
let run () = 1 + (Obj.magic ((test262NonfusibleProgramsRevMap_lh__d1 (mk_lh__d1 10000))));
end;;

