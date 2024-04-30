

(* lumberhack *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack_______________(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec map_lh__d1 f_0 ls_0 =
  (ls_0 f_0);;
let rec concat_lh__d1 lss_0 =
  (lss_0 99);;
let rec mappend_lh__d1 xs_0 ys_0 =
  (match xs_0 with
    | `LH_C(h_0, t_0) -> 
      (`LH_C(h_0, ((mappend_lh__d1 t_0) ys_0)))
    | `LH_N -> 
      ys_0);;
let rec enumFromTo_lh__d1 a_0 b_0 =
  (if (a_0 <= b_0) then
    (let rec t_1 = ((enumFromTo_lh__d1 (a_0 + 1)) b_0) in
      (let rec h_1 = a_0 in
        (fun f_1 -> 
          (let rec t_2 = ((map_lh__d1 f_1) t_1) in
            (let rec h_2 = (f_1 h_1) in
              (fun _lh_dummy_0 -> 
                ((mappend_lh__d1 h_2) (concat_lh__d1 t_2))))))))
  else
    (fun f_2 _lh_dummy_1 -> 
      (`LH_N)));;
let rec f_lh__d1 _lh_f_arg1_0 _lh_f_arg2_0 =
  ((map_lh__d1 (fun x_0 -> 
    (testNotSlow_lh__d1 (_lh_f_arg1_0 - 1)))) _lh_f_arg2_0)
and
testNotSlow_lh__d1 _lh_testNotSlow_arg1_0 =
  (if (_lh_testNotSlow_arg1_0 < 0) then
    (`LH_N)
  else
    (concat_lh__d1 ((f_lh__d1 _lh_testNotSlow_arg1_0) ((enumFromTo_lh__d1 1) _lh_testNotSlow_arg1_0))));;
let run () = 1 + (Obj.magic ((testNotSlow_lh__d1 10)));
end;;

