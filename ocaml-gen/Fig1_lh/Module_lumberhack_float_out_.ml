

(* lumberhack_float_out *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack_float_out_(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec incr_lh__d1 x_1 =
  (x_1 + 1);;
let rec double_lh__d1 x_0 =
  (x_0 * 2);;
let rec map_lh__d2 f_0 xs_0 =
  (xs_0 f_0);;
let rec map_lh__d1 f_1 xs_1 _lh_floatOutId_0_0 =
  (match xs_1 with
    | `Nil -> 
      (`Nil)
    | `Cons(x_2, xs_2) -> 
      (let rec xs_3 = ((map_lh__d1 f_1) xs_2) in
        (let rec x_3 = (f_1 x_2) in
          (`Cons((_lh_floatOutId_0_0 x_3), ((map_lh__d2 _lh_floatOutId_0_0) xs_3))))));;
let rec testFig1_lh__d1 ls_0 =
  ((map_lh__d2 incr_lh__d1) ((map_lh__d1 double_lh__d1) ls_0));;
let rec mk_lh__d1 n_0 =
  (if (n_0 < 0) then
    (`Nil)
  else
    (`Cons(n_0, (mk_lh__d1 (n_0 - 1)))));;
let run () = 1 + (Obj.magic ((testFig1_lh__d1 (mk_lh__d1 10000))));
end;;

