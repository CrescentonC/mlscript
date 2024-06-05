

(* lumberhack_float_out *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack_float_out_(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec sum_lh__d1 ls_1 =
  (ls_1 99);;
let rec append_lh__d1 xs_0 ys_0 =
  (match xs_0 with
    | `Nil -> 
      ys_0
    | `Cons(x_0, xs_1) -> 
      (let rec xs_2 = ((append_lh__d1 xs_1) ys_0) in
        (let rec x_1 = x_0 in
          (fun _lh_dummy_0 -> 
            (x_1 + (sum_lh__d1 xs_2))))));;
let rec flatten_lh__d1 ls_2 =
  (match ls_2 with
    | `Nil -> 
      (fun _lh_dummy_1 -> 
        0)
    | `Cons(x_2, xs_3) -> 
      ((append_lh__d1 x_2) (flatten_lh__d1 xs_3)));;
let rec test72LightweightFusion_lh__d1 ls_0 =
  (sum_lh__d1 (flatten_lh__d1 ls_0));;
let rec mk_lh__d1 n_0 =
  (if (n_0 > 0) then
    (`Cons(n_0, (mk_lh__d1 (n_0 - 1))))
  else
    (`Nil));;
let rec mk2d_lh__d1 n_1 =
  (if (n_1 > 0) then
    (`Cons((mk_lh__d1 n_1), (mk2d_lh__d1 (n_1 - 1))))
  else
    (`Nil));;
let run () = 1 + (Obj.magic ((test72LightweightFusion_lh__d1 (mk2d_lh__d1 300))));
end;;

