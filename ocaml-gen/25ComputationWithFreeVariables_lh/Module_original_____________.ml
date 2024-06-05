
(* original *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_original_____________(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec incr_lh__d1 x_3 =
  (x_3 + 1);;
let rec double_lh__d1 x_1 =
  (x_1 * 2);;
let rec map_lh__d1 f_1 xs_2 =
  (match xs_2 with
    | `Nil -> 
      (`Nil)
    | `Cons(x_2, xs_3) -> 
      (`Cons((f_1 x_2), ((map_lh__d1 f_1) xs_3))));;
let rec map_lh__d2 f_0 xs_0 =
  (match xs_0 with
    | `Nil -> 
      (`Nil)
    | `Cons(x_0, xs_1) -> 
      (`Cons((f_0 x_0), ((map_lh__d2 f_0) xs_1))));;
let rec test25ComputationWithFreeVariables_lh__d1 ls_0 =
  ((map_lh__d2 incr_lh__d1) ((map_lh__d1 double_lh__d1) ls_0));;
let rec mk_lh__d1 n_0 =
  (if (n_0 < 0) then
    (`Nil)
  else
    (`Cons(n_0, (mk_lh__d1 (n_0 - 1)))));;
let run () = 1 + (Obj.magic ((test25ComputationWithFreeVariables_lh__d1 (mk_lh__d1 10000))));
end;;

