

(* lumberhack_float_out *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack_float_out_(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec incr_lh__d1 x_0 =
  (x_0 + 1);;
let rec map_lh__d1 f_2 xs_4 =
  (xs_4 f_2);;
let rec rev_lh__d1 xs_1 acc_0 =
  (match xs_1 with
    | `Cons(x_1, xs_2) -> 
      ((rev_lh__d1 xs_2) (let rec xs_3 = acc_0 in
        (let rec x_2 = x_1 in
          (fun f_1 -> 
            (`Cons((f_1 x_2), ((map_lh__d1 f_1) xs_3)))))))
    | `Nil -> 
      acc_0);;
let rec test262NonfusibleProgramsMapRev_lh__d1 xs_0 =
  ((map_lh__d1 incr_lh__d1) ((rev_lh__d1 xs_0) (fun f_0 -> 
    (`Nil))));;
let rec mk_lh__d1 n_0 =
  (if (n_0 < 0) then
    (`Nil)
  else
    (`Cons(n_0, (mk_lh__d1 (n_0 - 1)))));;
let run () = 1 + (Obj.magic ((test262NonfusibleProgramsMapRev_lh__d1 (mk_lh__d1 10000))));
end;;

