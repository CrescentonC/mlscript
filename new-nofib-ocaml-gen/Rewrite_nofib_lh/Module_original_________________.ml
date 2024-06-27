
(* original *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_original_________________(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec eqExpr_lh _lh_eqExpr_arg1_0 _lh_eqExpr_arg2_0 =
  (match _lh_eqExpr_arg1_0 with
    | `Func(_lh_eqExpr_Func_0_0, _lh_eqExpr_Func_1_0) -> 
      (match _lh_eqExpr_arg2_0 with
        | `Func(_lh_eqExpr_Func_0_1, _lh_eqExpr_Func_1_1) -> 
          ((_lh_eqExpr_Func_0_0 = _lh_eqExpr_Func_0_1) && ((eqListExpr_lh _lh_eqExpr_Func_1_0) _lh_eqExpr_Func_1_1))
        | _ -> 
          false)
    | `Var(_lh_eqExpr_Var_0_0) -> 
      (match _lh_eqExpr_arg2_0 with
        | `Var(_lh_eqExpr_Var_0_1) -> 
          (_lh_eqExpr_Var_0_0 = _lh_eqExpr_Var_0_1)
        | _ -> 
          false)
    | _ -> 
      false)
and
eqListExpr_lh _lh_eqListExpr_arg1_0 _lh_eqListExpr_arg2_0 =
  (match _lh_eqListExpr_arg1_0 with
    | `LH_N -> 
      (match _lh_eqListExpr_arg2_0 with
        | `LH_N -> 
          true
        | _ -> 
          false)
    | `LH_C(_lh_eqListExpr_LH_C_0_0, _lh_eqListExpr_LH_C_1_0) -> 
      (match _lh_eqListExpr_arg2_0 with
        | `LH_C(_lh_eqListExpr_LH_C_0_1, _lh_eqListExpr_LH_C_1_1) -> 
          (if ((eqExpr_lh _lh_eqListExpr_LH_C_0_0) _lh_eqListExpr_LH_C_0_1) then
            ((eqListExpr_lh _lh_eqListExpr_LH_C_1_0) _lh_eqListExpr_LH_C_1_1)
          else
            false)
        | _ -> 
          false)
    | _ -> 
      false);;
let rec map_lh f_0 ls_0 =
  (match ls_0 with
    | `LH_C(h_0, t_0) -> 
      (`LH_C((f_0 h_0), ((map_lh f_0) t_0)))
    | `LH_N -> 
      (`LH_N));;
let rec foldr_lh f_2 i_0 ls_2 =
  (match ls_2 with
    | `LH_C(h_2, t_2) -> 
      ((f_2 h_2) (((foldr_lh f_2) i_0) t_2))
    | `LH_N -> 
      i_0);;
let rec orElse_lh _lh_orElse_arg1_0 _lh_orElse_arg2_0 =
  (match _lh_orElse_arg1_0 with
    | `Nothing -> 
      _lh_orElse_arg2_0
    | _ -> 
      _lh_orElse_arg1_0);;
let rec first_ok_lh _lh_first_ok_arg1_0 =
  (((foldr_lh orElse_lh) (`Nothing)) _lh_first_ok_arg1_0);;
let rec maybeX_lh _lh_maybeX_arg1_0 _lh_maybeX_arg2_0 =
  (if _lh_maybeX_arg1_0 then
    (`Just(_lh_maybeX_arg2_0))
  else
    (`Nothing));;
let rec assoc_lh _lh_assoc_arg1_0 _lh_assoc_arg2_0 =
  (let rec match_x_0 = (fun uv_0 -> 
    (let rec _lh_matchIdent_1_0 = uv_0 in
      (match _lh_matchIdent_1_0 with
        | `LH_P2(_lh_assoc_LH_P2_0_0, _lh_assoc_LH_P2_1_0) -> 
          ((maybeX_lh (_lh_assoc_arg2_0 = _lh_assoc_LH_P2_0_0)) _lh_assoc_LH_P2_1_0)))) in
    (first_ok_lh ((map_lh match_x_0) _lh_assoc_arg1_0)));;
let rec getOrElse_lh _lh_getOrElse_arg1_0 _lh_getOrElse_arg2_0 =
  (match _lh_getOrElse_arg1_0 with
    | `Just(_lh_getOrElse_Just_0_0) -> 
      _lh_getOrElse_Just_0_0
    | `Nothing -> 
      _lh_getOrElse_arg2_0);;
let rec apply_lh _lh_apply_arg1_0 _lh_apply_arg2_0 =
  ((getOrElse_lh ((assoc_lh _lh_apply_arg1_0) _lh_apply_arg2_0)) (`Var(_lh_apply_arg2_0)));;
let rec expr_fold_lh _lh_expr_fold_arg1_0 _lh_expr_fold_arg2_0 _lh_expr_fold_arg3_0 =
  (match _lh_expr_fold_arg3_0 with
    | `Var(_lh_expr_fold_Var_0_0) -> 
      (_lh_expr_fold_arg2_0 _lh_expr_fold_Var_0_0)
    | `Func(_lh_expr_fold_Func_0_0, _lh_expr_fold_Func_1_0) -> 
      ((_lh_expr_fold_arg1_0 _lh_expr_fold_Func_0_0) ((map_lh ((expr_fold_lh _lh_expr_fold_arg1_0) _lh_expr_fold_arg2_0)) _lh_expr_fold_Func_1_0)));;
let rec sub_lh _lh_sub_arg1_0 _lh_sub_arg2_0 =
  (((expr_fold_lh (fun x_1_4 y_2 -> 
    (`Func(x_1_4, y_2)))) (apply_lh _lh_sub_arg2_0)) _lh_sub_arg1_0);;
let rec the_lh _lh_the_arg1_0 =
  (match _lh_the_arg1_0 with
    | `Just(_lh_the_Just_0_0) -> 
      _lh_the_Just_0_0
    | _ -> 
      (failwith "lh_default_error"));;
let rec prop2_lh _lh_prop2_arg1_0 _lh_prop2_arg2_0 _lh_prop2_arg3_0 =
  (match _lh_prop2_arg2_0 with
    | `Nothing -> 
      (`Nothing)
    | `Just(_lh_prop2_Just_0_0) -> 
      ((_lh_prop2_arg1_0 _lh_prop2_Just_0_0) _lh_prop2_arg3_0));;
let rec prop_fold_lh _lh_prop_fold_arg1_0 _lh_prop_fold_arg2_0 _lh_prop_fold_arg3_0 =
  (match _lh_prop_fold_arg3_0 with
    | `LH_N -> 
      (`Just(_lh_prop_fold_arg2_0))
    | `LH_C(_lh_prop_fold_LH_C_0_0, _lh_prop_fold_LH_C_1_0) -> 
      (((prop2_lh (prop_fold_lh _lh_prop_fold_arg1_0)) ((_lh_prop_fold_arg1_0 _lh_prop_fold_arg2_0) _lh_prop_fold_LH_C_0_0)) _lh_prop_fold_LH_C_1_0));;
let rec zip_lh xs_0 ys_0 =
  (match xs_0 with
    | `LH_C(hx_0, tx_0) -> 
      (match ys_0 with
        | `LH_C(hy_0, ty_0) -> 
          (`LH_C((`LH_P2(hx_0, hy_0)), ((zip_lh tx_0) ty_0)))
        | `LH_N -> 
          (`LH_N))
    | `LH_N -> 
      (`LH_N));;
let rec croak_lh =
  (`Nothing);;
let rec succeed_lh _lh_succeed_arg1_0 =
  (`Just(_lh_succeed_arg1_0));;
let rec exists_lh _lh_exists_arg1_0 =
  (match _lh_exists_arg1_0 with
    | `Nothing -> 
      false
    | _ -> 
      true);;
let rec match'_lh _lh_match'_arg1_0 _lh_match'_arg2_0 =
  (match _lh_match'_arg2_0 with
    | `LH_P2(_lh_match'_LH_P2_0_0, _lh_match'_LH_P2_1_0) -> 
      (match _lh_match'_LH_P2_0_0 with
        | `Var(_lh_match'_Var_0_0) -> 
          (let rec u_0 = ((assoc_lh _lh_match'_arg1_0) _lh_match'_Var_0_0) in
            (if (not (exists_lh u_0)) then
              (succeed_lh (`LH_C((`LH_P2(_lh_match'_Var_0_0, _lh_match'_LH_P2_1_0)), _lh_match'_arg1_0)))
            else
              (if ((eqExpr_lh (the_lh u_0)) _lh_match'_LH_P2_1_0) then
                (succeed_lh _lh_match'_arg1_0)
              else
                croak_lh)))
        | `Func(_lh_match'_Func_0_0, _lh_match'_Func_1_0) -> 
          (match _lh_match'_LH_P2_1_0 with
            | `Func(_lh_match'_Func_0_1, _lh_match'_Func_1_1) -> 
              (if (_lh_match'_Func_0_0 = _lh_match'_Func_0_1) then
                (((prop_fold_lh match'_lh) _lh_match'_arg1_0) ((zip_lh _lh_match'_Func_1_0) _lh_match'_Func_1_1))
              else
                croak_lh)
            | `Var(_lh_match'_Var_0_1) -> 
              croak_lh
            | _ -> 
              (failwith "lh_default_error"))
        | _ -> 
          (failwith "lh_default_error"))
    | _ -> 
      (failwith "lh_default_error"));;
let rec match_lh _lh_match_arg1_0 _lh_match_arg2_0 =
  ((match'_lh (`LH_N)) (`LH_P2(_lh_match_arg1_0, _lh_match_arg2_0)));;
let rec lift_lh _lh_lift_arg1_0 _lh_lift_arg2_0 =
  (match _lh_lift_arg2_0 with
    | `Nothing -> 
      (`Nothing)
    | `Just(_lh_lift_Just_0_0) -> 
      (`Just((_lh_lift_arg1_0 _lh_lift_Just_0_0))));;
let rec rewrite_lh _lh_rewrite_arg1_0 =
  (match _lh_rewrite_arg1_0 with
    | `Eqn(_lh_rewrite_Eqn_0_0, _lh_rewrite_Eqn_1_0) -> 
      (match _lh_rewrite_Eqn_1_0 with
        | `LH_P2(_lh_rewrite_LH_P2_0_0, _lh_rewrite_LH_P2_1_0) -> 
          (fun _lh_funcomp_x_8 -> 
            ((lift_lh (sub_lh _lh_rewrite_LH_P2_1_0)) ((match_lh _lh_rewrite_LH_P2_0_0) _lh_funcomp_x_8)))));;
let rec orElseMap_lh _lh_orElseMap_arg1_0 _lh_orElseMap_arg2_0 _lh_orElseMap_arg3_0 =
  ((orElse_lh (_lh_orElseMap_arg1_0 _lh_orElseMap_arg3_0)) (_lh_orElseMap_arg2_0 _lh_orElseMap_arg3_0));;
let rec try_all_lh _lh_try_all_arg1_0 =
  (((foldr_lh orElseMap_lh) (fun dum_0 -> 
    croak_lh)) _lh_try_all_arg1_0);;
let rec mappend_lh xs_2 ys_2 =
  (match xs_2 with
    | `LH_C(h_4, t_4) -> 
      (`LH_C(h_4, ((mappend_lh t_4) ys_2)))
    | `LH_N -> 
      ys_2);;
let rec g_rest_lh _lh_g_rest_arg1_0 =
  (match _lh_g_rest_arg1_0 with
    | `LH_C(_lh_g_rest_LH_C_0_0, _lh_g_rest_LH_C_1_0) -> 
      (match _lh_g_rest_LH_C_0_0 with
        | `Func(_lh_g_rest_Func_0_0, _lh_g_rest_Func_1_0) -> 
          ((mappend_lh _lh_g_rest_Func_1_0) _lh_g_rest_LH_C_1_0)
        | `Var(_lh_g_rest_Var_0_0) -> 
          _lh_g_rest_LH_C_1_0
        | _ -> 
          (failwith "lh_default_error"))
    | _ -> 
      (failwith "lh_default_error"));;
let rec tail_lh ls_3 =
  (match ls_3 with
    | `LH_C(h_3, t_3) -> 
      t_3
    | `LH_N -> 
      (failwith "lh_default_error"));;
let rec g_skip_lh _lh_g_skip_arg1_0 =
  (tail_lh _lh_g_skip_arg1_0);;
let rec g_first_lh _lh_g_first_arg1_0 =
  (match _lh_g_first_arg1_0 with
    | `LH_C(_lh_g_first_LH_C_0_0, _lh_g_first_LH_C_1_0) -> 
      (match _lh_g_first_LH_C_0_0 with
        | `Func(_lh_g_first_Func_0_0, _lh_g_first_Func_1_0) -> 
          (`Afunc(_lh_g_first_Func_0_0))
        | `Var(_lh_g_first_Var_0_0) -> 
          (`Avar)
        | _ -> 
          (failwith "lh_default_error"))
    | _ -> 
      (failwith "lh_default_error"));;
let rec find'_lh _lh_find'_arg1_0 _lh_find'_arg2_0 =
  (match _lh_find'_arg2_0 with
    | `Return(_lh_find'_Return_0_0) -> 
      _lh_find'_Return_0_0
    | `Switch(_lh_find'_Switch_0_0, _lh_find'_Switch_1_0) -> 
      ((mappend_lh (((find_assoc_lh (g_first_lh _lh_find'_arg1_0)) (g_rest_lh _lh_find'_arg1_0)) _lh_find'_Switch_0_0)) ((find'_lh (g_skip_lh _lh_find'_arg1_0)) _lh_find'_Switch_1_0)))
and
find_assoc_lh _lh_find_assoc_arg1_0 _lh_find_assoc_arg2_0 _lh_find_assoc_arg3_0 =
  (match _lh_find_assoc_arg1_0 with
    | `Afunc(_lh_find_assoc_Afunc_0_0) -> 
      ((getOrElse_lh ((lift_lh (find'_lh _lh_find_assoc_arg2_0)) ((assoc_lh _lh_find_assoc_arg3_0) _lh_find_assoc_Afunc_0_0))) (`LH_N))
    | `Avar -> 
      (`LH_N));;
let rec g_init_lh _lh_g_init_arg1_0 =
  (`LH_C(_lh_g_init_arg1_0, (`LH_N)));;
let rec find_lh _lh_find_arg1_0 _lh_find_arg2_0 =
  ((find'_lh (g_init_lh _lh_find_arg1_0)) _lh_find_arg2_0);;
let rec dnet_reduce_lh _lh_dnet_reduce_arg1_0 _lh_dnet_reduce_arg2_0 =
  ((try_all_lh ((map_lh rewrite_lh) ((find_lh _lh_dnet_reduce_arg2_0) _lh_dnet_reduce_arg1_0))) _lh_dnet_reduce_arg2_0);;
let rec enumFrom_lh a_0 =
  (lazy (`LH_C(a_0, (enumFrom_lh (a_0 + 1)))));;
let rec zip_lz_nl_lh xs_1 ys_1 =
  (match ys_1 with
    | `LH_C(hy_1, ty_1) -> 
      (match (Lazy.force xs_1) with
        | `LH_C(hx_1, tx_1) -> 
          (`LH_C((`LH_P2(hx_1, hy_1)), ((zip_lz_nl_lh tx_1) ty_1)))
        | `LH_N -> 
          (`LH_N))
    | `LH_N -> 
      (`LH_N));;
let rec subterms_lh _lh_subterms_arg1_0 =
  (match _lh_subterms_arg1_0 with
    | `Var(_lh_subterms_Var_0_0) -> 
      (`LH_N)
    | `Func(_lh_subterms_Func_0_0, _lh_subterms_Func_1_0) -> 
      ((mappend_lh (`LH_C((`LH_P2((`LH_N), (`Func(_lh_subterms_Func_0_0, _lh_subterms_Func_1_0)))), (`LH_N)))) (let rec _lh_listcomp_fun_1 = (fun _lh_listcomp_fun_para_1 -> 
        (match _lh_listcomp_fun_para_1 with
          | `LH_C(_lh_listcomp_fun_ls_h_1, _lh_listcomp_fun_ls_t_1) -> 
            (match _lh_listcomp_fun_ls_h_1 with
              | `LH_P2(_lh_subterms_LH_P2_0_0, _lh_subterms_LH_P2_1_0) -> 
                (let rec _lh_listcomp_fun_2 = (fun _lh_listcomp_fun_para_2 -> 
                  (match _lh_listcomp_fun_para_2 with
                    | `LH_C(_lh_listcomp_fun_ls_h_2, _lh_listcomp_fun_ls_t_2) -> 
                      (match _lh_listcomp_fun_ls_h_2 with
                        | `LH_P2(_lh_subterms_LH_P2_0_1, _lh_subterms_LH_P2_1_1) -> 
                          (`LH_C((`LH_P2((`LH_C(_lh_subterms_LH_P2_0_0, _lh_subterms_LH_P2_0_1)), _lh_subterms_LH_P2_1_1)), (_lh_listcomp_fun_2 _lh_listcomp_fun_ls_t_2)))
                        | _ -> 
                          (_lh_listcomp_fun_2 _lh_listcomp_fun_ls_t_2))
                    | `LH_N -> 
                      (_lh_listcomp_fun_1 _lh_listcomp_fun_ls_t_1))) in
                  (_lh_listcomp_fun_2 (subterms_lh _lh_subterms_LH_P2_1_0)))
              | _ -> 
                (_lh_listcomp_fun_1 _lh_listcomp_fun_ls_t_1))
          | `LH_N -> 
            (`LH_N))) in
        (_lh_listcomp_fun_1 ((zip_lz_nl_lh (enumFrom_lh 0)) _lh_subterms_Func_1_0)))));;
let rec modify_lh _lh_modify_arg1_0 _lh_modify_arg2_0 _lh_modify_arg3_0 =
  (match _lh_modify_arg1_0 with
    | `LH_C(_lh_modify_LH_C_0_0, _lh_modify_LH_C_1_0) -> 
      (match _lh_modify_arg2_0 with
        | 0 -> 
          (`LH_C((_lh_modify_arg3_0 _lh_modify_LH_C_0_0), _lh_modify_LH_C_1_0))
        | _ -> 
          (`LH_C(_lh_modify_LH_C_0_0, (((modify_lh _lh_modify_LH_C_1_0) (_lh_modify_arg2_0 - 1)) _lh_modify_arg3_0))))
    | _ -> 
      (failwith "lh_default_error"));;
let rec replace_lh _lh_replace_arg1_0 _lh_replace_arg2_0 _lh_replace_arg3_0 =
  (match _lh_replace_arg2_0 with
    | `LH_N -> 
      _lh_replace_arg3_0
    | _ -> 
      (match _lh_replace_arg1_0 with
        | `Func(_lh_replace_Func_0_0, _lh_replace_Func_1_0) -> 
          (match _lh_replace_arg2_0 with
            | `LH_C(_lh_replace_LH_C_0_0, _lh_replace_LH_C_1_0) -> 
              (`Func(_lh_replace_Func_0_0, (((modify_lh _lh_replace_Func_1_0) _lh_replace_LH_C_0_0) (fun t_8 -> 
                (((replace_lh t_8) _lh_replace_LH_C_1_0) _lh_replace_arg3_0)))))
            | _ -> 
              (failwith "lh_default_error"))
        | _ -> 
          (failwith "lh_default_error")));;
let rec inside_lh _lh_inside_arg1_0 _lh_inside_arg2_0 =
  (first_ok_lh (let rec _lh_listcomp_fun_8 = (fun _lh_listcomp_fun_para_8 -> 
    (match _lh_listcomp_fun_para_8 with
      | `LH_C(_lh_listcomp_fun_ls_h_8, _lh_listcomp_fun_ls_t_8) -> 
        (match _lh_listcomp_fun_ls_h_8 with
          | `LH_P2(_lh_inside_LH_P2_0_0, _lh_inside_LH_P2_1_0) -> 
            (`LH_C(((lift_lh ((replace_lh _lh_inside_arg2_0) _lh_inside_LH_P2_0_0)) (_lh_inside_arg1_0 _lh_inside_LH_P2_1_0)), (_lh_listcomp_fun_8 _lh_listcomp_fun_ls_t_8)))
          | _ -> 
            (_lh_listcomp_fun_8 _lh_listcomp_fun_ls_t_8))
      | `LH_N -> 
        (`LH_N))) in
    (_lh_listcomp_fun_8 (subterms_lh _lh_inside_arg2_0))));;
let rec super_reduce_lh _lh_super_reduce_arg1_0 =
  (inside_lh (dnet_reduce_lh _lh_super_reduce_arg1_0));;
let rec pchar_lh _lh_pchar_arg1_0 _lh_pchar_arg2_0 =
  (match _lh_pchar_arg2_0 with
    | `LH_N -> 
      croak_lh
    | `LH_C(_lh_pchar_LH_C_0_0, _lh_pchar_LH_C_1_0) -> 
      (if (_lh_pchar_arg1_0 _lh_pchar_LH_C_0_0) then
        (succeed_lh (`LH_P2((`MkString((`LH_C(_lh_pchar_LH_C_0_0, (`LH_N))))), _lh_pchar_LH_C_1_0)))
      else
        croak_lh));;
let rec dropWhile_lh _lh_dropWhile_arg1_0 _lh_dropWhile_arg2_0 =
  (match _lh_dropWhile_arg2_0 with
    | `LH_N -> 
      (`LH_N)
    | `LH_C(_lh_dropWhile_LH_C_0_0, _lh_dropWhile_LH_C_1_0) -> 
      (if (_lh_dropWhile_arg1_0 _lh_dropWhile_LH_C_0_0) then
        ((dropWhile_lh _lh_dropWhile_arg1_0) _lh_dropWhile_LH_C_1_0)
      else
        (`LH_C(_lh_dropWhile_LH_C_0_0, _lh_dropWhile_LH_C_1_0))));;
let rec sp_lh _lh_sp_arg1_0 _lh_funcomp_x_1_0 =
  (_lh_sp_arg1_0 ((dropWhile_lh (fun x_1_5 -> 
    (x_1_5 = ' '))) _lh_funcomp_x_1_0));;
let rec look_for_lh _lh_look_for_arg1_0 =
  (sp_lh (pchar_lh (fun x_7 -> 
    (x_7 = _lh_look_for_arg1_0))));;
let rec takeWhile_lh _lh_takeWhile_arg1_0 _lh_takeWhile_arg2_0 =
  (match _lh_takeWhile_arg2_0 with
    | `LH_N -> 
      (`LH_N)
    | `LH_C(_lh_takeWhile_LH_C_0_0, _lh_takeWhile_LH_C_1_0) -> 
      (if (_lh_takeWhile_arg1_0 _lh_takeWhile_LH_C_0_0) then
        (`LH_C(_lh_takeWhile_LH_C_0_0, ((takeWhile_lh _lh_takeWhile_arg1_0) _lh_takeWhile_LH_C_1_0)))
      else
        (`LH_N)));;
let rec string_of_lh _lh_string_of_arg1_0 _lh_string_of_arg2_0 =
  (let rec chars_0 = ((takeWhile_lh _lh_string_of_arg1_0) _lh_string_of_arg2_0) in
    (let rec s'_0 = ((dropWhile_lh _lh_string_of_arg1_0) _lh_string_of_arg2_0) in
      ((maybeX_lh (chars_0 <> (`LH_N))) (`LH_P2((`MkString(chars_0)), s'_0)))));;
let rec inList_lh _lh_inList_arg1_0 _lh_inList_arg2_0 =
  (match _lh_inList_arg2_0 with
    | `LH_C(_lh_inList_LH_C_0_0, _lh_inList_LH_C_1_0) -> 
      (if (_lh_inList_arg1_0 = _lh_inList_LH_C_0_0) then
        true
      else
        ((inList_lh _lh_inList_arg1_0) _lh_inList_LH_C_1_0))
    | `LH_N -> 
      false);;
let rec opsym_lh _lh_opsym_arg1_0 =
  ((fun x_8 -> 
    ((inList_lh x_8) (`LH_C('*', (`LH_C('+', (`LH_C('%', (`LH_C('@', (`LH_C('-', (`LH_C('/', (`LH_C('?', (`LH_C(':', (`LH_N))))))))))))))))))) _lh_opsym_arg1_0);;
let rec p_op_lh _lh_p_op_arg1_0 =
  ((sp_lh (string_of_lh opsym_lh)) _lh_p_op_arg1_0);;
let rec q_op_lh _lh_q_op_arg1_0 =
  (match _lh_q_op_arg1_0 with
    | `LH_C(_lh_q_op_LH_C_0_0, _lh_q_op_LH_C_1_0) -> 
      (match _lh_q_op_LH_C_0_0 with
        | `Expr(_lh_q_op_Expr_0_0) -> 
          (match _lh_q_op_LH_C_1_0 with
            | `LH_C(_lh_q_op_LH_C_0_1, _lh_q_op_LH_C_1_1) -> 
              (match _lh_q_op_LH_C_0_1 with
                | `MkString(_lh_q_op_MkString_0_0) -> 
                  (match _lh_q_op_LH_C_1_1 with
                    | `LH_C(_lh_q_op_LH_C_0_2, _lh_q_op_LH_C_1_2) -> 
                      (match _lh_q_op_LH_C_0_2 with
                        | `Expr(_lh_q_op_Expr_0_1) -> 
                          (match _lh_q_op_LH_C_1_2 with
                            | `LH_N -> 
                              (`Expr((`Func(_lh_q_op_MkString_0_0, (`LH_C(_lh_q_op_Expr_0_0, (`LH_C(_lh_q_op_Expr_0_1, (`LH_N)))))))))
                            | _ -> 
                              (failwith "lh_default_error"))
                        | _ -> 
                          (failwith "lh_default_error"))
                    | _ -> 
                      (failwith "lh_default_error"))
                | _ -> 
                  (failwith "lh_default_error"))
            | _ -> 
              (failwith "lh_default_error"))
        | _ -> 
          (failwith "lh_default_error"))
    | _ -> 
      (failwith "lh_default_error"));;
let rec mk_cons_lh _lh_mk_cons_arg1_0 _lh_mk_cons_arg2_0 =
  (match _lh_mk_cons_arg2_0 with
    | `List(_lh_mk_cons_List_0_0) -> 
      (`List((`LH_C(_lh_mk_cons_arg1_0, _lh_mk_cons_List_0_0))))
    | _ -> 
      (failwith "lh_default_error"));;
let rec squash_lh _lh_squash_arg1_0 =
  (match _lh_squash_arg1_0 with
    | `Just(_lh_squash_Just_0_0) -> 
      _lh_squash_Just_0_0
    | `Nothing -> 
      (`Nothing));;
let rec cross_lh _lh_cross_arg1_0 _lh_cross_arg2_0 _lh_cross_arg3_0 =
  (match _lh_cross_arg3_0 with
    | `LH_P2(_lh_cross_LH_P2_0_0, _lh_cross_LH_P2_1_0) -> 
      (`LH_P2((_lh_cross_arg1_0 _lh_cross_LH_P2_0_0), (_lh_cross_arg2_0 _lh_cross_LH_P2_1_0))));;
let rec seq2Lzq_lh _lh_seq2Lzq_arg1_0 _lh_seq2Lzq_arg2_0 _lh_seq2Lzq_arg3_0 =
  (let rec g_1 = (fun xs_4 -> 
    (let rec _lh_matchIdent_3 = xs_4 in
      (match _lh_matchIdent_3 with
        | `LH_P2(_lh_seq2Lzq_LH_P2_0_0, _lh_seq2Lzq_LH_P2_1_0) -> 
          ((lift_lh ((cross_lh (_lh_seq2Lzq_arg1_0 _lh_seq2Lzq_LH_P2_0_0)) (fun x_6 -> 
            x_6))) ((Lazy.force _lh_seq2Lzq_arg3_0) _lh_seq2Lzq_LH_P2_1_0))))) in
    (fun _lh_funcomp_x_2 -> 
      ((fun _lh_funcomp_x_3 -> 
        (squash_lh ((lift_lh g_1) _lh_funcomp_x_3))) (_lh_seq2Lzq_arg2_0 _lh_funcomp_x_2))));;
let rec empty_lh _lh_empty_arg1_0 =
  (succeed_lh (`LH_P2((`List((`LH_N))), _lh_empty_arg1_0)));;
let rec seq2_lh _lh_seq2_arg1_0 _lh_seq2_arg2_0 _lh_seq2_arg3_0 =
  (let rec g_0 = (fun xs_3 -> 
    (let rec _lh_matchIdent_2 = xs_3 in
      (match _lh_matchIdent_2 with
        | `LH_P2(_lh_seq2_LH_P2_0_0, _lh_seq2_LH_P2_1_0) -> 
          ((lift_lh ((cross_lh (_lh_seq2_arg1_0 _lh_seq2_LH_P2_0_0)) (fun x_5 -> 
            x_5))) (_lh_seq2_arg3_0 _lh_seq2_LH_P2_1_0))))) in
    (fun _lh_funcomp_x_0 -> 
      ((fun _lh_funcomp_x_1 -> 
        (squash_lh ((lift_lh g_0) _lh_funcomp_x_1))) (_lh_seq2_arg2_0 _lh_funcomp_x_0))));;
let rec list_of_lh _lh_list_of_arg1_0 _lh_list_of_arg2_0 =
  (let rec p'_0 = (lazy (((seq2_lh mk_cons_lh) _lh_list_of_arg1_0) ((orElseMap_lh (((seq2Lzq_lh (fun x_3 y_0 -> 
    y_0)) (look_for_lh _lh_list_of_arg2_0)) p'_0)) empty_lh))) in
    (Lazy.force p'_0));;
let rec build_lh _lh_build_arg1_0 _lh_build_arg2_0 _lh_funcomp_x_4 =
  ((lift_lh ((cross_lh _lh_build_arg1_0) (fun x_1_0 -> 
    x_1_0))) (_lh_build_arg2_0 _lh_funcomp_x_4));;
let rec mk_list_lh _lh_mk_list_arg1_0 _lh_mk_list_arg2_0 =
  (match _lh_mk_list_arg2_0 with
    | `List(_lh_mk_list_List_0_0) -> 
      (_lh_mk_list_arg1_0 _lh_mk_list_List_0_0)
    | _ -> 
      (failwith "lh_default_error"));;
let rec seQ_lh _lh_seQ_arg1_0 _lh_seQ_arg2_0 =
  ((build_lh (mk_list_lh _lh_seQ_arg1_0)) (((foldr_lh (seq2_lh mk_cons_lh)) empty_lh) _lh_seQ_arg2_0));;
let rec unExpr_lh _lh_unExpr_arg1_0 =
  (match _lh_unExpr_arg1_0 with
    | `Expr(_lh_unExpr_Expr_0_0) -> 
      _lh_unExpr_Expr_0_0
    | _ -> 
      (failwith "lh_default_error"));;
let rec q_func_lh _lh_q_func_arg1_0 =
  (match _lh_q_func_arg1_0 with
    | `LH_C(_lh_q_func_LH_C_0_0, _lh_q_func_LH_C_1_0) -> 
      (match _lh_q_func_LH_C_0_0 with
        | `MkString(_lh_q_func_MkString_0_0) -> 
          (match _lh_q_func_LH_C_1_0 with
            | `LH_C(_lh_q_func_LH_C_0_1, _lh_q_func_LH_C_1_1) -> 
              (match _lh_q_func_LH_C_1_1 with
                | `LH_C(_lh_q_func_LH_C_0_2, _lh_q_func_LH_C_1_2) -> 
                  (match _lh_q_func_LH_C_0_2 with
                    | `List(_lh_q_func_List_0_0) -> 
                      (match _lh_q_func_LH_C_1_2 with
                        | `LH_C(_lh_q_func_LH_C_0_3, _lh_q_func_LH_C_1_3) -> 
                          (match _lh_q_func_LH_C_1_3 with
                            | `LH_N -> 
                              (`Expr((`Func(_lh_q_func_MkString_0_0, ((map_lh unExpr_lh) _lh_q_func_List_0_0)))))
                            | _ -> 
                              (failwith "lh_default_error"))
                        | _ -> 
                          (failwith "lh_default_error"))
                    | _ -> 
                      (failwith "lh_default_error"))
                | _ -> 
                  (failwith "lh_default_error"))
            | _ -> 
              (failwith "lh_default_error"))
        | _ -> 
          (failwith "lh_default_error"))
    | _ -> 
      (failwith "lh_default_error"));;
let rec atIndex_lh n_0 ls_6 =
  (if (n_0 < 0) then
    (failwith "lh_default_error")
  else
    (match ls_6 with
      | `LH_C(h_6, t_6) -> 
        (if (n_0 = 0) then
          h_6
        else
          ((atIndex_lh (n_0 - 1)) t_6))
      | `LH_N -> 
        (failwith "lh_default_error")));;
let rec q_name_lh _lh_q_name_arg1_0 =
  (match _lh_q_name_arg1_0 with
    | `MkString(_lh_q_name_MkString_0_0) -> 
      (if (((int_of_char ((atIndex_lh 0) _lh_q_name_MkString_0_0)) >= (int_of_char 'a')) && ((int_of_char ((atIndex_lh 0) _lh_q_name_MkString_0_0)) <= (int_of_char 'z'))) then
        (`Expr((`Var(_lh_q_name_MkString_0_0))))
      else
        (`Expr((`Func(_lh_q_name_MkString_0_0, (`LH_N))))))
    | _ -> 
      (failwith "lh_default_error"));;
let rec alphanum_lh _lh_alphanum_arg1_0 =
  (((((int_of_char _lh_alphanum_arg1_0) >= (int_of_char 'A')) && ((int_of_char _lh_alphanum_arg1_0) <= (int_of_char 'Z'))) || (((int_of_char _lh_alphanum_arg1_0) >= (int_of_char 'a')) && ((int_of_char _lh_alphanum_arg1_0) <= (int_of_char 'z')))) || (((int_of_char _lh_alphanum_arg1_0) >= (int_of_char '0')) && ((int_of_char _lh_alphanum_arg1_0) <= (int_of_char '9'))));;
let rec p_ident_lh _lh_p_ident_arg1_0 =
  ((sp_lh (string_of_lh alphanum_lh)) _lh_p_ident_arg1_0);;
let rec p_name_lh _lh_p_name_arg1_0 =
  (((build_lh q_name_lh) p_ident_lh) _lh_p_name_arg1_0);;
let rec p_expr_lh _lh_p_expr_arg1_0 =
  (((orElseMap_lh ((seQ_lh q_op_lh) (`LH_C(p_term_lh, (`LH_C(p_op_lh, (`LH_C(p_term_lh, (`LH_N))))))))) p_term_lh) _lh_p_expr_arg1_0)
and
p_prim_lh _lh_p_prim_arg1_0 =
  (((orElseMap_lh p_name_lh) ((seQ_lh (fun x_4 -> 
    ((atIndex_lh 1) x_4))) (`LH_C((look_for_lh '('), (`LH_C(p_expr_lh, (`LH_C((look_for_lh ')'), (`LH_N))))))))) _lh_p_prim_arg1_0)
and
p_term_lh _lh_p_term_arg1_0 =
  (((orElseMap_lh ((seQ_lh q_func_lh) (`LH_C(p_ident_lh, (`LH_C((look_for_lh '('), (`LH_C(((list_of_lh p_expr_lh) ','), (`LH_C((look_for_lh ')'), (`LH_N))))))))))) p_prim_lh) _lh_p_term_arg1_0);;
let rec q_eqn_lh _lh_q_eqn_arg1_0 =
  (match _lh_q_eqn_arg1_0 with
    | `LH_C(_lh_q_eqn_LH_C_0_0, _lh_q_eqn_LH_C_1_0) -> 
      (match _lh_q_eqn_LH_C_1_0 with
        | `LH_C(_lh_q_eqn_LH_C_0_1, _lh_q_eqn_LH_C_1_1) -> 
          (match _lh_q_eqn_LH_C_1_1 with
            | `LH_C(_lh_q_eqn_LH_C_0_2, _lh_q_eqn_LH_C_1_2) -> 
              (match _lh_q_eqn_LH_C_1_2 with
                | `LH_N -> 
                  (`List((`LH_C(_lh_q_eqn_LH_C_0_0, (`LH_C(_lh_q_eqn_LH_C_0_2, (`LH_N)))))))
                | _ -> 
                  (failwith "lh_default_error"))
            | _ -> 
              (failwith "lh_default_error"))
        | _ -> 
          (failwith "lh_default_error"))
    | _ -> 
      (failwith "lh_default_error"));;
let rec p_eqn_lh _lh_p_eqn_arg1_0 =
  (((seQ_lh q_eqn_lh) (`LH_C(p_expr_lh, (`LH_C((look_for_lh '='), (`LH_C(p_expr_lh, (`LH_N)))))))) _lh_p_eqn_arg1_0);;
let rec fst_lh _lh_fst_arg1_0 =
  (match _lh_fst_arg1_0 with
    | `LH_P2(_lh_fst_LH_P2_0_0, _lh_fst_LH_P2_1_0) -> 
      _lh_fst_LH_P2_0_0);;
let rec parse_eqn_lh _lh_parse_eqn_arg1_0 =
  (let rec _lh_matchIdent_1_1 = (fst_lh (the_lh (p_eqn_lh _lh_parse_eqn_arg1_0))) in
    (match _lh_matchIdent_1_1 with
      | `List(_lh_parse_eqn_List_0_0) -> 
        (match _lh_parse_eqn_List_0_0 with
          | `LH_C(_lh_parse_eqn_LH_C_0_0, _lh_parse_eqn_LH_C_1_0) -> 
            (match _lh_parse_eqn_LH_C_0_0 with
              | `Expr(_lh_parse_eqn_Expr_0_0) -> 
                (match _lh_parse_eqn_LH_C_1_0 with
                  | `LH_C(_lh_parse_eqn_LH_C_0_1, _lh_parse_eqn_LH_C_1_1) -> 
                    (match _lh_parse_eqn_LH_C_0_1 with
                      | `Expr(_lh_parse_eqn_Expr_0_1) -> 
                        (match _lh_parse_eqn_LH_C_1_1 with
                          | `LH_N -> 
                            (`LH_P2(_lh_parse_eqn_Expr_0_0, _lh_parse_eqn_Expr_0_1))
                          | _ -> 
                            (failwith "lh_default_error"))
                      | _ -> 
                        (failwith "lh_default_error"))
                  | _ -> 
                    (failwith "lh_default_error"))
              | _ -> 
                (failwith "lh_default_error"))
          | _ -> 
            (failwith "lh_default_error"))
      | _ -> 
        (failwith "lh_default_error")));;
let rec rank_lh _lh_rank_arg1_0 =
  (match _lh_rank_arg1_0 with
    | `LH_C(_lh_rank_LH_C_0_0, _lh_rank_LH_C_1_0) -> 
      (match _lh_rank_LH_C_0_0 with
        | 'E' -> 
          (match _lh_rank_LH_C_1_0 with
            | `LH_N -> 
              1
            | _ -> 
              (failwith "lh_default_error"))
        | '*' -> 
          (match _lh_rank_LH_C_1_0 with
            | `LH_N -> 
              2
            | _ -> 
              (failwith "lh_default_error"))
        | 'I' -> 
          (match _lh_rank_LH_C_1_0 with
            | `LH_N -> 
              3
            | _ -> 
              (failwith "lh_default_error"))
        | _ -> 
          (failwith "lh_default_error"))
    | _ -> 
      (failwith "lh_default_error"));;
let rec geRewrite_lh _lh_geRewrite_arg1_0 _lh_geRewrite_arg2_0 _lh_geRewrite_arg3_0 =
  ((inList_lh (_lh_geRewrite_arg1_0 (`LH_P2(_lh_geRewrite_arg2_0, _lh_geRewrite_arg3_0)))) (`LH_C((`Greater), (`LH_C((`Equal), (`LH_N))))));;
let rec quant_lh _lh_quant_arg1_0 _lh_quant_arg2_0 _lh_quant_arg3_0 _lh_quant_arg4_0 =
  (let rec p_0 = (fun x_2 -> 
    ((_lh_quant_arg2_0 x_2) _lh_quant_arg3_0)) in
    ((_lh_quant_arg1_0 p_0) _lh_quant_arg4_0));;
let rec any_lh _lh_any_arg1_0 _lh_any_arg2_0 =
  (match _lh_any_arg2_0 with
    | `LH_N -> 
      false
    | `LH_C(_lh_any_LH_C_0_0, _lh_any_LH_C_1_0) -> 
      (if (_lh_any_arg1_0 _lh_any_LH_C_0_0) then
        true
      else
        ((any_lh _lh_any_arg1_0) _lh_any_LH_C_1_0)));;
let rec all_lh _lh_all_arg1_0 _lh_all_arg2_0 =
  (match _lh_all_arg2_0 with
    | `LH_N -> 
      true
    | `LH_C(_lh_all_LH_C_0_0, _lh_all_LH_C_1_0) -> 
      (if (_lh_all_arg1_0 _lh_all_LH_C_0_0) then
        ((all_lh _lh_all_arg1_0) _lh_all_LH_C_1_0)
      else
        false));;
let rec or_lh _lh_or_arg1_0 =
  (match _lh_or_arg1_0 with
    | `LH_N -> 
      false
    | `LH_C(_lh_or_LH_C_0_0, _lh_or_LH_C_1_0) -> 
      (if _lh_or_LH_C_0_0 then
        true
      else
        (or_lh _lh_or_LH_C_1_0)));;
let rec occurs_lh _lh_occurs_arg1_0 =
  ((expr_fold_lh (fun dum_2 -> 
    or_lh)) (fun x_1_2 -> 
    (x_1_2 = _lh_occurs_arg1_0)));;
let rec ltRewrite_lh _lh_ltRewrite_arg1_0 _lh_ltRewrite_arg2_0 _lh_ltRewrite_arg3_0 =
  ((_lh_ltRewrite_arg1_0 (`LH_P2(_lh_ltRewrite_arg2_0, _lh_ltRewrite_arg3_0))) = (`Less));;
let rec rpo_lh _lh_rpo_arg1_0 _lh_rpo_arg2_0 =
  (let rec rpo'_0 = (fun param_0 -> 
    (let rec _lh_matchIdent_8 = param_0 in
      (match _lh_matchIdent_8 with
        | `LH_P2(_lh_rpo_LH_P2_0_0, _lh_rpo_LH_P2_1_0) -> 
          (match _lh_rpo_LH_P2_0_0 with
            | `Var(_lh_rpo_Var_0_0) -> 
              (match _lh_rpo_LH_P2_1_0 with
                | `Var(_lh_rpo_Var_0_1) -> 
                  (if (_lh_rpo_Var_0_0 = _lh_rpo_Var_0_1) then
                    (`Equal)
                  else
                    (`Unrelated))
                | `Func(_lh_rpo_Func_0_0, _lh_rpo_Func_1_0) -> 
                  (if ((occurs_lh _lh_rpo_Var_0_0) (`Func(_lh_rpo_Func_0_0, _lh_rpo_Func_1_0))) then
                    (`Less)
                  else
                    (`Unrelated))
                | _ -> 
                  (failwith "msg"(`LH_C('e', (`LH_C('r', (`LH_C('r', (`LH_C('o', (`LH_C('r', (`LH_N)))))))))))))
            | `Func(_lh_rpo_Func_0_1, _lh_rpo_Func_1_1) -> 
              (match _lh_rpo_LH_P2_1_0 with
                | `Var(_lh_rpo_Var_0_2) -> 
                  (if ((occurs_lh _lh_rpo_Var_0_2) (`Func(_lh_rpo_Func_0_1, _lh_rpo_Func_1_1))) then
                    (`Greater)
                  else
                    (`Unrelated))
                | `Func(_lh_rpo_Func_0_2, _lh_rpo_Func_1_2) -> 
                  (let rec _lh_matchIdent_9 = (_lh_rpo_arg1_0 (`LH_P2(_lh_rpo_Func_0_1, _lh_rpo_Func_0_2))) in
                    (match _lh_matchIdent_9 with
                      | `Equal -> 
                        ((_lh_rpo_arg2_0 rpo'_0) (`LH_P2((`Func(_lh_rpo_Func_0_1, _lh_rpo_Func_1_1)), (`Func(_lh_rpo_Func_0_2, _lh_rpo_Func_1_2)))))
                      | `Greater -> 
                        (if ((((quant_lh all_lh) (ltRewrite_lh rpo'_0)) (`Func(_lh_rpo_Func_0_1, _lh_rpo_Func_1_1))) _lh_rpo_Func_1_2) then
                          (`Greater)
                        else
                          (if ((((quant_lh any_lh) (geRewrite_lh rpo'_0)) (`Func(_lh_rpo_Func_0_1, _lh_rpo_Func_1_1))) _lh_rpo_Func_1_2) then
                            (`Less)
                          else
                            (`Unrelated)))
                      | `Less -> 
                        (if ((((quant_lh all_lh) (ltRewrite_lh rpo'_0)) (`Func(_lh_rpo_Func_0_2, _lh_rpo_Func_1_2))) _lh_rpo_Func_1_1) then
                          (`Less)
                        else
                          (if ((((quant_lh any_lh) (geRewrite_lh rpo'_0)) (`Func(_lh_rpo_Func_0_2, _lh_rpo_Func_1_2))) _lh_rpo_Func_1_1) then
                            (`Greater)
                          else
                            (`Unrelated)))
                      | `Unrelated -> 
                        (`Unrelated)))
                | _ -> 
                  (failwith "msg"(`LH_C('e', (`LH_C('r', (`LH_C('r', (`LH_C('o', (`LH_C('r', (`LH_N)))))))))))))
            | _ -> 
              (failwith "msg"(`LH_C('e', (`LH_C('r', (`LH_C('r', (`LH_C('o', (`LH_C('r', (`LH_N)))))))))))))
        | _ -> 
          (failwith "msg"(`LH_C('e', (`LH_C('r', (`LH_C('r', (`LH_C('o', (`LH_C('r', (`LH_N))))))))))))))) in
    rpo'_0);;
let rec snd_lh _lh_snd_arg1_0 =
  (match _lh_snd_arg1_0 with
    | `LH_P2(_lh_snd_LH_P2_0_0, _lh_snd_LH_P2_1_0) -> 
      _lh_snd_LH_P2_1_0);;
let rec simplify_lh _lh_simplify_arg1_0 =
  (let rec f_3 = (fun t_9 -> 
    ((getOrElse_lh ((lift_lh f_3) (_lh_simplify_arg1_0 t_9))) t_9)) in
    f_3);;
let rec preprocess_lh _lh_preprocess_arg1_0 _lh_preprocess_arg2_0 =
  (match _lh_preprocess_arg2_0 with
    | `LH_P2(_lh_preprocess_LH_P2_0_0, _lh_preprocess_LH_P2_1_0) -> 
      (`LH_P2(((simplify_lh (super_reduce_lh _lh_preprocess_arg1_0)) _lh_preprocess_LH_P2_0_0), ((simplify_lh (super_reduce_lh _lh_preprocess_arg1_0)) _lh_preprocess_LH_P2_1_0))));;
let rec eqno_lh _lh_eqno_arg1_0 =
  (match _lh_eqno_arg1_0 with
    | `Eqn(_lh_eqno_Eqn_0_0, _lh_eqno_Eqn_1_0) -> 
      (match _lh_eqno_Eqn_1_0 with
        | `LH_P2(_lh_eqno_LH_P2_0_0, _lh_eqno_LH_P2_1_0) -> 
          _lh_eqno_Eqn_0_0));;
let rec map_dnet_lh _lh_map_dnet_arg1_0 _lh_map_dnet_arg2_0 =
  (match _lh_map_dnet_arg2_0 with
    | `Switch(_lh_map_dnet_Switch_0_0, _lh_map_dnet_Switch_1_0) -> 
      (`Switch(((map_lh ((cross_lh (fun x_9 -> 
        x_9)) (map_dnet_lh _lh_map_dnet_arg1_0))) _lh_map_dnet_Switch_0_0), ((map_dnet_lh _lh_map_dnet_arg1_0) _lh_map_dnet_Switch_1_0)))
    | `Return(_lh_map_dnet_Return_0_0) -> 
      (`Return((_lh_map_dnet_arg1_0 _lh_map_dnet_Return_0_0))));;
let rec filter_lh f_1 ls_1 =
  (match ls_1 with
    | `LH_C(h_1, t_1) -> 
      (if (f_1 h_1) then
        (`LH_C(h_1, ((filter_lh f_1) t_1)))
      else
        ((filter_lh f_1) t_1))
    | `LH_N -> 
      (`LH_N));;
let rec delete_eqns_lh _lh_delete_eqns_arg1_0 =
  (let rec ok_0 = (fun e_0 -> 
    (not ((inList_lh (eqno_lh e_0)) _lh_delete_eqns_arg1_0))) in
    (map_dnet_lh (filter_lh ok_0)));;
let rec pair_lh _lh_pair_arg1_0 _lh_pair_arg2_0 =
  (`LH_P2(_lh_pair_arg1_0, _lh_pair_arg2_0));;
let rec comp_sub_lh _lh_comp_sub_arg1_0 _lh_comp_sub_arg2_0 =
  ((mappend_lh (let rec _lh_listcomp_fun_5 = (fun _lh_listcomp_fun_para_5 -> 
    (match _lh_listcomp_fun_para_5 with
      | `LH_C(_lh_listcomp_fun_ls_h_5, _lh_listcomp_fun_ls_t_5) -> 
        (match _lh_listcomp_fun_ls_h_5 with
          | `LH_P2(_lh_comp_sub_LH_P2_0_0, _lh_comp_sub_LH_P2_1_0) -> 
            (`LH_C((`LH_P2(_lh_comp_sub_LH_P2_0_0, ((sub_lh _lh_comp_sub_LH_P2_1_0) _lh_comp_sub_arg1_0))), (_lh_listcomp_fun_5 _lh_listcomp_fun_ls_t_5)))
          | _ -> 
            (_lh_listcomp_fun_5 _lh_listcomp_fun_ls_t_5))
      | `LH_N -> 
        (`LH_N))) in
    (_lh_listcomp_fun_5 _lh_comp_sub_arg2_0))) _lh_comp_sub_arg1_0);;
let rec unify'_lh _lh_unify'_arg1_0 _lh_unify'_arg2_0 =
  (match _lh_unify'_arg2_0 with
    | `LH_P2(_lh_unify'_LH_P2_0_0, _lh_unify'_LH_P2_1_0) -> 
      (match _lh_unify'_LH_P2_0_0 with
        | `Var(_lh_unify'_Var_0_0) -> 
          (((univar_lh _lh_unify'_arg1_0) _lh_unify'_Var_0_0) _lh_unify'_LH_P2_1_0)
        | `Func(_lh_unify'_Func_0_0, _lh_unify'_Func_1_0) -> 
          (match _lh_unify'_LH_P2_1_0 with
            | `Var(_lh_unify'_Var_0_1) -> 
              (((univar_lh _lh_unify'_arg1_0) _lh_unify'_Var_0_1) (`Func(_lh_unify'_Func_0_0, _lh_unify'_Func_1_0)))
            | `Func(_lh_unify'_Func_0_1, _lh_unify'_Func_1_1) -> 
              (if (_lh_unify'_Func_0_0 = _lh_unify'_Func_0_1) then
                (((prop_fold_lh unify'_lh) _lh_unify'_arg1_0) ((zip_lh _lh_unify'_Func_1_0) _lh_unify'_Func_1_1))
              else
                croak_lh))))
and
univar_lh _lh_univar_arg1_0 _lh_univar_arg2_0 _lh_univar_arg3_0 =
  (let rec t_1_0 = ((assoc_lh _lh_univar_arg1_0) _lh_univar_arg2_0) in
    (if (exists_lh t_1_0) then
      ((unify'_lh _lh_univar_arg1_0) (`LH_P2((the_lh t_1_0), _lh_univar_arg3_0)))
    else
      (if ((eqExpr_lh _lh_univar_arg3_0) (`Var(_lh_univar_arg2_0))) then
        (succeed_lh _lh_univar_arg1_0)
      else
        (let rec u'_0 = ((sub_lh _lh_univar_arg3_0) _lh_univar_arg1_0) in
          (if (not ((occurs_lh _lh_univar_arg2_0) u'_0)) then
            (succeed_lh ((comp_sub_lh (`LH_C((`LH_P2(_lh_univar_arg2_0, u'_0)), (`LH_N)))) _lh_univar_arg1_0))
          else
            croak_lh)))));;
let rec unify_lh _lh_unify_arg1_0 _lh_unify_arg2_0 =
  ((unify'_lh (`LH_N)) (`LH_P2(_lh_unify_arg1_0, _lh_unify_arg2_0)));;
let rec concat_lh lss_0 =
  (match lss_0 with
    | `LH_C(h_7, t_7) -> 
      ((mappend_lh h_7) (concat_lh t_7))
    | `LH_N -> 
      (`LH_N));;
let rec box_lh _lh_box_arg1_0 =
  (`LH_C(_lh_box_arg1_0, (`LH_N)));;
let rec listify_lh _lh_listify_arg1_0 =
  ((getOrElse_lh ((lift_lh box_lh) _lh_listify_arg1_0)) (`LH_N));;
let rec sift_lh _lh_sift_arg1_0 =
  ((fun _lh_funcomp_x_9 -> 
    (concat_lh ((map_lh listify_lh) _lh_funcomp_x_9))) _lh_sift_arg1_0);;
let rec superpose_lh _lh_superpose_arg1_0 _lh_superpose_arg2_0 =
  (sift_lh (let rec _lh_listcomp_fun_0 = (fun _lh_listcomp_fun_para_0 -> 
    (match _lh_listcomp_fun_para_0 with
      | `LH_C(_lh_listcomp_fun_ls_h_0, _lh_listcomp_fun_ls_t_0) -> 
        (match _lh_listcomp_fun_ls_h_0 with
          | `LH_P2(_lh_superpose_LH_P2_0_0, _lh_superpose_LH_P2_1_0) -> 
            (`LH_C(((lift_lh (pair_lh _lh_superpose_LH_P2_0_0)) ((unify_lh _lh_superpose_arg1_0) _lh_superpose_LH_P2_1_0)), (_lh_listcomp_fun_0 _lh_listcomp_fun_ls_t_0)))
          | _ -> 
            (_lh_listcomp_fun_0 _lh_listcomp_fun_ls_t_0))
      | `LH_N -> 
        (`LH_N))) in
    (_lh_listcomp_fun_0 (subterms_lh _lh_superpose_arg2_0))));;
let rec strict_super_lh _lh_strict_super_arg1_0 _lh_strict_super_arg2_0 =
  (match _lh_strict_super_arg2_0 with
    | `Func(_lh_strict_super_Func_0_0, _lh_strict_super_Func_1_0) -> 
      (let rec _lh_listcomp_fun_3 = (fun _lh_listcomp_fun_para_3 -> 
        (match _lh_listcomp_fun_para_3 with
          | `LH_C(_lh_listcomp_fun_ls_h_3, _lh_listcomp_fun_ls_t_3) -> 
            (match _lh_listcomp_fun_ls_h_3 with
              | `LH_P2(_lh_strict_super_LH_P2_0_0, _lh_strict_super_LH_P2_1_0) -> 
                (let rec _lh_listcomp_fun_4 = (fun _lh_listcomp_fun_para_4 -> 
                  (match _lh_listcomp_fun_para_4 with
                    | `LH_C(_lh_listcomp_fun_ls_h_4, _lh_listcomp_fun_ls_t_4) -> 
                      (match _lh_listcomp_fun_ls_h_4 with
                        | `LH_P2(_lh_strict_super_LH_P2_0_1, _lh_strict_super_LH_P2_1_1) -> 
                          (`LH_C((`LH_P2((`LH_C(_lh_strict_super_LH_P2_0_0, _lh_strict_super_LH_P2_0_1)), _lh_strict_super_LH_P2_1_1)), (_lh_listcomp_fun_4 _lh_listcomp_fun_ls_t_4)))
                        | _ -> 
                          (_lh_listcomp_fun_4 _lh_listcomp_fun_ls_t_4))
                    | `LH_N -> 
                      (_lh_listcomp_fun_3 _lh_listcomp_fun_ls_t_3))) in
                  (_lh_listcomp_fun_4 ((superpose_lh _lh_strict_super_arg1_0) _lh_strict_super_LH_P2_1_0)))
              | _ -> 
                (_lh_listcomp_fun_3 _lh_listcomp_fun_ls_t_3))
          | `LH_N -> 
            (`LH_N))) in
        (_lh_listcomp_fun_3 ((zip_lz_nl_lh (enumFrom_lh 0)) _lh_strict_super_Func_1_0)))
    | _ -> 
      (failwith "lh_default_error"));;
let rec stand_lh _lh_stand_arg1_0 =
  ((expr_fold_lh (fun x_1_1 y_1 -> 
    (`Func(x_1_1, y_1)))) (fun v_0 -> 
    (`Var(((mappend_lh v_0) _lh_stand_arg1_0)))));;
let rec stand_eqn_lh _lh_stand_eqn_arg1_0 _lh_stand_eqn_arg2_0 =
  (match _lh_stand_eqn_arg2_0 with
    | `Eqn(_lh_stand_eqn_Eqn_0_0, _lh_stand_eqn_Eqn_1_0) -> 
      (match _lh_stand_eqn_Eqn_1_0 with
        | `LH_P2(_lh_stand_eqn_LH_P2_0_0, _lh_stand_eqn_LH_P2_1_0) -> 
          (`Eqn(_lh_stand_eqn_Eqn_0_0, (`LH_P2(((stand_lh _lh_stand_eqn_arg1_0) _lh_stand_eqn_LH_P2_0_0), ((stand_lh _lh_stand_eqn_arg1_0) _lh_stand_eqn_LH_P2_1_0)))))));;
let rec lhs_lh _lh_lhs_arg1_0 =
  (match _lh_lhs_arg1_0 with
    | `Eqn(_lh_lhs_Eqn_0_0, _lh_lhs_Eqn_1_0) -> 
      (match _lh_lhs_Eqn_1_0 with
        | `LH_P2(_lh_lhs_LH_P2_0_0, _lh_lhs_LH_P2_1_0) -> 
          _lh_lhs_LH_P2_0_0));;
let rec mk_crit_lh _lh_mk_crit_arg1_0 _lh_mk_crit_arg2_0 _lh_mk_crit_arg3_0 =
  (match _lh_mk_crit_arg1_0 with
    | `Eqn(_lh_mk_crit_Eqn_0_0, _lh_mk_crit_Eqn_1_0) -> 
      (match _lh_mk_crit_Eqn_1_0 with
        | `LH_P2(_lh_mk_crit_LH_P2_0_0, _lh_mk_crit_LH_P2_1_0) -> 
          (match _lh_mk_crit_arg2_0 with
            | `Eqn(_lh_mk_crit_Eqn_0_1, _lh_mk_crit_Eqn_1_1) -> 
              (match _lh_mk_crit_Eqn_1_1 with
                | `LH_P2(_lh_mk_crit_LH_P2_0_1, _lh_mk_crit_LH_P2_1_1) -> 
                  (match _lh_mk_crit_arg3_0 with
                    | `LH_P2(_lh_mk_crit_LH_P2_0_2, _lh_mk_crit_LH_P2_1_2) -> 
                      (`LH_P2(((sub_lh (((replace_lh _lh_mk_crit_LH_P2_0_1) _lh_mk_crit_LH_P2_0_2) _lh_mk_crit_LH_P2_1_0)) _lh_mk_crit_LH_P2_1_2), ((sub_lh _lh_mk_crit_LH_P2_1_1) _lh_mk_crit_LH_P2_1_2))))))));;
let rec crit_pairs_lh _lh_crit_pairs_arg1_0 _lh_crit_pairs_arg2_0 =
  ((mappend_lh ((map_lh ((mk_crit_lh _lh_crit_pairs_arg1_0) _lh_crit_pairs_arg2_0)) ((superpose_lh (lhs_lh _lh_crit_pairs_arg1_0)) (lhs_lh _lh_crit_pairs_arg2_0)))) ((map_lh ((mk_crit_lh _lh_crit_pairs_arg2_0) _lh_crit_pairs_arg1_0)) ((strict_super_lh (lhs_lh _lh_crit_pairs_arg2_0)) (lhs_lh _lh_crit_pairs_arg1_0))));;
let rec all_crit_pairs_lh _lh_all_crit_pairs_arg1_0 _lh_all_crit_pairs_arg2_0 =
  (let rec eqn'_0 = ((stand_eqn_lh (`LH_C('1', (`LH_N)))) _lh_all_crit_pairs_arg1_0) in
    (let rec eqn''_0 = ((stand_eqn_lh (`LH_C('2', (`LH_N)))) _lh_all_crit_pairs_arg1_0) in
      (let rec theory''_0 = ((map_lh (stand_eqn_lh (`LH_C('2', (`LH_N))))) _lh_all_crit_pairs_arg2_0) in
        ((mappend_lh ((map_lh ((mk_crit_lh eqn'_0) eqn''_0)) ((strict_super_lh (lhs_lh eqn'_0)) (lhs_lh eqn''_0)))) (concat_lh ((map_lh (crit_pairs_lh eqn'_0)) theory''_0))))));;
let rec split_lh _lh_split_arg1_0 _lh_split_arg2_0 =
  (let rec tmp_0 = ((zip_lh ((map_lh _lh_split_arg1_0) _lh_split_arg2_0)) _lh_split_arg2_0) in
    (`LH_P2((let rec _lh_listcomp_fun_6 = (fun _lh_listcomp_fun_para_6 -> 
      (match _lh_listcomp_fun_para_6 with
        | `LH_C(_lh_listcomp_fun_ls_h_6, _lh_listcomp_fun_ls_t_6) -> 
          (match _lh_listcomp_fun_ls_h_6 with
            | `LH_P2(_lh_split_LH_P2_0_0, _lh_split_LH_P2_1_0) -> 
              (if _lh_split_LH_P2_0_0 then
                (`LH_C(_lh_split_LH_P2_1_0, (_lh_listcomp_fun_6 _lh_listcomp_fun_ls_t_6)))
              else
                (_lh_listcomp_fun_6 _lh_listcomp_fun_ls_t_6))
            | _ -> 
              (_lh_listcomp_fun_6 _lh_listcomp_fun_ls_t_6))
        | `LH_N -> 
          (`LH_N))) in
      (_lh_listcomp_fun_6 tmp_0)), (let rec _lh_listcomp_fun_7 = (fun _lh_listcomp_fun_para_7 -> 
      (match _lh_listcomp_fun_para_7 with
        | `LH_C(_lh_listcomp_fun_ls_h_7, _lh_listcomp_fun_ls_t_7) -> 
          (match _lh_listcomp_fun_ls_h_7 with
            | `LH_P2(_lh_split_LH_P2_0_1, _lh_split_LH_P2_1_1) -> 
              (if (not _lh_split_LH_P2_0_1) then
                (`LH_C(_lh_split_LH_P2_1_1, (_lh_listcomp_fun_7 _lh_listcomp_fun_ls_t_7)))
              else
                (_lh_listcomp_fun_7 _lh_listcomp_fun_ls_t_7))
            | _ -> 
              (_lh_listcomp_fun_7 _lh_listcomp_fun_ls_t_7))
        | `LH_N -> 
          (`LH_N))) in
      (_lh_listcomp_fun_7 tmp_0)))));;
let rec update_alist_lh _lh_update_alist_arg1_0 _lh_update_alist_arg2_0 _lh_update_alist_arg3_0 =
  (let rec upd_0 = (fun ls_8 -> 
    (let rec _lh_matchIdent_6 = ls_8 in
      (match _lh_matchIdent_6 with
        | `LH_N -> 
          (`LH_C((`LH_P2(_lh_update_alist_arg1_0, (_lh_update_alist_arg2_0 _lh_update_alist_arg3_0))), (`LH_N)))
        | `LH_C(_lh_update_alist_LH_C_0_0, _lh_update_alist_LH_C_1_0) -> 
          (match _lh_update_alist_LH_C_0_0 with
            | `LH_P2(_lh_update_alist_LH_P2_0_0, _lh_update_alist_LH_P2_1_0) -> 
              (if (_lh_update_alist_arg1_0 = _lh_update_alist_LH_P2_0_0) then
                (`LH_C((`LH_P2(_lh_update_alist_arg1_0, (_lh_update_alist_arg2_0 _lh_update_alist_LH_P2_1_0))), _lh_update_alist_LH_C_1_0))
              else
                (`LH_C((`LH_P2(_lh_update_alist_LH_P2_0_0, _lh_update_alist_LH_P2_1_0)), (upd_0 _lh_update_alist_LH_C_1_0)))))))) in
    upd_0);;
let rec empty_net_lh =
  (`Return((`LH_N)));;
let rec is_switch_lh _lh_is_switch_arg1_0 =
  (match _lh_is_switch_arg1_0 with
    | `Switch(_lh_is_switch_Switch_0_0, _lh_is_switch_Switch_1_0) -> 
      true
    | `Return(_lh_is_switch_Return_0_0) -> 
      false);;
let rec thread_lh _lh_thread_arg1_0 _lh_thread_arg2_0 _lh_thread_arg3_0 =
  (match _lh_thread_arg1_0 with
    | `LH_C(_lh_thread_LH_C_0_0, _lh_thread_LH_C_1_0) -> 
      (match _lh_thread_LH_C_0_0 with
        | `Afunc(_lh_thread_Afunc_0_0) -> 
          (match _lh_thread_arg3_0 with
            | `Switch(_lh_thread_Switch_0_0, _lh_thread_Switch_1_0) -> 
              (`Switch(((((update_alist_lh _lh_thread_Afunc_0_0) ((thread_lh _lh_thread_LH_C_1_0) _lh_thread_arg2_0)) empty_net_lh) _lh_thread_Switch_0_0), _lh_thread_Switch_1_0))
            | `Return(_lh_thread_Return_0_0) -> 
              (((thread_lh (`LH_C((`Afunc(_lh_thread_Afunc_0_0)), _lh_thread_LH_C_1_0))) _lh_thread_arg2_0) (`Switch((`LH_N), (`Return(_lh_thread_Return_0_0))))))
        | `Avar -> 
          (match _lh_thread_arg3_0 with
            | `Switch(_lh_thread_Switch_0_1, _lh_thread_Switch_1_1) -> 
              (`Switch(_lh_thread_Switch_0_1, (((thread_lh _lh_thread_LH_C_1_0) _lh_thread_arg2_0) _lh_thread_Switch_1_1)))
            | `Return(_lh_thread_Return_0_1) -> 
              (let rec d'_0 = (((thread_lh _lh_thread_LH_C_1_0) _lh_thread_arg2_0) (`Return(_lh_thread_Return_0_1))) in
                (if (is_switch_lh d'_0) then
                  (`Switch((`LH_N), d'_0))
                else
                  d'_0))))
    | `LH_N -> 
      (match _lh_thread_arg3_0 with
        | `Return(_lh_thread_Return_0_2) -> 
          (`Return((`LH_C(_lh_thread_arg2_0, _lh_thread_Return_0_2))))));;
let rec preorder_lh _lh_preorder_arg1_0 =
  (if ((eqListExpr_lh _lh_preorder_arg1_0) (`LH_N)) then
    (`LH_N)
  else
    ((mappend_lh (`LH_C((g_first_lh _lh_preorder_arg1_0), (`LH_N)))) (preorder_lh (g_rest_lh _lh_preorder_arg1_0))));;
let rec add_eqn_lh _lh_add_eqn_arg1_0 _lh_add_eqn_arg2_0 =
  (((thread_lh (preorder_lh (g_init_lh (lhs_lh _lh_add_eqn_arg2_0)))) _lh_add_eqn_arg2_0) _lh_add_eqn_arg1_0);;
let rec resolve_lh _lh_resolve_arg1_0 _lh_resolve_arg2_0 =
  (let rec lhs'_0 = ((simplify_lh _lh_resolve_arg1_0) (fst_lh _lh_resolve_arg2_0)) in
    (let rec rhs'_0 = ((simplify_lh _lh_resolve_arg1_0) (snd_lh _lh_resolve_arg2_0)) in
      (if ((eqExpr_lh lhs'_0) rhs'_0) then
        croak_lh
      else
        (succeed_lh (`LH_P2(lhs'_0, rhs'_0))))));;
let rec eqpr_lh _lh_eqpr_arg1_0 =
  (match _lh_eqpr_arg1_0 with
    | `Eqn(_lh_eqpr_Eqn_0_0, _lh_eqpr_Eqn_1_0) -> 
      _lh_eqpr_Eqn_1_0);;
let rec reduce1_lh _lh_reduce1_arg1_0 =
  (inside_lh (rewrite_lh _lh_reduce1_arg1_0));;
let rec reducible_lh _lh_reducible_arg1_0 _lh_reducible_arg2_0 =
  (match _lh_reducible_arg2_0 with
    | `Eqn(_lh_reducible_Eqn_0_0, _lh_reducible_Eqn_1_0) -> 
      (match _lh_reducible_Eqn_1_0 with
        | `LH_P2(_lh_reducible_LH_P2_0_0, _lh_reducible_LH_P2_1_0) -> 
          ((exists_lh (_lh_reducible_arg1_0 _lh_reducible_LH_P2_0_0)) || (exists_lh (_lh_reducible_arg1_0 _lh_reducible_LH_P2_1_0)))));;
let rec item_cost_lh _lh_item_cost_arg1_0 =
  (match _lh_item_cost_arg1_0 with
    | `Item(_lh_item_cost_Item_0_0, _lh_item_cost_Item_1_0) -> 
      _lh_item_cost_Item_0_0);;
let rec mk_item_lh _lh_mk_item_arg1_0 _lh_mk_item_arg2_0 =
  (`Item((_lh_mk_item_arg1_0 _lh_mk_item_arg2_0), _lh_mk_item_arg2_0));;
let rec addby_lh _lh_addby_arg1_0 _lh_addby_arg2_0 _lh_addby_arg3_0 =
  (let rec insert_0 = (fun x_0 ls_7 -> 
    (let rec _lh_matchIdent_0 = ls_7 in
      (match _lh_matchIdent_0 with
        | `LH_N -> 
          (`LH_C(x_0, (`LH_N)))
        | `LH_C(_lh_addby_LH_C_0_0, _lh_addby_LH_C_1_0) -> 
          (if ((_lh_addby_arg1_0 x_0) <= (_lh_addby_arg1_0 _lh_addby_LH_C_0_0)) then
            (`LH_C(x_0, (`LH_C(_lh_addby_LH_C_0_0, _lh_addby_LH_C_1_0))))
          else
            (`LH_C(_lh_addby_LH_C_0_0, ((insert_0 x_0) _lh_addby_LH_C_1_0))))))) in
    (((foldr_lh insert_0) _lh_addby_arg3_0) _lh_addby_arg2_0));;
let rec add_agenda_lh _lh_add_agenda_arg1_0 _lh_add_agenda_arg2_0 =
  ((addby_lh item_cost_lh) ((map_lh (mk_item_lh _lh_add_agenda_arg1_0)) _lh_add_agenda_arg2_0));;
let rec process1_lh _lh_process1_arg1_0 _lh_process1_arg2_0 _lh_process1_arg3_0 _lh_process1_arg4_0 _lh_process1_arg5_0 _lh_process1_arg6_0 =
  (match _lh_process1_arg6_0 with
    | `LH_P2(_lh_process1_LH_P2_0_0, _lh_process1_LH_P2_1_0) -> 
      (let rec o_0 = ((fst_lh _lh_process1_arg1_0) (`LH_P2(_lh_process1_LH_P2_0_0, _lh_process1_LH_P2_1_0))) in
        (let rec _lh_matchIdent_4 = o_0 in
          (match _lh_matchIdent_4 with
            | `Unrelated -> 
              (((((process_lh _lh_process1_arg1_0) _lh_process1_arg2_0) _lh_process1_arg3_0) _lh_process1_arg4_0) (((add_agenda_lh (fun dum_1 -> 
                1000)) (`LH_C((`LH_P2(_lh_process1_LH_P2_0_0, _lh_process1_LH_P2_1_0)), (`LH_N)))) _lh_process1_arg5_0))
            | `Equal -> 
              (((((process_lh _lh_process1_arg1_0) _lh_process1_arg2_0) _lh_process1_arg3_0) _lh_process1_arg4_0) _lh_process1_arg5_0)
            | _ -> 
              (let rec eqn_0 = (let rec _lh_matchIdent_5 = o_0 in
                (match _lh_matchIdent_5 with
                  | `Greater -> 
                    (`Eqn(_lh_process1_arg2_0, (`LH_P2(_lh_process1_LH_P2_0_0, _lh_process1_LH_P2_1_0))))
                  | `Less -> 
                    (`Eqn(_lh_process1_arg2_0, (`LH_P2(_lh_process1_LH_P2_1_0, _lh_process1_LH_P2_0_0)))))) in
                ((((((process2_lh _lh_process1_arg1_0) (_lh_process1_arg2_0 + 1)) _lh_process1_arg3_0) _lh_process1_arg4_0) _lh_process1_arg5_0) eqn_0))))))
and
process2_lh _lh_process2_arg1_0 _lh_process2_arg2_0 _lh_process2_arg3_0 _lh_process2_arg4_0 _lh_process2_arg5_0 _lh_process2_arg6_0 =
  (let rec _lh_matchIdent_7 = ((split_lh (reducible_lh (reduce1_lh _lh_process2_arg6_0))) _lh_process2_arg3_0) in
    (match _lh_matchIdent_7 with
      | `LH_P2(_lh_process2_LH_P2_0_0, _lh_process2_LH_P2_1_0) -> 
        (let rec net'_0 = ((add_eqn_lh ((delete_eqns_lh ((map_lh eqno_lh) _lh_process2_LH_P2_0_0)) _lh_process2_arg4_0)) _lh_process2_arg6_0) in
          (let rec deletions_0 = ((map_lh eqpr_lh) _lh_process2_LH_P2_0_0) in
            (let rec critical_0 = ((all_crit_pairs_lh _lh_process2_arg6_0) _lh_process2_LH_P2_1_0) in
              (let rec new_agenda_0 = (sift_lh ((map_lh (resolve_lh (super_reduce_lh net'_0))) ((mappend_lh deletions_0) critical_0))) in
                (let rec todo'_0 = (((add_agenda_lh (snd_lh _lh_process2_arg1_0)) new_agenda_0) _lh_process2_arg5_0) in
                  (((((process_lh _lh_process2_arg1_0) _lh_process2_arg2_0) ((mappend_lh _lh_process2_LH_P2_1_0) (`LH_C(_lh_process2_arg6_0, (`LH_N))))) net'_0) todo'_0))))))))
and
process_lh _lh_process_arg1_0 _lh_process_arg2_0 _lh_process_arg3_0 _lh_process_arg4_0 _lh_process_arg5_0 =
  (match _lh_process_arg5_0 with
    | `LH_N -> 
      _lh_process_arg4_0
    | `LH_C(_lh_process_LH_C_0_0, _lh_process_LH_C_1_0) -> 
      (match _lh_process_LH_C_0_0 with
        | `Item(_lh_process_Item_0_0, _lh_process_Item_1_0) -> 
          ((((((process1_lh _lh_process_arg1_0) _lh_process_arg2_0) _lh_process_arg3_0) _lh_process_arg4_0) _lh_process_LH_C_1_0) ((preprocess_lh _lh_process_arg4_0) _lh_process_Item_1_0))));;
let rec knuth_bendix1_lh _lh_knuth_bendix1_arg1_0 _lh_knuth_bendix1_arg2_0 =
  (((((process_lh _lh_knuth_bendix1_arg1_0) 1) (`LH_N)) empty_net_lh) (((add_agenda_lh (snd_lh _lh_knuth_bendix1_arg1_0)) _lh_knuth_bendix1_arg2_0) (`LH_N)));;
let rec sumAux_lh ls_5 a_1 =
  (match ls_5 with
    | `LH_N -> 
      a_1
    | `LH_C(h_5, t_5) -> 
      ((sumAux_lh t_5) (a_1 + h_5)));;
let rec sum_lh ls_4 =
  ((sumAux_lh ls_4) 0);;
let rec cost_lh _lh_cost_arg1_0 =
  (match _lh_cost_arg1_0 with
    | `LH_P2(_lh_cost_LH_P2_0_0, _lh_cost_LH_P2_1_0) -> 
      (let rec size_0 = (fun _lh_size_arg1_0 -> 
        (((expr_fold_lh (fun x_1_3 a_2 -> 
          ((sum_lh a_2) + 1))) (fun dum_3 -> 
          0)) _lh_size_arg1_0)) in
        ((size_0 _lh_cost_LH_P2_0_0) + (size_0 _lh_cost_LH_P2_1_0))));;
let rec knuth_bendix_lh _lh_knuth_bendix_arg1_0 _lh_knuth_bendix_arg2_0 =
  ((knuth_bendix1_lh (`LH_P2(_lh_knuth_bendix_arg1_0, cost_lh))) _lh_knuth_bendix_arg2_0);;
let rec num_order_lh _lh_num_order_arg1_0 =
  (match _lh_num_order_arg1_0 with
    | `LH_P2(_lh_num_order_LH_P2_0_0, _lh_num_order_LH_P2_1_0) -> 
      (if (_lh_num_order_LH_P2_0_0 > _lh_num_order_LH_P2_1_0) then
        (`Greater)
      else
        (if (_lh_num_order_LH_P2_0_0 < _lh_num_order_LH_P2_1_0) then
          (`Less)
        else
          (`Equal))));;
let rec rank_order_lh _lh_rank_order_arg1_0 _lh_rank_order_arg2_0 =
  (match _lh_rank_order_arg2_0 with
    | `LH_P2(_lh_rank_order_LH_P2_0_0, _lh_rank_order_LH_P2_1_0) -> 
      (num_order_lh (`LH_P2((_lh_rank_order_arg1_0 _lh_rank_order_LH_P2_0_0), (_lh_rank_order_arg1_0 _lh_rank_order_LH_P2_1_0)))));;
let rec lex_combine_lh _lh_lex_combine_arg1_0 _lh_lex_combine_arg2_0 =
  (match _lh_lex_combine_arg1_0 with
    | `Equal -> 
      _lh_lex_combine_arg2_0
    | `Greater -> 
      (`Greater)
    | `Less -> 
      (`Less)
    | `Unrelated -> 
      (`Unrelated));;
let rec lexico_lh _lh_lexico_arg1_0 _lh_lexico_arg2_0 =
  (match _lh_lexico_arg2_0 with
    | `LH_P2(_lh_lexico_LH_P2_0_0, _lh_lexico_LH_P2_1_0) -> 
      (match _lh_lexico_LH_P2_0_0 with
        | `LH_N -> 
          (match _lh_lexico_LH_P2_1_0 with
            | `LH_N -> 
              (`Equal)
            | `LH_C(_lh_lexico_LH_C_0_0, _lh_lexico_LH_C_1_0) -> 
              (`Less))
        | `LH_C(_lh_lexico_LH_C_0_1, _lh_lexico_LH_C_1_1) -> 
          (match _lh_lexico_LH_P2_1_0 with
            | `LH_N -> 
              (`Greater)
            | `LH_C(_lh_lexico_LH_C_0_2, _lh_lexico_LH_C_1_2) -> 
              ((lex_combine_lh (_lh_lexico_arg1_0 (`LH_P2(_lh_lexico_LH_C_0_1, _lh_lexico_LH_C_0_2)))) ((lexico_lh _lh_lexico_arg1_0) (`LH_P2(_lh_lexico_LH_C_1_1, _lh_lexico_LH_C_1_2)))))));;
let rec lex_ext_lh _lh_lex_ext_arg1_0 _lh_lex_ext_arg2_0 =
  (match _lh_lex_ext_arg2_0 with
    | `LH_P2(_lh_lex_ext_LH_P2_0_0, _lh_lex_ext_LH_P2_1_0) -> 
      (match _lh_lex_ext_LH_P2_0_0 with
        | `Func(_lh_lex_ext_Func_0_0, _lh_lex_ext_Func_1_0) -> 
          (match _lh_lex_ext_LH_P2_1_0 with
            | `Func(_lh_lex_ext_Func_0_1, _lh_lex_ext_Func_1_1) -> 
              (let rec estimate_0 = ((lexico_lh _lh_lex_ext_arg1_0) (`LH_P2(_lh_lex_ext_Func_1_0, _lh_lex_ext_Func_1_1))) in
                (let rec confirm_0 = (fun x_1 -> 
                  (let rec _lh_matchIdent_1 = x_1 in
                    (match _lh_matchIdent_1 with
                      | `Equal -> 
                        true
                      | `Greater -> 
                        ((((quant_lh all_lh) (ltRewrite_lh _lh_lex_ext_arg1_0)) (`Func(_lh_lex_ext_Func_0_0, _lh_lex_ext_Func_1_0))) _lh_lex_ext_Func_1_1)
                      | `Less -> 
                        ((((quant_lh all_lh) (ltRewrite_lh _lh_lex_ext_arg1_0)) (`Func(_lh_lex_ext_Func_0_1, _lh_lex_ext_Func_1_1))) _lh_lex_ext_Func_1_0)
                      | `Unrelated -> 
                        false))) in
                  (if (confirm_0 estimate_0) then
                    estimate_0
                  else
                    (if ((((quant_lh any_lh) (geRewrite_lh _lh_lex_ext_arg1_0)) (`Func(_lh_lex_ext_Func_0_1, _lh_lex_ext_Func_1_1))) _lh_lex_ext_Func_1_0) then
                      (`Greater)
                    else
                      (if ((((quant_lh any_lh) (geRewrite_lh _lh_lex_ext_arg1_0)) (`Func(_lh_lex_ext_Func_0_0, _lh_lex_ext_Func_1_0))) _lh_lex_ext_Func_1_1) then
                        (`Less)
                      else
                        (`Unrelated))))))
            | _ -> 
              (failwith "lh_default_error"))
        | _ -> 
          (failwith "lh_default_error"))
    | _ -> 
      (failwith "lh_default_error"));;
let rec parse_lh _lh_parse_arg1_0 =
  ((fun _lh_funcomp_x_5 -> 
    ((fun _lh_funcomp_x_6 -> 
      ((fun _lh_funcomp_x_7 -> 
        (unExpr_lh (fst_lh _lh_funcomp_x_7))) (the_lh _lh_funcomp_x_6))) (p_expr_lh _lh_funcomp_x_5))) _lh_parse_arg1_0);;
let rec result_lh _lh_result_arg1_0 =
  (match _lh_result_arg1_0 with
    | `LH_P2(_lh_result_LH_P2_0_0, _lh_result_LH_P2_1_0) -> 
      (let rec group_completion_0 = ((knuth_bendix_lh ((rpo_lh (rank_order_lh rank_lh)) lex_ext_lh)) ((map_lh parse_eqn_lh) (`LH_C((`LH_C('(', (`LH_C('a', (`LH_C(' ', (`LH_C('*', (`LH_C(' ', (`LH_C('b', (`LH_C(')', (`LH_C(' ', (`LH_C('*', (`LH_C(' ', (`LH_C('c', (`LH_C(' ', (`LH_C('=', (`LH_C(' ', (`LH_C('a', (`LH_C(' ', (`LH_C('*', (`LH_C(' ', (`LH_C('(', (`LH_C('b', (`LH_C(' ', (`LH_C('*', (`LH_C(' ', (`LH_C('c', (`LH_C(')', (`LH_N))))))))))))))))))))))))))))))))))))))))))))))))))), (`LH_C((`LH_C('E', (`LH_C(' ', (`LH_C('*', (`LH_C(' ', (`LH_C('x', (`LH_C(' ', (`LH_C('=', (`LH_C(' ', (`LH_C('x', (`LH_N))))))))))))))))))), (`LH_C((`LH_C('I', (`LH_C('(', (`LH_C('x', (`LH_C(')', (`LH_C(' ', (`LH_C('*', (`LH_C(' ', (`LH_C('x', (`LH_C(' ', (`LH_C('=', (`LH_C(' ', (`LH_C('E', (`LH_N))))))))))))))))))))))))), (`LH_N))))))))) in
        ((eqExpr_lh ((simplify_lh (super_reduce_lh group_completion_0)) (parse_lh _lh_result_LH_P2_0_0))) (parse_lh _lh_result_LH_P2_1_0))));;
let rec copy_lh _lh_copy_arg1_0 _lh_copy_arg2_0 =
  (if (_lh_copy_arg1_0 <= 0) then
    (`LH_N)
  else
    (`LH_C(_lh_copy_arg2_0, ((copy_lh (_lh_copy_arg1_0 - 1)) _lh_copy_arg2_0))));;
let rec testRewrite_nofib_lh _lh_testRewrite_nofib_arg1_0 =
  ((all_lh result_lh) ((copy_lh _lh_testRewrite_nofib_arg1_0) (`LH_P2((`LH_C('I', (`LH_C('(', (`LH_C('a', (`LH_C(' ', (`LH_C('*', (`LH_C(' ', (`LH_C('b', (`LH_C(')', (`LH_N))))))))))))))))), (`LH_C('I', (`LH_C('(', (`LH_C('b', (`LH_C(')', (`LH_C(' ', (`LH_C('*', (`LH_C(' ', (`LH_C('I', (`LH_C('(', (`LH_C('a', (`LH_C(')', (`LH_N)))))))))))))))))))))))))));;
let run () = 1 + (Obj.magic ((testRewrite_nofib_lh 50)));
end;;

