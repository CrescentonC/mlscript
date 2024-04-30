
(* original *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_original_________________(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec mappend_lh xs_0 ys_0 =
  (match xs_0 with
    | `LH_C(h_0, t_0) -> 
      (`LH_C(h_0, ((mappend_lh t_0) ys_0)))
    | `LH_N -> 
      ys_0);;
let rec concat_lh lss_0 =
  (match lss_0 with
    | `LH_C(h_1, t_1) -> 
      ((mappend_lh h_1) (concat_lh t_1))
    | `LH_N -> 
      (`LH_N));;
let rec enumFromTo_lh a_0 b_0 =
  (if (a_0 <= b_0) then
    (`LH_C(a_0, ((enumFromTo_lh (a_0 + 1)) b_0)))
  else
    (`LH_N));;
let rec lscompf_lh _lh_lscompf_arg1_0 _lh_lscompf_arg2_0 =
  (let rec _lh_matchIdent_0 = _lh_lscompf_arg1_0 in
    (match _lh_matchIdent_0 with
      | `LH_N -> 
        (`LH_N)
      | `LH_C(_lh_lscompf_LH_C_0_0, _lh_lscompf_LH_C_1_0) -> 
        (`LH_C((testSlowManualListCompLifted_lh (_lh_lscompf_arg2_0 - 1)), ((lscompf_lh _lh_lscompf_LH_C_1_0) _lh_lscompf_arg2_0)))
      | _ -> 
        (failwith "error")))
and
testSlowManualListCompLifted_lh _lh_testSlowManualListCompLifted_arg1_0 =
  (if (_lh_testSlowManualListCompLifted_arg1_0 < 0) then
    (`LH_N)
  else
    (concat_lh ((lscompf_lh ((enumFromTo_lh 1) _lh_testSlowManualListCompLifted_arg1_0)) _lh_testSlowManualListCompLifted_arg1_0)));;
let run () = 1 + (Obj.magic ((testSlowManualListCompLifted_lh 10)));
end;;

