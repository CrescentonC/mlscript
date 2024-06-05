

(* lumberhack_float_out *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack_float_out_(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec sum_lh__d1 xs_0 =
  (xs_0 99);;
let rec enumerate_lh__d1 n_0 _lh_floatOutId_0_0 =
  (if (n_0 >= 0) then
    (let rec xs_1 = (enumerate_lh__d1 (n_0 - 1)) in
      (let rec x_0 = n_0 in
        (x_0 + (sum_lh__d1 xs_1))))
  else
    0);;
let rec test24FusingRecursiveFunction_lh__d1 x_1 =
  (sum_lh__d1 (enumerate_lh__d1 x_1));;
let run () = 1 + (Obj.magic ((test24FusingRecursiveFunction_lh__d1 10000)));
end;;

