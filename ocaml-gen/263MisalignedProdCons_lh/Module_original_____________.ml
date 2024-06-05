
(* original *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_original_____________(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec mk_lh__d1 n_0 =
  (if (n_0 > 0) then
    (`Cons((n_0 - 1), (`Cons(n_0, (`Cons((n_0 + 1), (mk_lh__d1 (n_0 - 1))))))))
  else
    (`Nil));;
let rec pair_up_lh__d1 xs_0 =
  (match xs_0 with
    | `Cons(x_0, xss_0) -> 
      (match xss_0 with
        | `Cons(y_0, xs_1) -> 
          (`Cons((`Pair(x_0, y_0)), (pair_up_lh__d1 xs_1)))
        | _ -> 
          (`Nil))
    | _ -> 
      (`Nil));;
let rec test263MisalignedProdCons_lh__d1 x_1 =
  (pair_up_lh__d1 (mk_lh__d1 x_1));;
let run () = 1 + (Obj.magic ((test263MisalignedProdCons_lh__d1 10000)));
end;;

