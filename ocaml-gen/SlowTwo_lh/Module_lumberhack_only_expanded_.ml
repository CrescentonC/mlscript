

(* lumberhack_only_expanded *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack_only_expanded_(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec mappend_lh__d1 xs_0 ys_0 =
  (match xs_0 with
    | `LH_C(h_0, t_0) -> 
      (`LH_C(h_0, ((mappend_lh__d1 t_0) ys_0)))
    | `LH_N -> 
      ys_0);;
let rec concat_lh__d1 lss_0 =
  (match lss_0 with
    | `LH_C(h_1, t_1) -> 
      ((mappend_lh__d1 h_1) (concat_lh__d1 t_1))
    | `LH_N -> 
      (`LH_N));;
let rec enumFromTo_lh__d1 a_0 b_0 =
  (if (a_0 <= b_0) then
    (`LH_C(a_0, ((enumFromTo_lh__d1 (a_0 + 1)) b_0)))
  else
    (`LH_N));;
let rec testSlowTwo_lh__d1 _lh_testSlowTwo_arg1_0 =
  (if (_lh_testSlowTwo_arg1_0 < 0) then
    (`LH_C(1, (`LH_N)))
  else
    (concat_lh__d1 (let rec _lh_listcomp_fun_0 = (fun _lh_listcomp_fun_para_0 -> 
      (match _lh_listcomp_fun_para_0 with
        | `LH_C(_lh_listcomp_fun_ls_h_0, _lh_listcomp_fun_ls_t_0) -> 
          (`LH_C((testSlowTwo_lh__d1 (_lh_testSlowTwo_arg1_0 - 1)), (_lh_listcomp_fun_0 _lh_listcomp_fun_ls_t_0)))
        | `LH_N -> 
          (`LH_N))) in
      (_lh_listcomp_fun_0 ((enumFromTo_lh__d1 0) _lh_testSlowTwo_arg1_0)))));;
let run () = 1 + (Obj.magic ((testSlowTwo_lh__d1 8)));
end;;

