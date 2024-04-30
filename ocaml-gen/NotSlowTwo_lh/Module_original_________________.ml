
(* original *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_original_________________(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec mappend_lh xs_0 ys_0 =
  (match xs_0 with
    | `LH_C(h_1, t_1) -> 
      (`LH_C(h_1, ((mappend_lh t_1) ys_0)))
    | `LH_N -> 
      ys_0);;
let rec concat_lh lss_0 =
  (match lss_0 with
    | `LH_C(h_2, t_2) -> 
      ((mappend_lh h_2) (concat_lh t_2))
    | `LH_N -> 
      (`LH_N));;
let rec enumFromTo_lh a_0 b_0 =
  (if (a_0 <= b_0) then
    (`LH_C(a_0, ((enumFromTo_lh (a_0 + 1)) b_0)))
  else
    (`LH_N));;
let rec map_lh f_0 ls_0 =
  (match ls_0 with
    | `LH_C(h_0, t_0) -> 
      (`LH_C((f_0 h_0), ((map_lh f_0) t_0)))
    | `LH_N -> 
      (`LH_N));;
let rec f_lh _lh_f_arg1_0 _lh_f_arg2_0 =
  ((map_lh (fun x_0 -> 
    (testNotSlowTwo_lh (_lh_f_arg1_0 - 1)))) _lh_f_arg2_0)
and
testNotSlowTwo_lh _lh_testNotSlowTwo_arg1_0 =
  (if (_lh_testNotSlowTwo_arg1_0 < 0) then
    (`LH_C(1, (`LH_N)))
  else
    (concat_lh ((f_lh _lh_testNotSlowTwo_arg1_0) ((enumFromTo_lh 0) _lh_testNotSlowTwo_arg1_0))));;
let run () = 1 + (Obj.magic ((testNotSlowTwo_lh 10)));
end;;

