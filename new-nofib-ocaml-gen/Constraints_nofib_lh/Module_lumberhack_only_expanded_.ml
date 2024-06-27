

(* lumberhack_only_expanded *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack_only_expanded_(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec reverse_helper_lh__d1 ls_9 a_8 =
  (match ls_9 with
    | `LH_C(h_1_0, t_1_0) -> 
      ((reverse_helper_lh__d1 t_1_0) (`LH_C(h_1_0, a_8)))
    | `LH_N -> 
      a_8);;
let rec reverse_lh__d1 ls_2_5 =
  ((reverse_helper_lh__d1 ls_2_5) (`LH_N));;
let rec level_lh__d1 _lh_level_arg1_3 =
  (match _lh_level_arg1_3 with
    | `Assign(_lh_level_Assign_0_3, _lh_level_Assign_1_3) -> 
      _lh_level_Assign_0_3);;
let rec filter_lh__d1 f_2_3 ls_2_6 =
  (match ls_2_6 with
    | `LH_C(h_2_6, t_2_6) -> 
      (if (f_2_3 h_2_6) then
        (`LH_C(h_2_6, ((filter_lh__d1 f_2_3) t_2_6)))
      else
        ((filter_lh__d1 f_2_3) t_2_6))
    | `LH_N -> 
      (`LH_N));;
let rec level_lh__d2 _lh_level_arg1_2 =
  (match _lh_level_arg1_2 with
    | `Assign(_lh_level_Assign_0_2, _lh_level_Assign_1_2) -> 
      _lh_level_Assign_0_2);;
let rec earliestInconsistency_lh__d1 _lh_earliestInconsistency_arg1_2 _lh_earliestInconsistency_arg2_2 =
  (match _lh_earliestInconsistency_arg1_2 with
    | `CSP(_lh_earliestInconsistency_CSP_0_2, _lh_earliestInconsistency_CSP_1_2, _lh_earliestInconsistency_CSP_2_2) -> 
      (match _lh_earliestInconsistency_arg2_2 with
        | `LH_N -> 
          (`Nothing)
        | `LH_C(_lh_earliestInconsistency_LH_C_0_4, _lh_earliestInconsistency_LH_C_1_4) -> 
          (let rec _lh_matchIdent_6 = ((filter_lh__d1 (fun _lh_funcomp_x_1_1 -> 
            (not ((_lh_earliestInconsistency_CSP_2_2 _lh_earliestInconsistency_LH_C_0_4) _lh_funcomp_x_1_1)))) (reverse_lh__d1 _lh_earliestInconsistency_LH_C_1_4)) in
            (match _lh_matchIdent_6 with
              | `LH_N -> 
                (`Nothing)
              | `LH_C(_lh_earliestInconsistency_LH_C_0_5, _lh_earliestInconsistency_LH_C_1_5) -> 
                (`Just((`LH_P2((level_lh__d1 _lh_earliestInconsistency_LH_C_0_4), (level_lh__d2 _lh_earliestInconsistency_LH_C_0_5)))))))));;
let rec maxLevel_lh__d1 _lh_maxLevel_arg1_3 =
  (match _lh_maxLevel_arg1_3 with
    | `LH_N -> 
      0
    | `LH_C(_lh_maxLevel_LH_C_0_3, _lh_maxLevel_LH_C_1_3) -> 
      (match _lh_maxLevel_LH_C_0_3 with
        | `Assign(_lh_maxLevel_Assign_0_3, _lh_maxLevel_Assign_1_3) -> 
          _lh_maxLevel_Assign_0_3));;
let rec complete_lh__d1 _lh_complete_arg1_3 _lh_complete_arg2_3 =
  (match _lh_complete_arg1_3 with
    | `CSP(_lh_complete_CSP_0_3, _lh_complete_CSP_1_3, _lh_complete_CSP_2_3) -> 
      ((maxLevel_lh__d1 _lh_complete_arg2_3) = _lh_complete_CSP_0_3));;
let rec checkComplete_lh__d1 _lh_checkComplete_arg1_4 _lh_checkComplete_arg2_4 =
  (if ((complete_lh__d1 _lh_checkComplete_arg1_4) _lh_checkComplete_arg2_4) then
    (`Known((`LH_N)))
  else
    (`Unknown));;
let rec map_lh__d2 f_2_2 ls_2_4 =
  (match ls_2_4 with
    | `LH_C(h_2_5, t_2_5) -> 
      (`LH_C((f_2_2 h_2_5), ((map_lh__d2 f_2_2) t_2_5)))
    | `LH_N -> 
      (`LH_N));;
let rec mapTree_lh__d1 _lh_mapTree_arg1_6 _lh_mapTree_arg2_6 =
  (match _lh_mapTree_arg2_6 with
    | `Node(_lh_mapTree_Node_0_6, _lh_mapTree_Node_1_6) -> 
      (`Node((_lh_mapTree_arg1_6 _lh_mapTree_Node_0_6), ((map_lh__d2 (mapTree_lh__d1 _lh_mapTree_arg1_6)) _lh_mapTree_Node_1_6))));;
let rec bt_lh__d1 _lh_bt_arg1_2 =
  (let rec f_3_1 = (fun s_2 -> 
    (`LH_P2(s_2, (let rec _lh_matchIdent_7 = ((earliestInconsistency_lh__d1 _lh_bt_arg1_2) s_2) in
      (match _lh_matchIdent_7 with
        | `Nothing -> 
          ((checkComplete_lh__d1 _lh_bt_arg1_2) s_2)
        | `Just(_lh_bt_Just_0_2) -> 
          (match _lh_bt_Just_0_2 with
            | `LH_P2(_lh_bt_LH_P2_0_2, _lh_bt_LH_P2_1_2) -> 
              (`Known((`LH_C(_lh_bt_LH_P2_0_2, (`LH_C(_lh_bt_LH_P2_1_2, (`LH_N))))))))))))) in
    (mapTree_lh__d1 f_3_1));;
let rec map_lh__d1 f_3_2 ls_2_8 =
  (match ls_2_8 with
    | `LH_C(h_2_8, t_2_8) -> 
      (`LH_C((f_3_2 h_2_8), ((map_lh__d1 f_3_2) t_2_8)))
    | `LH_N -> 
      (`LH_N));;
let rec knownConflict_lh__d1 _lh_knownConflict_arg1_2 =
  (match _lh_knownConflict_arg1_2 with
    | `Known(_lh_knownConflict_Known_0_2) -> 
      (match _lh_knownConflict_Known_0_2 with
        | `LH_C(_lh_knownConflict_LH_C_0_2, _lh_knownConflict_LH_C_1_2) -> 
          true
        | _ -> 
          false)
    | _ -> 
      false);;
let rec map_lh__d1_d1 f_6 ls_6 =
  (match ls_6 with
    | `LH_C(h_7, t_7) -> 
      (`LH_C((f_6 h_7), ((map_lh__d1_d1 f_6) t_7)))
    | `LH_N -> 
      (`LH_N));;
let rec mapTree_lh__d5 _lh_mapTree_arg1_2 _lh_mapTree_arg2_2 =
  (match _lh_mapTree_arg2_2 with
    | `Node(_lh_mapTree_Node_0_2, _lh_mapTree_Node_1_2) -> 
      (`Node((_lh_mapTree_arg1_2 _lh_mapTree_Node_0_2), ((map_lh__d1_d1 (mapTree_lh__d5 _lh_mapTree_arg1_2)) _lh_mapTree_Node_1_2))));;
let rec filter_lh__d3 f_5 ls_5 =
  (match ls_5 with
    | `LH_C(h_6, t_6) -> 
      (if (f_5 h_6) then
        (`LH_C(h_6, ((filter_lh__d3 f_5) t_6)))
      else
        ((filter_lh__d3 f_5) t_6))
    | `LH_N -> 
      (`LH_N));;
let rec nubBy_lh__d1 _lh_nubBy_arg1_0 _lh_nubBy_arg2_0 =
  (match _lh_nubBy_arg2_0 with
    | `LH_N -> 
      (`LH_N)
    | `LH_C(_lh_nubBy_LH_C_0_0, _lh_nubBy_LH_C_1_0) -> 
      (`LH_C(_lh_nubBy_LH_C_0_0, ((nubBy_lh__d1 _lh_nubBy_arg1_0) ((filter_lh__d3 (fun y_0 -> 
        (not ((_lh_nubBy_arg1_0 _lh_nubBy_LH_C_0_0) y_0)))) _lh_nubBy_LH_C_1_0)))));;
let rec foldl_lh__d1 f_0 i_0 ls_0 =
  (match ls_0 with
    | `LH_C(h_0, t_0) -> 
      (((foldl_lh__d1 f_0) ((f_0 i_0) h_0)) t_0)
    | `LH_N -> 
      i_0);;
let rec mappend_lh__d1 xs_0 ys_0 =
  (match xs_0 with
    | `LH_C(h_1, t_1) -> 
      (`LH_C(h_1, ((mappend_lh__d1 t_1) ys_0)))
    | `LH_N -> 
      ys_0);;
let rec flip_lh__d1 _lh_flip_arg1_0 _lh_flip_arg2_0 _lh_flip_arg3_0 =
  ((_lh_flip_arg1_0 _lh_flip_arg3_0) _lh_flip_arg2_0);;
let rec deleteBy_lh__d1 _lh_deleteBy_arg1_0 _lh_deleteBy_arg2_0 _lh_deleteBy_arg3_0 =
  (match _lh_deleteBy_arg3_0 with
    | `LH_N -> 
      (`LH_N)
    | `LH_C(_lh_deleteBy_LH_C_0_0, _lh_deleteBy_LH_C_1_0) -> 
      (if ((_lh_deleteBy_arg1_0 _lh_deleteBy_arg2_0) _lh_deleteBy_LH_C_0_0) then
        _lh_deleteBy_LH_C_1_0
      else
        (`LH_C(_lh_deleteBy_LH_C_0_0, (((deleteBy_lh__d1 _lh_deleteBy_arg1_0) _lh_deleteBy_arg2_0) _lh_deleteBy_LH_C_1_0)))));;
let rec unionBy_lh__d1 _lh_unionBy_arg1_0 _lh_unionBy_arg2_0 _lh_unionBy_arg3_0 =
  ((mappend_lh__d1 _lh_unionBy_arg2_0) (((foldl_lh__d1 (flip_lh__d1 (deleteBy_lh__d1 _lh_unionBy_arg1_0))) ((nubBy_lh__d1 _lh_unionBy_arg1_0) _lh_unionBy_arg3_0)) _lh_unionBy_arg2_0));;
let rec union_lh__d1 _lh_union_arg1_1 _lh_union_arg2_1 =
  (((unionBy_lh__d1 (fun a_3 b_2 -> 
    (a_3 = b_2))) _lh_union_arg1_1) _lh_union_arg2_1);;
let rec collect_lh__d1 _lh_collect_arg1_0 =
  (match _lh_collect_arg1_0 with
    | `LH_N -> 
      (`LH_N)
    | `LH_C(_lh_collect_LH_C_0_0, _lh_collect_LH_C_1_0) -> 
      (match _lh_collect_LH_C_0_0 with
        | `Known(_lh_collect_Known_0_0) -> 
          ((union_lh__d1 _lh_collect_Known_0_0) (collect_lh__d1 _lh_collect_LH_C_1_0))
        | _ -> 
          (failwith "lh_default_error")));;
let rec all_lh__d1 _lh_all_arg1_0 _lh_all_arg2_0 =
  (match _lh_all_arg2_0 with
    | `LH_N -> 
      true
    | `LH_C(_lh_all_LH_C_0_0, _lh_all_LH_C_1_0) -> 
      (if (_lh_all_arg1_0 _lh_all_LH_C_0_0) then
        ((all_lh__d1 _lh_all_arg1_0) _lh_all_LH_C_1_0)
      else
        false));;
let rec head_lh__d3 ls_1_4 =
  (match ls_1_4 with
    | `LH_C(h_1_5, t_1_5) -> 
      h_1_5
    | `LH_N -> 
      (failwith "lh_default_error"));;
let rec null_lh__d1 _lh_null_arg1_0 =
  (match _lh_null_arg1_0 with
    | `LH_N -> 
      true
    | `LH_C(_lh_null_LH_C_0_0, _lh_null_LH_C_1_0) -> 
      false);;
let rec domainWipeOut_lh__d1 _lh_domainWipeOut_arg1_0 _lh_domainWipeOut_arg2_0 =
  (match _lh_domainWipeOut_arg1_0 with
    | `CSP(_lh_domainWipeOut_CSP_0_0, _lh_domainWipeOut_CSP_1_0, _lh_domainWipeOut_CSP_2_0) -> 
      (let rec f_2_8 = (fun _lh_f_arg1_2 -> 
        (match _lh_f_arg1_2 with
          | `LH_P2(_lh_f_LH_P2_0_2, _lh_f_LH_P2_1_2) -> 
            (match _lh_f_LH_P2_0_2 with
              | `LH_P2(_lh_f_LH_P2_0_3, _lh_f_LH_P2_1_3) -> 
                (let rec wipedDomains_0 = (let rec _lh_listcomp_fun_7 = (fun _lh_listcomp_fun_para_7 -> 
                  (match _lh_listcomp_fun_para_7 with
                    | `LH_C(_lh_listcomp_fun_ls_h_7, _lh_listcomp_fun_ls_t_7) -> 
                      (if ((all_lh__d1 knownConflict_lh__d1) _lh_listcomp_fun_ls_h_7) then
                        (`LH_C(_lh_listcomp_fun_ls_h_7, (_lh_listcomp_fun_7 _lh_listcomp_fun_ls_t_7)))
                      else
                        (_lh_listcomp_fun_7 _lh_listcomp_fun_ls_t_7))
                    | `LH_N -> 
                      (`LH_N))) in
                  (_lh_listcomp_fun_7 _lh_f_LH_P2_1_2)) in
                  (let rec cs'_1 = (if (null_lh__d1 wipedDomains_0) then
                    _lh_f_LH_P2_1_3
                  else
                    (`Known((collect_lh__d1 (head_lh__d3 wipedDomains_0))))) in
                    (`LH_P2(_lh_f_LH_P2_0_3, cs'_1))))))) in
        ((mapTree_lh__d5 f_2_8) _lh_domainWipeOut_arg2_0)));;
let rec tail_lh__d2 ls_1_6 =
  (match ls_1_6 with
    | `LH_C(h_1_7, t_1_7) -> 
      t_1_7
    | `LH_N -> 
      (failwith "lh_default_error"));;
let rec enumFromTo_lh__d7 a_5 b_4 =
  (if (a_5 <= b_4) then
    (`LH_C(a_5, ((enumFromTo_lh__d7 (a_5 + 1)) b_4)))
  else
    (`LH_N));;
let rec enumFromTo_lh__d8 a_4 b_3 =
  (if (a_4 <= b_3) then
    (`LH_C(a_4, ((enumFromTo_lh__d8 (a_4 + 1)) b_3)))
  else
    (`LH_N));;
let rec zipWith_lh__d3 f_8 xs_2 ys_2 =
  (match xs_2 with
    | `LH_C(hx_1, tx_1) -> 
      (match ys_2 with
        | `LH_C(hy_1, ty_1) -> 
          (`LH_C(((f_8 hx_1) hy_1), (((zipWith_lh__d3 f_8) tx_1) ty_1)))
        | `LH_N -> 
          (`LH_N))
    | `LH_N -> 
      (`LH_N));;
let rec zipWith_lh__d4 f_7 xs_1 ys_1 =
  (match xs_1 with
    | `LH_C(hx_0, tx_0) -> 
      (match ys_1 with
        | `LH_C(hy_0, ty_0) -> 
          (`LH_C(((f_7 hx_0) hy_0), (((zipWith_lh__d4 f_7) tx_0) ty_0)))
        | `LH_N -> 
          (`LH_N))
    | `LH_N -> 
      (`LH_N));;
let rec fillTable_lh__d2 _lh_fillTable_arg1_0 _lh_fillTable_arg2_0 _lh_fillTable_arg3_0 =
  (match _lh_fillTable_arg1_0 with
    | `LH_N -> 
      _lh_fillTable_arg3_0
    | `LH_C(_lh_fillTable_LH_C_0_0, _lh_fillTable_LH_C_1_0) -> 
      (match _lh_fillTable_LH_C_0_0 with
        | `Assign(_lh_fillTable_Assign_0_0, _lh_fillTable_Assign_1_0) -> 
          (match _lh_fillTable_arg2_0 with
            | `CSP(_lh_fillTable_CSP_0_0, _lh_fillTable_CSP_1_0, _lh_fillTable_CSP_2_0) -> 
              (let rec f_1_8 = (fun cs_1 varval_0 -> 
                (let rec _lh_matchIdent_2 = varval_0 in
                  (match _lh_matchIdent_2 with
                    | `LH_P2(_lh_fillTable_LH_P2_0_0, _lh_fillTable_LH_P2_1_0) -> 
                      (if ((cs_1 = (`Unknown)) && (not ((_lh_fillTable_CSP_2_0 (`Assign(_lh_fillTable_Assign_0_0, _lh_fillTable_Assign_1_0))) (`Assign(_lh_fillTable_LH_P2_0_0, _lh_fillTable_LH_P2_1_0))))) then
                        (`Known((`LH_C(_lh_fillTable_Assign_0_0, (`LH_C(_lh_fillTable_LH_P2_0_0, (`LH_N)))))))
                      else
                        cs_1)))) in
                (((zipWith_lh__d3 (zipWith_lh__d4 f_1_8)) _lh_fillTable_arg3_0) (let rec _lh_listcomp_fun_1 = (fun _lh_listcomp_fun_para_1 -> 
                  (match _lh_listcomp_fun_para_1 with
                    | `LH_C(_lh_listcomp_fun_ls_h_1, _lh_listcomp_fun_ls_t_1) -> 
                      (`LH_C((let rec _lh_listcomp_fun_2 = (fun _lh_listcomp_fun_para_2 -> 
                        (match _lh_listcomp_fun_para_2 with
                          | `LH_C(_lh_listcomp_fun_ls_h_2, _lh_listcomp_fun_ls_t_2) -> 
                            (`LH_C((`LH_P2(_lh_listcomp_fun_ls_h_1, _lh_listcomp_fun_ls_h_2)), (_lh_listcomp_fun_2 _lh_listcomp_fun_ls_t_2)))
                          | `LH_N -> 
                            (`LH_N))) in
                        (_lh_listcomp_fun_2 ((enumFromTo_lh__d7 1) _lh_fillTable_CSP_1_0))), (_lh_listcomp_fun_1 _lh_listcomp_fun_ls_t_1)))
                    | `LH_N -> 
                      (`LH_N))) in
                  (_lh_listcomp_fun_1 ((enumFromTo_lh__d8 (_lh_fillTable_Assign_0_0 + 1)) _lh_fillTable_CSP_0_0))))))));;
let rec map_lh__d5 f_1_7 ls_1_5 =
  (match ls_1_5 with
    | `LH_C(h_1_6, t_1_6) -> 
      (`LH_C((f_1_7 h_1_6), ((map_lh__d5 f_1_7) t_1_6)))
    | `LH_N -> 
      (`LH_N));;
let rec cacheChecks_lh__d2 _lh_cacheChecks_arg1_0 _lh_cacheChecks_arg2_0 _lh_cacheChecks_arg3_0 =
  (match _lh_cacheChecks_arg3_0 with
    | `Node(_lh_cacheChecks_Node_0_0, _lh_cacheChecks_Node_1_0) -> 
      (`Node((`LH_P2(_lh_cacheChecks_Node_0_0, _lh_cacheChecks_arg2_0)), ((map_lh__d5 ((cacheChecks_lh__d2 _lh_cacheChecks_arg1_0) (((fillTable_lh__d2 _lh_cacheChecks_Node_0_0) _lh_cacheChecks_arg1_0) (tail_lh__d2 _lh_cacheChecks_arg2_0)))) _lh_cacheChecks_Node_1_0))));;
let rec head_lh__d2 ls_1_8 =
  (match ls_1_8 with
    | `LH_C(h_1_9, t_1_9) -> 
      h_1_9
    | `LH_N -> 
      (failwith "lh_default_error"));;
let rec maxLevel_lh__d4 _lh_maxLevel_arg1_0 =
  (match _lh_maxLevel_arg1_0 with
    | `LH_N -> 
      0
    | `LH_C(_lh_maxLevel_LH_C_0_0, _lh_maxLevel_LH_C_1_0) -> 
      (match _lh_maxLevel_LH_C_0_0 with
        | `Assign(_lh_maxLevel_Assign_0_0, _lh_maxLevel_Assign_1_0) -> 
          _lh_maxLevel_Assign_0_0));;
let rec complete_lh__d3 _lh_complete_arg1_1 _lh_complete_arg2_1 =
  (match _lh_complete_arg1_1 with
    | `CSP(_lh_complete_CSP_0_1, _lh_complete_CSP_1_1, _lh_complete_CSP_2_1) -> 
      ((maxLevel_lh__d4 _lh_complete_arg2_1) = _lh_complete_CSP_0_1));;
let rec checkComplete_lh__d3 _lh_checkComplete_arg1_2 _lh_checkComplete_arg2_2 =
  (if ((complete_lh__d3 _lh_checkComplete_arg1_2) _lh_checkComplete_arg2_2) then
    (`Known((`LH_N)))
  else
    (`Unknown));;
let rec value_lh__d2 _lh_value_arg1_0 =
  (match _lh_value_arg1_0 with
    | `Assign(_lh_value_Assign_0_0, _lh_value_Assign_1_0) -> 
      _lh_value_Assign_1_0);;
let rec map_lh__d1_d0 f_9 ls_7 =
  (match ls_7 with
    | `LH_C(h_8, t_8) -> 
      (`LH_C((f_9 h_8), ((map_lh__d1_d0 f_9) t_8)))
    | `LH_N -> 
      (`LH_N));;
let rec mapTree_lh__d4 _lh_mapTree_arg1_3 _lh_mapTree_arg2_3 =
  (match _lh_mapTree_arg2_3 with
    | `Node(_lh_mapTree_Node_0_3, _lh_mapTree_Node_1_3) -> 
      (`Node((_lh_mapTree_arg1_3 _lh_mapTree_Node_0_3), ((map_lh__d1_d0 (mapTree_lh__d4 _lh_mapTree_arg1_3)) _lh_mapTree_Node_1_3))));;
let rec atIndex_lh__d2 n_0 ls_1_7 =
  (if (n_0 < 0) then
    (failwith "lh_default_error")
  else
    (match ls_1_7 with
      | `LH_C(h_1_8, t_1_8) -> 
        (if (n_0 = 0) then
          h_1_8
        else
          ((atIndex_lh__d2 (n_0 - 1)) t_1_8))
      | `LH_N -> 
        (failwith "lh_default_error")));;
let rec lookupCache_lh__d2 _lh_lookupCache_arg1_0 _lh_lookupCache_arg2_0 =
  (let rec f_2_9 = (fun _lh_f_arg1_3 _lh_f_arg2_2 -> 
    (match _lh_f_arg2_2 with
      | `LH_P2(_lh_f_LH_P2_0_4, _lh_f_LH_P2_1_4) -> 
        (match _lh_f_LH_P2_0_4 with
          | `LH_N -> 
            (`LH_P2((`LH_P2((`LH_N), (`Unknown))), _lh_f_LH_P2_1_4))
          | `LH_C(_lh_f_LH_C_0_0, _lh_f_LH_C_1_0) -> 
            (let rec tableEntry_0 = ((atIndex_lh__d2 ((value_lh__d2 _lh_f_LH_C_0_0) - 1)) (head_lh__d2 _lh_f_LH_P2_1_4)) in
              (let rec cs_3 = (if (tableEntry_0 = (`Unknown)) then
                ((checkComplete_lh__d3 _lh_f_arg1_3) (`LH_C(_lh_f_LH_C_0_0, _lh_f_LH_C_1_0)))
              else
                tableEntry_0) in
                (`LH_P2((`LH_P2((`LH_C(_lh_f_LH_C_0_0, _lh_f_LH_C_1_0)), cs_3)), _lh_f_LH_P2_1_4))))))) in
    ((mapTree_lh__d4 (f_2_9 _lh_lookupCache_arg1_0)) _lh_lookupCache_arg2_0));;
let rec enumFromTo_lh__d3 a_1_0 b_8 =
  (if (a_1_0 <= b_8) then
    (`LH_C(a_1_0, ((enumFromTo_lh__d3 (a_1_0 + 1)) b_8)))
  else
    (`LH_N));;
let rec enumFromTo_lh__d4 a_9 b_7 =
  (if (a_9 <= b_7) then
    (`LH_C(a_9, ((enumFromTo_lh__d4 (a_9 + 1)) b_7)))
  else
    (`LH_N));;
let rec emptyTable_lh__d2 _lh_emptyTable_arg1_0 =
  (match _lh_emptyTable_arg1_0 with
    | `CSP(_lh_emptyTable_CSP_0_0, _lh_emptyTable_CSP_1_0, _lh_emptyTable_CSP_2_0) -> 
      (`LH_C((`LH_N), (let rec _lh_listcomp_fun_5 = (fun _lh_listcomp_fun_para_5 -> 
        (match _lh_listcomp_fun_para_5 with
          | `LH_C(_lh_listcomp_fun_ls_h_5, _lh_listcomp_fun_ls_t_5) -> 
            (`LH_C((let rec _lh_listcomp_fun_6 = (fun _lh_listcomp_fun_para_6 -> 
              (match _lh_listcomp_fun_para_6 with
                | `LH_C(_lh_listcomp_fun_ls_h_6, _lh_listcomp_fun_ls_t_6) -> 
                  (`LH_C((`Unknown), (_lh_listcomp_fun_6 _lh_listcomp_fun_ls_t_6)))
                | `LH_N -> 
                  (`LH_N))) in
              (_lh_listcomp_fun_6 ((enumFromTo_lh__d4 1) _lh_emptyTable_CSP_1_0))), (_lh_listcomp_fun_5 _lh_listcomp_fun_ls_t_5)))
          | `LH_N -> 
            (`LH_N))) in
        (_lh_listcomp_fun_5 ((enumFromTo_lh__d3 1) _lh_emptyTable_CSP_0_0))))));;
let rec fc_lh__d1 _lh_fc_arg1_0 _lh_funcomp_x_1_4 =
  ((fun _lh_funcomp_x_1_5 -> 
    ((domainWipeOut_lh__d1 _lh_fc_arg1_0) ((lookupCache_lh__d2 _lh_fc_arg1_0) _lh_funcomp_x_1_5))) (((cacheChecks_lh__d2 _lh_fc_arg1_0) (emptyTable_lh__d2 _lh_fc_arg1_0)) _lh_funcomp_x_1_4));;
let rec length_lh__d1 ls_2_7 =
  (match ls_2_7 with
    | `LH_C(h_2_7, t_2_7) -> 
      (1 + (length_lh__d1 t_2_7))
    | `LH_N -> 
      0);;
let rec map_lh__d1_d4 f_2 ls_1 =
  (match ls_1 with
    | `LH_C(h_2, t_2) -> 
      (`LH_C((f_2 h_2), ((map_lh__d1_d4 f_2) t_2)))
    | `LH_N -> 
      (`LH_N));;
let rec foldTree_lh__d2 _lh_foldTree_arg1_0 _lh_foldTree_arg2_0 =
  (match _lh_foldTree_arg2_0 with
    | `Node(_lh_foldTree_Node_0_0, _lh_foldTree_Node_1_0) -> 
      ((_lh_foldTree_arg1_0 _lh_foldTree_Node_0_0) ((map_lh__d1_d4 (foldTree_lh__d2 _lh_foldTree_arg1_0)) _lh_foldTree_Node_1_0)));;
let rec label_lh__d2 _lh_label_arg1_0 =
  (match _lh_label_arg1_0 with
    | `Node(_lh_label_Node_0_0, _lh_label_Node_1_0) -> 
      _lh_label_Node_0_0);;
let rec filterTree_lh__d1 _lh_filterTree_arg1_0 =
  (let rec f_1 = (fun a_1 cs_0 -> 
    (`Node(a_1, ((filter_lh__d3 (fun _lh_funcomp_x_0 -> 
      (_lh_filterTree_arg1_0 (label_lh__d2 _lh_funcomp_x_0)))) cs_0)))) in
    (foldTree_lh__d2 f_1));;
let rec prune_lh__d1 _lh_prune_arg1_0 =
  (filterTree_lh__d1 (fun _lh_funcomp_x_2 -> 
    (not (_lh_prune_arg1_0 _lh_funcomp_x_2))));;
let rec maxLevel_lh__d3 _lh_maxLevel_arg1_1 =
  (match _lh_maxLevel_arg1_1 with
    | `LH_N -> 
      0
    | `LH_C(_lh_maxLevel_LH_C_0_1, _lh_maxLevel_LH_C_1_1) -> 
      (match _lh_maxLevel_LH_C_0_1 with
        | `Assign(_lh_maxLevel_Assign_0_1, _lh_maxLevel_Assign_1_1) -> 
          _lh_maxLevel_Assign_0_1));;
let rec enumFromTo_lh__d9 a_0 b_0 =
  (if (a_0 <= b_0) then
    (`LH_C(a_0, ((enumFromTo_lh__d9 (a_0 + 1)) b_0)))
  else
    (`LH_N));;
let rec initTree_lh__d1 _lh_initTree_arg1_0 _lh_initTree_arg2_0 =
  (`Node(_lh_initTree_arg2_0, ((map_lh__d1_d4 (initTree_lh__d1 _lh_initTree_arg1_0)) (_lh_initTree_arg1_0 _lh_initTree_arg2_0))));;
let rec mkTree_lh__d1 _lh_mkTree_arg1_0 =
  (match _lh_mkTree_arg1_0 with
    | `CSP(_lh_mkTree_CSP_0_0, _lh_mkTree_CSP_1_0, _lh_mkTree_CSP_2_0) -> 
      (let rec next_0 = (fun ss_0 -> 
        (if ((maxLevel_lh__d3 ss_0) < _lh_mkTree_CSP_0_0) then
          (let rec _lh_listcomp_fun_0 = (fun _lh_listcomp_fun_para_0 -> 
            (match _lh_listcomp_fun_para_0 with
              | `LH_C(_lh_listcomp_fun_ls_h_0, _lh_listcomp_fun_ls_t_0) -> 
                (`LH_C((`LH_C((`Assign(((maxLevel_lh__d4 ss_0) + 1), _lh_listcomp_fun_ls_h_0)), ss_0)), (_lh_listcomp_fun_0 _lh_listcomp_fun_ls_t_0)))
              | `LH_N -> 
                (`LH_N))) in
            (_lh_listcomp_fun_0 ((enumFromTo_lh__d9 1) _lh_mkTree_CSP_1_0)))
        else
          (`LH_N))) in
        ((initTree_lh__d1 next_0) (`LH_N))));;
let rec fst_lh__d2 _lh_fst_arg1_0 =
  (match _lh_fst_arg1_0 with
    | `LH_P2(_lh_fst_LH_P2_0_0, _lh_fst_LH_P2_1_0) -> 
      _lh_fst_LH_P2_0_0);;
let rec snd_lh__d1 _lh_snd_arg1_1 =
  (match _lh_snd_arg1_1 with
    | `LH_P2(_lh_snd_LH_P2_0_1, _lh_snd_LH_P2_1_1) -> 
      _lh_snd_LH_P2_1_1);;
let rec knownConflict_lh__d3 _lh_knownConflict_arg1_0 =
  (match _lh_knownConflict_arg1_0 with
    | `Known(_lh_knownConflict_Known_0_0) -> 
      (match _lh_knownConflict_Known_0_0 with
        | `LH_C(_lh_knownConflict_LH_C_0_0, _lh_knownConflict_LH_C_1_0) -> 
          true
        | _ -> 
          false)
    | _ -> 
      false);;
let rec knownSolution_lh__d1 _lh_knownSolution_arg1_0 =
  (match _lh_knownSolution_arg1_0 with
    | `Known(_lh_knownSolution_Known_0_0) -> 
      (match _lh_knownSolution_Known_0_0 with
        | `LH_N -> 
          true
        | _ -> 
          false)
    | _ -> 
      false);;
let rec snd_lh__d2 _lh_snd_arg1_0 =
  (match _lh_snd_arg1_0 with
    | `LH_P2(_lh_snd_LH_P2_0_0, _lh_snd_LH_P2_1_0) -> 
      _lh_snd_LH_P2_1_0);;
let rec map_lh__d7 f_1_5 ls_1_2 =
  (match ls_1_2 with
    | `LH_C(h_1_3, t_1_3) -> 
      (`LH_C((f_1_5 h_1_3), ((map_lh__d7 f_1_5) t_1_3)))
    | `LH_N -> 
      (`LH_N));;
let rec concat_lh__d1 lss_0 =
  (match lss_0 with
    | `LH_C(h_3, t_3) -> 
      ((mappend_lh__d1 h_3) (concat_lh__d1 t_3))
    | `LH_N -> 
      (`LH_N));;
let rec leaves_lh__d1 _lh_leaves_arg1_0 =
  (match _lh_leaves_arg1_0 with
    | `Node(_lh_leaves_Node_0_0, _lh_leaves_Node_1_0) -> 
      (match _lh_leaves_Node_1_0 with
        | `LH_N -> 
          (`LH_C(_lh_leaves_Node_0_0, (`LH_N)))
        | _ -> 
          (concat_lh__d1 ((map_lh__d1_d4 leaves_lh__d1) _lh_leaves_Node_1_0))));;
let rec filter_lh__d2 f_1_4 ls_1_1 =
  (match ls_1_1 with
    | `LH_C(h_1_2, t_1_2) -> 
      (if (f_1_4 h_1_2) then
        (`LH_C(h_1_2, ((filter_lh__d2 f_1_4) t_1_2)))
      else
        ((filter_lh__d2 f_1_4) t_1_2))
    | `LH_N -> 
      (`LH_N));;
let rec search_lh__d1 _lh_search_arg1_0 _lh_search_arg2_0 =
  ((fun _lh_funcomp_x_4 -> 
    ((fun _lh_funcomp_x_5 -> 
      ((fun _lh_funcomp_x_6 -> 
        ((fun _lh_funcomp_x_7 -> 
          ((fun _lh_funcomp_x_8 -> 
            ((map_lh__d7 fst_lh__d2) ((filter_lh__d2 (fun _lh_funcomp_x_9 -> 
              (knownSolution_lh__d1 (snd_lh__d1 _lh_funcomp_x_9)))) _lh_funcomp_x_8))) (leaves_lh__d1 _lh_funcomp_x_7))) ((prune_lh__d1 (fun _lh_funcomp_x_1_0 -> 
          (knownConflict_lh__d3 (snd_lh__d2 _lh_funcomp_x_1_0)))) _lh_funcomp_x_6))) ((_lh_search_arg1_0 _lh_search_arg2_0) _lh_funcomp_x_5))) (mkTree_lh__d1 _lh_funcomp_x_4))) _lh_search_arg2_0);;
let rec abs_lh__d1 _lh_abs_arg1_0 =
  (if (_lh_abs_arg1_0 > 0) then
    _lh_abs_arg1_0
  else
    (0 - _lh_abs_arg1_0));;
let rec safe_lh__d1 _lh_safe_arg1_0 _lh_safe_arg2_0 =
  (match _lh_safe_arg1_0 with
    | `Assign(_lh_safe_Assign_0_0, _lh_safe_Assign_1_0) -> 
      (match _lh_safe_arg2_0 with
        | `Assign(_lh_safe_Assign_0_1, _lh_safe_Assign_1_1) -> 
          ((_lh_safe_Assign_1_0 <> _lh_safe_Assign_1_1) && ((abs_lh__d1 (_lh_safe_Assign_0_0 - _lh_safe_Assign_0_1)) <> (abs_lh__d1 (_lh_safe_Assign_1_0 - _lh_safe_Assign_1_1))))));;
let rec queens_lh__d1 _lh_queens_arg1_0 =
  (`CSP(_lh_queens_arg1_0, _lh_queens_arg1_0, safe_lh__d1));;
let rec try_lh__d1 _lh_try_arg1_0 _lh_try_arg2_0 =
  (length_lh__d1 ((search_lh__d1 _lh_try_arg2_0) (queens_lh__d1 _lh_try_arg1_0)));;
let rec map_lh__d8 f_1_3 ls_1_0 =
  (match ls_1_0 with
    | `LH_C(h_1_1, t_1_1) -> 
      (`LH_C((f_1_3 h_1_1), ((map_lh__d8 f_1_3) t_1_1)))
    | `LH_N -> 
      (`LH_N));;
let rec notElem_lh__d1 _lh_notElem_arg1_0 _lh_notElem_arg2_0 =
  (match _lh_notElem_arg2_0 with
    | `LH_N -> 
      true
    | `LH_C(_lh_notElem_LH_C_0_0, _lh_notElem_LH_C_1_0) -> 
      (if (_lh_notElem_arg1_0 = _lh_notElem_LH_C_0_0) then
        false
      else
        ((notElem_lh__d1 _lh_notElem_arg1_0) _lh_notElem_LH_C_1_0)));;
let rec union_lh__d2 _lh_union_arg1_0 _lh_union_arg2_0 =
  (((unionBy_lh__d1 (fun a_2 b_1 -> 
    (a_2 = b_1))) _lh_union_arg1_0) _lh_union_arg2_0);;
let rec combine_lh__d2 _lh_combine_arg1_0 _lh_combine_arg2_0 =
  (match _lh_combine_arg1_0 with
    | `LH_N -> 
      _lh_combine_arg2_0
    | `LH_C(_lh_combine_LH_C_0_0, _lh_combine_LH_C_1_0) -> 
      (match _lh_combine_LH_C_0_0 with
        | `LH_P2(_lh_combine_LH_P2_0_0, _lh_combine_LH_P2_1_0) -> 
          (match _lh_combine_LH_P2_1_0 with
            | `Known(_lh_combine_Known_0_0) -> 
              (if ((notElem_lh__d1 (maxLevel_lh__d4 _lh_combine_LH_P2_0_0)) _lh_combine_Known_0_0) then
                _lh_combine_Known_0_0
              else
                ((combine_lh__d2 _lh_combine_LH_C_1_0) ((union_lh__d2 _lh_combine_Known_0_0) _lh_combine_arg2_0)))
            | _ -> 
              (failwith "lh_default_error"))));;
let rec bj_lh__d1 _lh_bj_arg1_0 =
  (let rec f_2_5 = (fun _lh_f_arg1_0 _lh_f_arg2_0 -> 
    (match _lh_f_arg1_0 with
      | `LH_P2(_lh_f_LH_P2_0_0, _lh_f_LH_P2_1_0) -> 
        (match _lh_f_LH_P2_1_0 with
          | `Known(_lh_f_Known_0_0) -> 
            (`Node((`LH_P2(_lh_f_LH_P2_0_0, (`Known(_lh_f_Known_0_0)))), _lh_f_arg2_0))
          | `Unknown -> 
            (`Node((`LH_P2(_lh_f_LH_P2_0_0, (`Known(((combine_lh__d2 ((map_lh__d8 label_lh__d2) _lh_f_arg2_0)) (`LH_N)))))), _lh_f_arg2_0))))) in
    (foldTree_lh__d2 f_2_5));;
let rec mapTree_lh__d7 _lh_mapTree_arg1_0 _lh_mapTree_arg2_0 =
  (match _lh_mapTree_arg2_0 with
    | `Node(_lh_mapTree_Node_0_0, _lh_mapTree_Node_1_0) -> 
      (`Node((_lh_mapTree_arg1_0 _lh_mapTree_Node_0_0), ((map_lh__d1_d4 (mapTree_lh__d7 _lh_mapTree_arg1_0)) _lh_mapTree_Node_1_0))));;
let rec complete_lh__d4 _lh_complete_arg1_0 _lh_complete_arg2_0 =
  (match _lh_complete_arg1_0 with
    | `CSP(_lh_complete_CSP_0_0, _lh_complete_CSP_1_0, _lh_complete_CSP_2_0) -> 
      ((maxLevel_lh__d4 _lh_complete_arg2_0) = _lh_complete_CSP_0_0));;
let rec checkComplete_lh__d5 _lh_checkComplete_arg1_0 _lh_checkComplete_arg2_0 =
  (if ((complete_lh__d4 _lh_checkComplete_arg1_0) _lh_checkComplete_arg2_0) then
    (`Known((`LH_N)))
  else
    (`Unknown));;
let rec level_lh__d4 _lh_level_arg1_0 =
  (match _lh_level_arg1_0 with
    | `Assign(_lh_level_Assign_0_0, _lh_level_Assign_1_0) -> 
      _lh_level_Assign_0_0);;
let rec reverse_lh__d2 ls_4 =
  ((reverse_helper_lh__d1 ls_4) (`LH_N));;
let rec earliestInconsistency_lh__d3 _lh_earliestInconsistency_arg1_0 _lh_earliestInconsistency_arg2_0 =
  (match _lh_earliestInconsistency_arg1_0 with
    | `CSP(_lh_earliestInconsistency_CSP_0_0, _lh_earliestInconsistency_CSP_1_0, _lh_earliestInconsistency_CSP_2_0) -> 
      (match _lh_earliestInconsistency_arg2_0 with
        | `LH_N -> 
          (`Nothing)
        | `LH_C(_lh_earliestInconsistency_LH_C_0_0, _lh_earliestInconsistency_LH_C_1_0) -> 
          (let rec _lh_matchIdent_0 = ((filter_lh__d3 (fun _lh_funcomp_x_1 -> 
            (not ((_lh_earliestInconsistency_CSP_2_0 _lh_earliestInconsistency_LH_C_0_0) _lh_funcomp_x_1)))) (reverse_lh__d2 _lh_earliestInconsistency_LH_C_1_0)) in
            (match _lh_matchIdent_0 with
              | `LH_N -> 
                (`Nothing)
              | `LH_C(_lh_earliestInconsistency_LH_C_0_1, _lh_earliestInconsistency_LH_C_1_1) -> 
                (`Just((`LH_P2((level_lh__d4 _lh_earliestInconsistency_LH_C_0_0), (level_lh__d4 _lh_earliestInconsistency_LH_C_0_1)))))))));;
let rec bt_lh__d3 _lh_bt_arg1_0 =
  (let rec f_2_4 = (fun s_0 -> 
    (`LH_P2(s_0, (let rec _lh_matchIdent_4 = ((earliestInconsistency_lh__d3 _lh_bt_arg1_0) s_0) in
      (match _lh_matchIdent_4 with
        | `Nothing -> 
          ((checkComplete_lh__d5 _lh_bt_arg1_0) s_0)
        | `Just(_lh_bt_Just_0_0) -> 
          (match _lh_bt_Just_0_0 with
            | `LH_P2(_lh_bt_LH_P2_0_0, _lh_bt_LH_P2_1_0) -> 
              (`Known((`LH_C(_lh_bt_LH_P2_0_0, (`LH_C(_lh_bt_LH_P2_1_0, (`LH_N))))))))))))) in
    (mapTree_lh__d7 f_2_4));;
let rec bjbt_lh__d1 _lh_bjbt_arg1_0 _lh_funcomp_x_1_2 =
  ((bj_lh__d1 _lh_bjbt_arg1_0) ((bt_lh__d3 _lh_bjbt_arg1_0) _lh_funcomp_x_1_2));;
let rec checkComplete_lh__d4 _lh_checkComplete_arg1_1 _lh_checkComplete_arg2_1 =
  (if ((complete_lh__d4 _lh_checkComplete_arg1_1) _lh_checkComplete_arg2_1) then
    (`Known((`LH_N)))
  else
    (`Unknown));;
let rec level_lh__d3 _lh_level_arg1_1 =
  (match _lh_level_arg1_1 with
    | `Assign(_lh_level_Assign_0_1, _lh_level_Assign_1_1) -> 
      _lh_level_Assign_0_1);;
let rec earliestInconsistency_lh__d2 _lh_earliestInconsistency_arg1_1 _lh_earliestInconsistency_arg2_1 =
  (match _lh_earliestInconsistency_arg1_1 with
    | `CSP(_lh_earliestInconsistency_CSP_0_1, _lh_earliestInconsistency_CSP_1_1, _lh_earliestInconsistency_CSP_2_1) -> 
      (match _lh_earliestInconsistency_arg2_1 with
        | `LH_N -> 
          (`Nothing)
        | `LH_C(_lh_earliestInconsistency_LH_C_0_2, _lh_earliestInconsistency_LH_C_1_2) -> 
          (let rec _lh_matchIdent_1 = ((filter_lh__d3 (fun _lh_funcomp_x_3 -> 
            (not ((_lh_earliestInconsistency_CSP_2_1 _lh_earliestInconsistency_LH_C_0_2) _lh_funcomp_x_3)))) (reverse_lh__d2 _lh_earliestInconsistency_LH_C_1_2)) in
            (match _lh_matchIdent_1 with
              | `LH_N -> 
                (`Nothing)
              | `LH_C(_lh_earliestInconsistency_LH_C_0_3, _lh_earliestInconsistency_LH_C_1_3) -> 
                (`Just((`LH_P2((level_lh__d3 _lh_earliestInconsistency_LH_C_0_2), (level_lh__d4 _lh_earliestInconsistency_LH_C_0_3)))))))));;
let rec map_lh__d1_d2 f_4 ls_3 =
  (match ls_3 with
    | `LH_C(h_5, t_5) -> 
      (`LH_C((f_4 h_5), ((map_lh__d1_d2 f_4) t_5)))
    | `LH_N -> 
      (`LH_N));;
let rec mapTree_lh__d6 _lh_mapTree_arg1_1 _lh_mapTree_arg2_1 =
  (match _lh_mapTree_arg2_1 with
    | `Node(_lh_mapTree_Node_0_1, _lh_mapTree_Node_1_1) -> 
      (`Node((_lh_mapTree_arg1_1 _lh_mapTree_Node_0_1), ((map_lh__d1_d2 (mapTree_lh__d6 _lh_mapTree_arg1_1)) _lh_mapTree_Node_1_1))));;
let rec bt_lh__d2 _lh_bt_arg1_1 =
  (let rec f_2_7 = (fun s_1 -> 
    (`LH_P2(s_1, (let rec _lh_matchIdent_5 = ((earliestInconsistency_lh__d2 _lh_bt_arg1_1) s_1) in
      (match _lh_matchIdent_5 with
        | `Nothing -> 
          ((checkComplete_lh__d4 _lh_bt_arg1_1) s_1)
        | `Just(_lh_bt_Just_0_1) -> 
          (match _lh_bt_Just_0_1 with
            | `LH_P2(_lh_bt_LH_P2_0_1, _lh_bt_LH_P2_1_1) -> 
              (`Known((`LH_C(_lh_bt_LH_P2_0_1, (`LH_C(_lh_bt_LH_P2_1_1, (`LH_N))))))))))))) in
    (mapTree_lh__d6 f_2_7));;
let rec map_lh__d1_d3 f_3 ls_2 =
  (match ls_2 with
    | `LH_C(h_4, t_4) -> 
      (`LH_C((f_3 h_4), ((map_lh__d1_d3 f_3) t_4)))
    | `LH_N -> 
      (`LH_N));;
let rec foldTree_lh__d1 _lh_foldTree_arg1_1 _lh_foldTree_arg2_1 =
  (match _lh_foldTree_arg2_1 with
    | `Node(_lh_foldTree_Node_0_1, _lh_foldTree_Node_1_1) -> 
      ((_lh_foldTree_arg1_1 _lh_foldTree_Node_0_1) ((map_lh__d1_d3 (foldTree_lh__d1 _lh_foldTree_arg1_1)) _lh_foldTree_Node_1_1)));;
let rec knownConflict_lh__d2 _lh_knownConflict_arg1_1 =
  (match _lh_knownConflict_arg1_1 with
    | `Known(_lh_knownConflict_Known_0_1) -> 
      (match _lh_knownConflict_Known_0_1 with
        | `LH_C(_lh_knownConflict_LH_C_0_1, _lh_knownConflict_LH_C_1_1) -> 
          true
        | _ -> 
          false)
    | _ -> 
      false);;
let rec maxLevel_lh__d2 _lh_maxLevel_arg1_2 =
  (match _lh_maxLevel_arg1_2 with
    | `LH_N -> 
      0
    | `LH_C(_lh_maxLevel_LH_C_0_2, _lh_maxLevel_LH_C_1_2) -> 
      (match _lh_maxLevel_LH_C_0_2 with
        | `Assign(_lh_maxLevel_Assign_0_2, _lh_maxLevel_Assign_1_2) -> 
          _lh_maxLevel_Assign_0_2));;
let rec combine_lh__d1 _lh_combine_arg1_1 _lh_combine_arg2_1 =
  (match _lh_combine_arg1_1 with
    | `LH_N -> 
      _lh_combine_arg2_1
    | `LH_C(_lh_combine_LH_C_0_1, _lh_combine_LH_C_1_1) -> 
      (match _lh_combine_LH_C_0_1 with
        | `LH_P2(_lh_combine_LH_P2_0_1, _lh_combine_LH_P2_1_1) -> 
          (match _lh_combine_LH_P2_1_1 with
            | `Known(_lh_combine_Known_0_1) -> 
              (if ((notElem_lh__d1 (maxLevel_lh__d2 _lh_combine_LH_P2_0_1)) _lh_combine_Known_0_1) then
                _lh_combine_Known_0_1
              else
                ((combine_lh__d1 _lh_combine_LH_C_1_1) ((union_lh__d2 _lh_combine_Known_0_1) _lh_combine_arg2_1)))
            | _ -> 
              (failwith "lh_default_error"))));;
let rec map_lh__d6 f_1_6 ls_1_3 =
  (match ls_1_3 with
    | `LH_C(h_1_4, t_1_4) -> 
      (`LH_C((f_1_6 h_1_4), ((map_lh__d6 f_1_6) t_1_4)))
    | `LH_N -> 
      (`LH_N));;
let rec label_lh__d1 _lh_label_arg1_1 =
  (match _lh_label_arg1_1 with
    | `Node(_lh_label_Node_0_1, _lh_label_Node_1_1) -> 
      _lh_label_Node_0_1);;
let rec bj'_lh__d1 _lh_bj'_arg1_0 =
  (let rec f_2_6 = (fun _lh_f_arg1_1 _lh_f_arg2_1 -> 
    (match _lh_f_arg1_1 with
      | `LH_P2(_lh_f_LH_P2_0_1, _lh_f_LH_P2_1_1) -> 
        (match _lh_f_LH_P2_1_1 with
          | `Known(_lh_f_Known_0_1) -> 
            (`Node((`LH_P2(_lh_f_LH_P2_0_1, (`Known(_lh_f_Known_0_1)))), _lh_f_arg2_1))
          | `Unknown -> 
            (let rec cs'_0 = (`Known(((combine_lh__d1 ((map_lh__d6 label_lh__d1) _lh_f_arg2_1)) (`LH_N)))) in
              (if (knownConflict_lh__d2 cs'_0) then
                (`Node((`LH_P2(_lh_f_LH_P2_0_1, cs'_0)), (`LH_N)))
              else
                (`Node((`LH_P2(_lh_f_LH_P2_0_1, cs'_0)), _lh_f_arg2_1))))))) in
    (foldTree_lh__d1 f_2_6));;
let rec bjbt'_lh__d1 _lh_bjbt'_arg1_0 _lh_funcomp_x_1_3 =
  ((bj'_lh__d1 _lh_bjbt'_arg1_0) ((bt_lh__d2 _lh_bjbt'_arg1_0) _lh_funcomp_x_1_3));;
let rec fst_lh__d1 _lh_fst_arg1_1 =
  (match _lh_fst_arg1_1 with
    | `LH_P2(_lh_fst_LH_P2_0_1, _lh_fst_LH_P2_1_1) -> 
      _lh_fst_LH_P2_0_1);;
let rec value_lh__d1 _lh_value_arg1_1 =
  (match _lh_value_arg1_1 with
    | `Assign(_lh_value_Assign_0_1, _lh_value_Assign_1_1) -> 
      _lh_value_Assign_1_1);;
let rec map_lh__d9 f_1_2 ls_8 =
  (match ls_8 with
    | `LH_C(h_9, t_9) -> 
      (`LH_C((f_1_2 h_9), ((map_lh__d9 f_1_2) t_9)))
    | `LH_N -> 
      (`LH_N));;
let rec mapTree_lh__d3 _lh_mapTree_arg1_4 _lh_mapTree_arg2_4 =
  (match _lh_mapTree_arg2_4 with
    | `Node(_lh_mapTree_Node_0_4, _lh_mapTree_Node_1_4) -> 
      (`Node((_lh_mapTree_arg1_4 _lh_mapTree_Node_0_4), ((map_lh__d9 (mapTree_lh__d3 _lh_mapTree_arg1_4)) _lh_mapTree_Node_1_4))));;
let rec complete_lh__d2 _lh_complete_arg1_2 _lh_complete_arg2_2 =
  (match _lh_complete_arg1_2 with
    | `CSP(_lh_complete_CSP_0_2, _lh_complete_CSP_1_2, _lh_complete_CSP_2_2) -> 
      ((maxLevel_lh__d4 _lh_complete_arg2_2) = _lh_complete_CSP_0_2));;
let rec checkComplete_lh__d2 _lh_checkComplete_arg1_3 _lh_checkComplete_arg2_3 =
  (if ((complete_lh__d2 _lh_checkComplete_arg1_3) _lh_checkComplete_arg2_3) then
    (`Known((`LH_N)))
  else
    (`Unknown));;
let rec head_lh__d1 ls_2_3 =
  (match ls_2_3 with
    | `LH_C(h_2_4, t_2_4) -> 
      h_2_4
    | `LH_N -> 
      (failwith "lh_default_error"));;
let rec atIndex_lh__d1 n_1 ls_2_2 =
  (if (n_1 < 0) then
    (failwith "lh_default_error")
  else
    (match ls_2_2 with
      | `LH_C(h_2_3, t_2_3) -> 
        (if (n_1 = 0) then
          h_2_3
        else
          ((atIndex_lh__d1 (n_1 - 1)) t_2_3))
      | `LH_N -> 
        (failwith "lh_default_error")));;
let rec lookupCache_lh__d1 _lh_lookupCache_arg1_1 _lh_lookupCache_arg2_1 =
  (let rec f_3_0 = (fun _lh_f_arg1_4 _lh_f_arg2_3 -> 
    (match _lh_f_arg2_3 with
      | `LH_P2(_lh_f_LH_P2_0_5, _lh_f_LH_P2_1_5) -> 
        (match _lh_f_LH_P2_0_5 with
          | `LH_N -> 
            (`LH_P2((`LH_P2((`LH_N), (`Unknown))), _lh_f_LH_P2_1_5))
          | `LH_C(_lh_f_LH_C_0_1, _lh_f_LH_C_1_1) -> 
            (let rec tableEntry_1 = ((atIndex_lh__d1 ((value_lh__d1 _lh_f_LH_C_0_1) - 1)) (head_lh__d1 _lh_f_LH_P2_1_5)) in
              (let rec cs_4 = (if (tableEntry_1 = (`Unknown)) then
                ((checkComplete_lh__d2 _lh_f_arg1_4) (`LH_C(_lh_f_LH_C_0_1, _lh_f_LH_C_1_1)))
              else
                tableEntry_1) in
                (`LH_P2((`LH_P2((`LH_C(_lh_f_LH_C_0_1, _lh_f_LH_C_1_1)), cs_4)), _lh_f_LH_P2_1_5))))))) in
    ((mapTree_lh__d3 (f_3_0 _lh_lookupCache_arg1_1)) _lh_lookupCache_arg2_1));;
let rec zipWith_lh__d2 f_1_0 xs_3 ys_3 =
  (match xs_3 with
    | `LH_C(hx_2, tx_2) -> 
      (match ys_3 with
        | `LH_C(hy_2, ty_2) -> 
          (`LH_C(((f_1_0 hx_2) hy_2), (((zipWith_lh__d2 f_1_0) tx_2) ty_2)))
        | `LH_N -> 
          (`LH_N))
    | `LH_N -> 
      (`LH_N));;
let rec zipWith_lh__d1 f_1_1 xs_4 ys_4 =
  (match xs_4 with
    | `LH_C(hx_3, tx_3) -> 
      (match ys_4 with
        | `LH_C(hy_3, ty_3) -> 
          (`LH_C(((f_1_1 hx_3) hy_3), (((zipWith_lh__d1 f_1_1) tx_3) ty_3)))
        | `LH_N -> 
          (`LH_N))
    | `LH_N -> 
      (`LH_N));;
let rec enumFromTo_lh__d5 a_7 b_6 =
  (if (a_7 <= b_6) then
    (`LH_C(a_7, ((enumFromTo_lh__d5 (a_7 + 1)) b_6)))
  else
    (`LH_N));;
let rec enumFromTo_lh__d6 a_6 b_5 =
  (if (a_6 <= b_5) then
    (`LH_C(a_6, ((enumFromTo_lh__d6 (a_6 + 1)) b_5)))
  else
    (`LH_N));;
let rec fillTable_lh__d1 _lh_fillTable_arg1_1 _lh_fillTable_arg2_1 _lh_fillTable_arg3_1 =
  (match _lh_fillTable_arg1_1 with
    | `LH_N -> 
      _lh_fillTable_arg3_1
    | `LH_C(_lh_fillTable_LH_C_0_1, _lh_fillTable_LH_C_1_1) -> 
      (match _lh_fillTable_LH_C_0_1 with
        | `Assign(_lh_fillTable_Assign_0_1, _lh_fillTable_Assign_1_1) -> 
          (match _lh_fillTable_arg2_1 with
            | `CSP(_lh_fillTable_CSP_0_1, _lh_fillTable_CSP_1_1, _lh_fillTable_CSP_2_1) -> 
              (let rec f_2_1 = (fun cs_2 varval_1 -> 
                (let rec _lh_matchIdent_3 = varval_1 in
                  (match _lh_matchIdent_3 with
                    | `LH_P2(_lh_fillTable_LH_P2_0_1, _lh_fillTable_LH_P2_1_1) -> 
                      (if ((cs_2 = (`Unknown)) && (not ((_lh_fillTable_CSP_2_1 (`Assign(_lh_fillTable_Assign_0_1, _lh_fillTable_Assign_1_1))) (`Assign(_lh_fillTable_LH_P2_0_1, _lh_fillTable_LH_P2_1_1))))) then
                        (`Known((`LH_C(_lh_fillTable_Assign_0_1, (`LH_C(_lh_fillTable_LH_P2_0_1, (`LH_N)))))))
                      else
                        cs_2)))) in
                (((zipWith_lh__d1 (zipWith_lh__d2 f_2_1)) _lh_fillTable_arg3_1) (let rec _lh_listcomp_fun_3 = (fun _lh_listcomp_fun_para_3 -> 
                  (match _lh_listcomp_fun_para_3 with
                    | `LH_C(_lh_listcomp_fun_ls_h_3, _lh_listcomp_fun_ls_t_3) -> 
                      (`LH_C((let rec _lh_listcomp_fun_4 = (fun _lh_listcomp_fun_para_4 -> 
                        (match _lh_listcomp_fun_para_4 with
                          | `LH_C(_lh_listcomp_fun_ls_h_4, _lh_listcomp_fun_ls_t_4) -> 
                            (`LH_C((`LH_P2(_lh_listcomp_fun_ls_h_3, _lh_listcomp_fun_ls_h_4)), (_lh_listcomp_fun_4 _lh_listcomp_fun_ls_t_4)))
                          | `LH_N -> 
                            (`LH_N))) in
                        (_lh_listcomp_fun_4 ((enumFromTo_lh__d5 1) _lh_fillTable_CSP_1_1))), (_lh_listcomp_fun_3 _lh_listcomp_fun_ls_t_3)))
                    | `LH_N -> 
                      (`LH_N))) in
                  (_lh_listcomp_fun_3 ((enumFromTo_lh__d6 (_lh_fillTable_Assign_0_1 + 1)) _lh_fillTable_CSP_0_1))))))));;
let rec tail_lh__d1 ls_2_1 =
  (match ls_2_1 with
    | `LH_C(h_2_2, t_2_2) -> 
      t_2_2
    | `LH_N -> 
      (failwith "lh_default_error"));;
let rec map_lh__d3 f_2_0 ls_2_0 =
  (match ls_2_0 with
    | `LH_C(h_2_1, t_2_1) -> 
      (`LH_C((f_2_0 h_2_1), ((map_lh__d3 f_2_0) t_2_1)))
    | `LH_N -> 
      (`LH_N));;
let rec cacheChecks_lh__d1 _lh_cacheChecks_arg1_1 _lh_cacheChecks_arg2_1 _lh_cacheChecks_arg3_1 =
  (match _lh_cacheChecks_arg3_1 with
    | `Node(_lh_cacheChecks_Node_0_1, _lh_cacheChecks_Node_1_1) -> 
      (`Node((`LH_P2(_lh_cacheChecks_Node_0_1, _lh_cacheChecks_arg2_1)), ((map_lh__d3 ((cacheChecks_lh__d1 _lh_cacheChecks_arg1_1) (((fillTable_lh__d1 _lh_cacheChecks_Node_0_1) _lh_cacheChecks_arg1_1) (tail_lh__d1 _lh_cacheChecks_arg2_1)))) _lh_cacheChecks_Node_1_1))));;
let rec map_lh__d4 f_1_9 ls_1_9 =
  (match ls_1_9 with
    | `LH_C(h_2_0, t_2_0) -> 
      (`LH_C((f_1_9 h_2_0), ((map_lh__d4 f_1_9) t_2_0)))
    | `LH_N -> 
      (`LH_N));;
let rec mapTree_lh__d2 _lh_mapTree_arg1_5 _lh_mapTree_arg2_5 =
  (match _lh_mapTree_arg2_5 with
    | `Node(_lh_mapTree_Node_0_5, _lh_mapTree_Node_1_5) -> 
      (`Node((_lh_mapTree_arg1_5 _lh_mapTree_Node_0_5), ((map_lh__d4 (mapTree_lh__d2 _lh_mapTree_arg1_5)) _lh_mapTree_Node_1_5))));;
let rec enumFromTo_lh__d2 a_1_1 b_9 =
  (if (a_1_1 <= b_9) then
    (`LH_C(a_1_1, ((enumFromTo_lh__d2 (a_1_1 + 1)) b_9)))
  else
    (`LH_N));;
let rec enumFromTo_lh__d1 a_1_2 b_1_0 =
  (if (a_1_2 <= b_1_0) then
    (`LH_C(a_1_2, ((enumFromTo_lh__d1 (a_1_2 + 1)) b_1_0)))
  else
    (`LH_N));;
let rec emptyTable_lh__d1 _lh_emptyTable_arg1_1 =
  (match _lh_emptyTable_arg1_1 with
    | `CSP(_lh_emptyTable_CSP_0_1, _lh_emptyTable_CSP_1_1, _lh_emptyTable_CSP_2_1) -> 
      (`LH_C((`LH_N), (let rec _lh_listcomp_fun_8 = (fun _lh_listcomp_fun_para_8 -> 
        (match _lh_listcomp_fun_para_8 with
          | `LH_C(_lh_listcomp_fun_ls_h_8, _lh_listcomp_fun_ls_t_8) -> 
            (`LH_C((let rec _lh_listcomp_fun_9 = (fun _lh_listcomp_fun_para_9 -> 
              (match _lh_listcomp_fun_para_9 with
                | `LH_C(_lh_listcomp_fun_ls_h_9, _lh_listcomp_fun_ls_t_9) -> 
                  (`LH_C((`Unknown), (_lh_listcomp_fun_9 _lh_listcomp_fun_ls_t_9)))
                | `LH_N -> 
                  (`LH_N))) in
              (_lh_listcomp_fun_9 ((enumFromTo_lh__d2 1) _lh_emptyTable_CSP_1_1))), (_lh_listcomp_fun_8 _lh_listcomp_fun_ls_t_8)))
          | `LH_N -> 
            (`LH_N))) in
        (_lh_listcomp_fun_8 ((enumFromTo_lh__d1 1) _lh_emptyTable_CSP_0_1))))));;
let rec bm_lh__d1 _lh_bm_arg1_0 _lh_funcomp_x_1_6 =
  ((fun _lh_funcomp_x_1_7 -> 
    ((mapTree_lh__d2 fst_lh__d1) ((lookupCache_lh__d1 _lh_bm_arg1_0) _lh_funcomp_x_1_7))) (((cacheChecks_lh__d1 _lh_bm_arg1_0) (emptyTable_lh__d1 _lh_bm_arg1_0)) _lh_funcomp_x_1_6));;
let rec testConstraints_nofib_lh__d1 _lh_testConstraints_nofib_arg1_0 =
  ((map_lh__d1 (try_lh__d1 _lh_testConstraints_nofib_arg1_0)) (`LH_C(bt_lh__d1, (`LH_C(bm_lh__d1, (`LH_C(bjbt_lh__d1, (`LH_C(bjbt'_lh__d1, (`LH_C(fc_lh__d1, (`LH_N))))))))))));;
let run () = 1 + (Obj.magic ((testConstraints_nofib_lh__d1 6)));
end;;

