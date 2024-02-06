

(* lumberhack *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack_______________ = struct
let rec enumFromThenTo_lh__d1 a_2_0 t_0 b_2_0 =
  (if (a_2_0 <= b_2_0) then
    (`LH_C(a_2_0, (((enumFromThenTo_lh__d1 t_0) ((2 * t_0) - a_2_0)) b_2_0)))
  else
    (`LH_N));;
let rec integerbench_lh__d1 _lh_integerbench_arg1_0 _lh_integerbench_arg2_0 _lh_integerbench_arg3_0 _lh_integerbench_arg4_0 _lh_integerbench_arg5_0 _lh_integerbench_arg6_0 _lh_integerbench_arg7_0 =
  (let rec _lh_listcomp_fun_2 = (fun _lh_listcomp_fun_para_2 -> 
    (match _lh_listcomp_fun_para_2 with
      | `LH_C(_lh_listcomp_fun_ls_h_2, _lh_listcomp_fun_ls_t_2) -> 
        (let rec _lh_listcomp_fun_3 = (fun _lh_listcomp_fun_para_3 -> 
          (match _lh_listcomp_fun_para_3 with
            | `LH_C(_lh_listcomp_fun_ls_h_3, _lh_listcomp_fun_ls_t_3) -> 
              (`LH_C(((_lh_integerbench_arg1_0 _lh_listcomp_fun_ls_h_2) _lh_listcomp_fun_ls_h_3), (_lh_listcomp_fun_3 _lh_listcomp_fun_ls_t_3)))
            | `LH_N -> 
              (_lh_listcomp_fun_2 _lh_listcomp_fun_ls_t_2))) in
          (_lh_listcomp_fun_3 (((enumFromThenTo_lh__d1 _lh_integerbench_arg5_0) (_lh_integerbench_arg2_0 + _lh_integerbench_arg6_0)) _lh_integerbench_arg7_0)))
      | `LH_N -> 
        (`LH_N))) in
    (_lh_listcomp_fun_2 (((enumFromThenTo_lh__d1 _lh_integerbench_arg2_0) (_lh_integerbench_arg2_0 + _lh_integerbench_arg3_0)) _lh_integerbench_arg4_0)));;
let rec intbench_lh__d1 _lh_intbench_arg1_0 _lh_intbench_arg2_0 _lh_intbench_arg3_0 _lh_intbench_arg4_0 _lh_intbench_arg5_0 _lh_intbench_arg6_0 _lh_intbench_arg7_0 =
  (let rec _lh_listcomp_fun_0 = (fun _lh_listcomp_fun_para_0 -> 
    (match _lh_listcomp_fun_para_0 with
      | `LH_C(_lh_listcomp_fun_ls_h_0, _lh_listcomp_fun_ls_t_0) -> 
        (let rec _lh_listcomp_fun_1 = (fun _lh_listcomp_fun_para_1 -> 
          (match _lh_listcomp_fun_para_1 with
            | `LH_C(_lh_listcomp_fun_ls_h_1, _lh_listcomp_fun_ls_t_1) -> 
              (`LH_C(((_lh_intbench_arg1_0 _lh_listcomp_fun_ls_h_0) _lh_listcomp_fun_ls_h_1), (_lh_listcomp_fun_1 _lh_listcomp_fun_ls_t_1)))
            | `LH_N -> 
              (_lh_listcomp_fun_0 _lh_listcomp_fun_ls_t_0))) in
          (_lh_listcomp_fun_1 (((enumFromThenTo_lh__d1 _lh_intbench_arg5_0) (_lh_intbench_arg2_0 + _lh_intbench_arg6_0)) _lh_intbench_arg7_0)))
      | `LH_N -> 
        (`LH_N))) in
    (_lh_listcomp_fun_0 (((enumFromThenTo_lh__d1 _lh_intbench_arg2_0) (_lh_intbench_arg2_0 + _lh_intbench_arg3_0)) _lh_intbench_arg4_0)));;
let rec runbench_lh__d4 _lh_runbench_arg1_0 _lh_runbench_arg2_0 _lh_runbench_arg3_0 _lh_runbench_arg4_0 _lh_runbench_arg5_0 _lh_runbench_arg6_0 _lh_runbench_arg7_0 _lh_runbench_arg8_0 _lh_runbench_arg9_0 =
  (let rec _dum_0 = (`LH_P2((((((((intbench_lh__d1 _lh_runbench_arg2_0) _lh_runbench_arg4_0) _lh_runbench_arg5_0) _lh_runbench_arg6_0) _lh_runbench_arg4_0) _lh_runbench_arg5_0) _lh_runbench_arg6_0), (((((((integerbench_lh__d1 _lh_runbench_arg1_0) _lh_runbench_arg4_0) _lh_runbench_arg5_0) _lh_runbench_arg6_0) _lh_runbench_arg4_0) _lh_runbench_arg5_0) _lh_runbench_arg6_0))) in
    0);;
let rec runbench_lh__d6 _lh_runbench_arg1_6 _lh_runbench_arg2_6 _lh_runbench_arg3_6 _lh_runbench_arg4_6 _lh_runbench_arg5_6 _lh_runbench_arg6_6 _lh_runbench_arg7_6 _lh_runbench_arg8_6 _lh_runbench_arg9_6 =
  (let rec _dum_6 = (`LH_P2((((((((intbench_lh__d1 _lh_runbench_arg2_6) _lh_runbench_arg4_6) _lh_runbench_arg5_6) _lh_runbench_arg6_6) _lh_runbench_arg4_6) _lh_runbench_arg5_6) _lh_runbench_arg6_6), (((((((integerbench_lh__d1 _lh_runbench_arg1_6) _lh_runbench_arg4_6) _lh_runbench_arg5_6) _lh_runbench_arg6_6) _lh_runbench_arg4_6) _lh_runbench_arg5_6) _lh_runbench_arg6_6))) in
    0);;
let rec runbench_lh__d7 _lh_runbench_arg1_1 _lh_runbench_arg2_1 _lh_runbench_arg3_1 _lh_runbench_arg4_1 _lh_runbench_arg5_1 _lh_runbench_arg6_1 _lh_runbench_arg7_1 _lh_runbench_arg8_1 _lh_runbench_arg9_1 =
  (let rec _dum_1 = (`LH_P2((((((((intbench_lh__d1 _lh_runbench_arg2_1) _lh_runbench_arg4_1) _lh_runbench_arg5_1) _lh_runbench_arg6_1) _lh_runbench_arg4_1) _lh_runbench_arg5_1) _lh_runbench_arg6_1), (((((((integerbench_lh__d1 _lh_runbench_arg1_1) _lh_runbench_arg4_1) _lh_runbench_arg5_1) _lh_runbench_arg6_1) _lh_runbench_arg4_1) _lh_runbench_arg5_1) _lh_runbench_arg6_1))) in
    0);;
let rec runbench_lh__d9 _lh_runbench_arg1_2 _lh_runbench_arg2_2 _lh_runbench_arg3_2 _lh_runbench_arg4_2 _lh_runbench_arg5_2 _lh_runbench_arg6_2 _lh_runbench_arg7_2 _lh_runbench_arg8_2 _lh_runbench_arg9_2 =
  (let rec _dum_2 = (`LH_P2((((((((intbench_lh__d1 _lh_runbench_arg2_2) _lh_runbench_arg4_2) _lh_runbench_arg5_2) _lh_runbench_arg6_2) _lh_runbench_arg4_2) _lh_runbench_arg5_2) _lh_runbench_arg6_2), (((((((integerbench_lh__d1 _lh_runbench_arg1_2) _lh_runbench_arg4_2) _lh_runbench_arg5_2) _lh_runbench_arg6_2) _lh_runbench_arg4_2) _lh_runbench_arg5_2) _lh_runbench_arg6_2))) in
    0);;
let rec runbench_lh__d1 _lh_runbench_arg1_3 _lh_runbench_arg2_3 _lh_runbench_arg3_3 _lh_runbench_arg4_3 _lh_runbench_arg5_3 _lh_runbench_arg6_3 _lh_runbench_arg7_3 _lh_runbench_arg8_3 _lh_runbench_arg9_3 =
  (let rec _dum_3 = (`LH_P2((((((((intbench_lh__d1 _lh_runbench_arg2_3) _lh_runbench_arg4_3) _lh_runbench_arg5_3) _lh_runbench_arg6_3) _lh_runbench_arg4_3) _lh_runbench_arg5_3) _lh_runbench_arg6_3), (((((((integerbench_lh__d1 _lh_runbench_arg1_3) _lh_runbench_arg4_3) _lh_runbench_arg5_3) _lh_runbench_arg6_3) _lh_runbench_arg4_3) _lh_runbench_arg5_3) _lh_runbench_arg6_3))) in
    0);;
let rec runbench_lh__d5 _lh_runbench_arg1_4 _lh_runbench_arg2_4 _lh_runbench_arg3_4 _lh_runbench_arg4_4 _lh_runbench_arg5_4 _lh_runbench_arg6_4 _lh_runbench_arg7_4 _lh_runbench_arg8_4 _lh_runbench_arg9_4 =
  (let rec _dum_4 = (`LH_P2((((((((intbench_lh__d1 _lh_runbench_arg2_4) _lh_runbench_arg4_4) _lh_runbench_arg5_4) _lh_runbench_arg6_4) _lh_runbench_arg4_4) _lh_runbench_arg5_4) _lh_runbench_arg6_4), (((((((integerbench_lh__d1 _lh_runbench_arg1_4) _lh_runbench_arg4_4) _lh_runbench_arg5_4) _lh_runbench_arg6_4) _lh_runbench_arg4_4) _lh_runbench_arg5_4) _lh_runbench_arg6_4))) in
    0);;
let rec runbench_lh__d1_d0 _lh_runbench_arg1_9 _lh_runbench_arg2_9 _lh_runbench_arg3_9 _lh_runbench_arg4_9 _lh_runbench_arg5_9 _lh_runbench_arg6_9 _lh_runbench_arg7_9 _lh_runbench_arg8_9 _lh_runbench_arg9_9 =
  (let rec _dum_9 = (`LH_P2((((((((intbench_lh__d1 _lh_runbench_arg2_9) _lh_runbench_arg4_9) _lh_runbench_arg5_9) _lh_runbench_arg6_9) _lh_runbench_arg4_9) _lh_runbench_arg5_9) _lh_runbench_arg6_9), (((((((integerbench_lh__d1 _lh_runbench_arg1_9) _lh_runbench_arg4_9) _lh_runbench_arg5_9) _lh_runbench_arg6_9) _lh_runbench_arg4_9) _lh_runbench_arg5_9) _lh_runbench_arg6_9))) in
    0);;
let rec runbench_lh__d2 _lh_runbench_arg1_5 _lh_runbench_arg2_5 _lh_runbench_arg3_5 _lh_runbench_arg4_5 _lh_runbench_arg5_5 _lh_runbench_arg6_5 _lh_runbench_arg7_5 _lh_runbench_arg8_5 _lh_runbench_arg9_5 =
  (let rec _dum_5 = (`LH_P2((((((((intbench_lh__d1 _lh_runbench_arg2_5) _lh_runbench_arg4_5) _lh_runbench_arg5_5) _lh_runbench_arg6_5) _lh_runbench_arg4_5) _lh_runbench_arg5_5) _lh_runbench_arg6_5), (((((((integerbench_lh__d1 _lh_runbench_arg1_5) _lh_runbench_arg4_5) _lh_runbench_arg5_5) _lh_runbench_arg6_5) _lh_runbench_arg4_5) _lh_runbench_arg5_5) _lh_runbench_arg6_5))) in
    0);;
let rec runbench_lh__d3 _lh_runbench_arg1_7 _lh_runbench_arg2_7 _lh_runbench_arg3_7 _lh_runbench_arg4_7 _lh_runbench_arg5_7 _lh_runbench_arg6_7 _lh_runbench_arg7_7 _lh_runbench_arg8_7 _lh_runbench_arg9_7 =
  (let rec _dum_7 = (`LH_P2((((((((intbench_lh__d1 _lh_runbench_arg2_7) _lh_runbench_arg4_7) _lh_runbench_arg5_7) _lh_runbench_arg6_7) _lh_runbench_arg4_7) _lh_runbench_arg5_7) _lh_runbench_arg6_7), (((((((integerbench_lh__d1 _lh_runbench_arg1_7) _lh_runbench_arg4_7) _lh_runbench_arg5_7) _lh_runbench_arg6_7) _lh_runbench_arg4_7) _lh_runbench_arg5_7) _lh_runbench_arg6_7))) in
    0);;
let rec runbench_lh__d8 _lh_runbench_arg1_8 _lh_runbench_arg2_8 _lh_runbench_arg3_8 _lh_runbench_arg4_8 _lh_runbench_arg5_8 _lh_runbench_arg6_8 _lh_runbench_arg7_8 _lh_runbench_arg8_8 _lh_runbench_arg9_8 =
  (let rec _dum_8 = (`LH_P2((((((((intbench_lh__d1 _lh_runbench_arg2_8) _lh_runbench_arg4_8) _lh_runbench_arg5_8) _lh_runbench_arg6_8) _lh_runbench_arg4_8) _lh_runbench_arg5_8) _lh_runbench_arg6_8), (((((((integerbench_lh__d1 _lh_runbench_arg1_8) _lh_runbench_arg4_8) _lh_runbench_arg5_8) _lh_runbench_arg6_8) _lh_runbench_arg4_8) _lh_runbench_arg5_8) _lh_runbench_arg6_8))) in
    0);;
let rec runalltests_lh__d1 _lh_runalltests_arg1_0 _lh_runalltests_arg2_0 _lh_runalltests_arg3_0 _lh_runalltests_arg4_0 _lh_runalltests_arg5_0 _lh_runalltests_arg6_0 =
  (`LH_C((((((((((runbench_lh__d1_d0 (fun a_0 b_0 -> 
    (a_0 + b_0))) (fun a_1 b_1 -> 
    (a_1 + b_1))) (`LH_C('(', (`LH_C('+', (`LH_C(')', (`LH_N)))))))) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0), (`LH_C((((((((((runbench_lh__d2 (fun a_2 b_2 -> 
    (a_2 - b_2))) (fun a_3 b_3 -> 
    (a_3 - b_3))) (`LH_C('(', (`LH_C('-', (`LH_C(')', (`LH_N)))))))) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0), (`LH_C((((((((((runbench_lh__d4 (fun a_4 b_4 -> 
    (a_4 * b_4))) (fun a_5 b_5 -> 
    (a_5 * b_5))) (`LH_C('(', (`LH_C('*', (`LH_C(')', (`LH_N)))))))) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0), (`LH_C((((((((((runbench_lh__d5 (fun a_6 b_6 -> 
    (a_6 / b_6))) (fun a_7 b_7 -> 
    (a_7 / b_7))) (`LH_C('d', (`LH_C('i', (`LH_C('v', (`LH_N)))))))) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0), (`LH_C((((((((((runbench_lh__d9 (fun a_8 b_8 -> 
    (a_8 mod b_8))) (fun a_9 b_9 -> 
    (a_9 mod b_9))) (`LH_C('m', (`LH_C('o', (`LH_C('d', (`LH_N)))))))) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0), (`LH_C((((((((((runbench_lh__d6 (fun a_1_0 b_1_0 -> 
    (a_1_0 = b_1_0))) (fun a_1_1 b_1_1 -> 
    (a_1_1 = b_1_1))) (`LH_C('(', (`LH_C('=', (`LH_C('=', (`LH_C(')', (`LH_N)))))))))) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0), (`LH_C((((((((((runbench_lh__d3 (fun a_1_2 b_1_2 -> 
    (a_1_2 < b_1_2))) (fun a_1_3 b_1_3 -> 
    (a_1_3 < b_1_3))) (`LH_C('(', (`LH_C('<', (`LH_C(')', (`LH_N)))))))) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0), (`LH_C((((((((((runbench_lh__d8 (fun a_1_4 b_1_4 -> 
    (a_1_4 <= b_1_4))) (fun a_1_5 b_1_5 -> 
    (a_1_5 <= b_1_5))) (`LH_C('(', (`LH_C('<', (`LH_C('=', (`LH_C(')', (`LH_N)))))))))) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0), (`LH_C((((((((((runbench_lh__d1 (fun a_1_6 b_1_6 -> 
    (a_1_6 > b_1_6))) (fun a_1_7 b_1_7 -> 
    (a_1_7 > b_1_7))) (`LH_C('(', (`LH_C('>', (`LH_C(')', (`LH_N)))))))) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0), (`LH_C((((((((((runbench_lh__d7 (fun a_1_8 b_1_8 -> 
    (a_1_8 >= b_1_8))) (fun a_1_9 b_1_9 -> 
    (a_1_9 >= b_1_9))) (`LH_C('(', (`LH_C('>', (`LH_C('=', (`LH_C(')', (`LH_N)))))))))) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0) _lh_runalltests_arg1_0) _lh_runalltests_arg2_0) _lh_runalltests_arg3_0), (`LH_N)))))))))))))))))))));;
let rec testInteger_nofib_lh__d1 _lh_testInteger_nofib_arg1_0 =
  ((((((runalltests_lh__d1 (0 - _lh_testInteger_nofib_arg1_0)) 31) (0 + _lh_testInteger_nofib_arg1_0)) (0 - _lh_testInteger_nofib_arg1_0)) 31) (0 + _lh_testInteger_nofib_arg1_0));;
end;;
