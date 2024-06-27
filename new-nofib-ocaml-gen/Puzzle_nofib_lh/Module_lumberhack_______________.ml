

(* lumberhack *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack_______________(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec finalState_lh__d1 =
  (`State((`RightBank), (`RightBank), (`RightBank), (`RightBank)));;
let rec mappend_lh__d1 xs_1 ys_1 =
  (xs_1 ys_1);;
let rec concat_lh__d2 lss_0 =
  (lss_0 99);;
let rec opposite_lh__d1 _lh_opposite_arg1_0 =
  (match _lh_opposite_arg1_0 with
    | `LeftBank -> 
      (`RightBank)
    | `RightBank -> 
      (`LeftBank));;
let rec succItem_lh__d2 _lh_succItem_arg1_3 =
  (match _lh_succItem_arg1_3 with
    | `Bono -> 
      (`Edge)
    | `Edge -> 
      (`Larry)
    | `Larry -> 
      (`Adam));;
let rec succItem_lh__d1 _lh_succItem_arg1_0 =
  (match _lh_succItem_arg1_0 with
    | `Bono -> 
      (`Edge)
    | `Edge -> 
      (`Larry)
    | `Larry -> 
      (`Adam));;
let rec updateState_lh__d1 _lh_updateState_arg1_0 _lh_updateState_arg2_0 _lh_updateState_arg3_0 =
  (match _lh_updateState_arg1_0 with
    | `State(_lh_updateState_State_0_0, _lh_updateState_State_1_0, _lh_updateState_State_2_0, _lh_updateState_State_3_0) -> 
      (match _lh_updateState_arg2_0 with
        | `Bono -> 
          (let rec _lh_updateState_State_3_1 = _lh_updateState_State_3_0 in
            (let rec _lh_updateState_State_2_1 = _lh_updateState_State_2_0 in
              (let rec _lh_updateState_State_1_1 = _lh_updateState_State_1_0 in
                (let rec _lh_updateState_State_0_1 = _lh_updateState_arg3_0 in
                  (fun _lh_updateState_arg2_1 _lh_updateState_arg3_1 -> 
                    (match _lh_updateState_arg2_1 with
                      | `Bono -> 
                        (`State(_lh_updateState_arg3_1, _lh_updateState_State_1_1, _lh_updateState_State_2_1, _lh_updateState_State_3_1))
                      | `Edge -> 
                        (`State(_lh_updateState_State_0_1, _lh_updateState_arg3_1, _lh_updateState_State_2_1, _lh_updateState_State_3_1))
                      | `Larry -> 
                        (`State(_lh_updateState_State_0_1, _lh_updateState_State_1_1, _lh_updateState_arg3_1, _lh_updateState_State_3_1))
                      | `Adam -> 
                        (`State(_lh_updateState_State_0_1, _lh_updateState_State_1_1, _lh_updateState_State_2_1, _lh_updateState_arg3_1))))))))
        | `Edge -> 
          (let rec _lh_updateState_State_3_2 = _lh_updateState_State_3_0 in
            (let rec _lh_updateState_State_2_2 = _lh_updateState_State_2_0 in
              (let rec _lh_updateState_State_1_2 = _lh_updateState_arg3_0 in
                (let rec _lh_updateState_State_0_2 = _lh_updateState_State_0_0 in
                  (fun _lh_updateState_arg2_2 _lh_updateState_arg3_2 -> 
                    (match _lh_updateState_arg2_2 with
                      | `Bono -> 
                        (`State(_lh_updateState_arg3_2, _lh_updateState_State_1_2, _lh_updateState_State_2_2, _lh_updateState_State_3_2))
                      | `Edge -> 
                        (`State(_lh_updateState_State_0_2, _lh_updateState_arg3_2, _lh_updateState_State_2_2, _lh_updateState_State_3_2))
                      | `Larry -> 
                        (`State(_lh_updateState_State_0_2, _lh_updateState_State_1_2, _lh_updateState_arg3_2, _lh_updateState_State_3_2))
                      | `Adam -> 
                        (`State(_lh_updateState_State_0_2, _lh_updateState_State_1_2, _lh_updateState_State_2_2, _lh_updateState_arg3_2))))))))
        | `Larry -> 
          (let rec _lh_updateState_State_3_3 = _lh_updateState_State_3_0 in
            (let rec _lh_updateState_State_2_3 = _lh_updateState_arg3_0 in
              (let rec _lh_updateState_State_1_3 = _lh_updateState_State_1_0 in
                (let rec _lh_updateState_State_0_3 = _lh_updateState_State_0_0 in
                  (fun _lh_updateState_arg2_3 _lh_updateState_arg3_3 -> 
                    (match _lh_updateState_arg2_3 with
                      | `Bono -> 
                        (`State(_lh_updateState_arg3_3, _lh_updateState_State_1_3, _lh_updateState_State_2_3, _lh_updateState_State_3_3))
                      | `Edge -> 
                        (`State(_lh_updateState_State_0_3, _lh_updateState_arg3_3, _lh_updateState_State_2_3, _lh_updateState_State_3_3))
                      | `Larry -> 
                        (`State(_lh_updateState_State_0_3, _lh_updateState_State_1_3, _lh_updateState_arg3_3, _lh_updateState_State_3_3))
                      | `Adam -> 
                        (`State(_lh_updateState_State_0_3, _lh_updateState_State_1_3, _lh_updateState_State_2_3, _lh_updateState_arg3_3))))))))
        | `Adam -> 
          (let rec _lh_updateState_State_3_4 = _lh_updateState_arg3_0 in
            (let rec _lh_updateState_State_2_4 = _lh_updateState_State_2_0 in
              (let rec _lh_updateState_State_1_4 = _lh_updateState_State_1_0 in
                (let rec _lh_updateState_State_0_4 = _lh_updateState_State_0_0 in
                  (fun _lh_updateState_arg2_4 _lh_updateState_arg3_4 -> 
                    (match _lh_updateState_arg2_4 with
                      | `Bono -> 
                        (`State(_lh_updateState_arg3_4, _lh_updateState_State_1_4, _lh_updateState_State_2_4, _lh_updateState_State_3_4))
                      | `Edge -> 
                        (`State(_lh_updateState_State_0_4, _lh_updateState_arg3_4, _lh_updateState_State_2_4, _lh_updateState_State_3_4))
                      | `Larry -> 
                        (`State(_lh_updateState_State_0_4, _lh_updateState_State_1_4, _lh_updateState_arg3_4, _lh_updateState_State_3_4))
                      | `Adam -> 
                        (`State(_lh_updateState_State_0_4, _lh_updateState_State_1_4, _lh_updateState_State_2_4, _lh_updateState_arg3_4))))))))));;
let rec u2times_lh__d1 _lh_u2times_arg1_0 =
  (match _lh_u2times_arg1_0 with
    | `Bono -> 
      10
    | `Edge -> 
      5
    | `Larry -> 
      2
    | `Adam -> 
      1);;
let rec adamPos_lh__d2 _lh_adamPos_arg1_0 =
  (match _lh_adamPos_arg1_0 with
    | `State(_lh_adamPos_State_0_0, _lh_adamPos_State_1_0, _lh_adamPos_State_2_0, _lh_adamPos_State_3_0) -> 
      _lh_adamPos_State_3_0);;
let rec larryPos_lh__d2 _lh_larryPos_arg1_0 =
  (match _lh_larryPos_arg1_0 with
    | `State(_lh_larryPos_State_0_0, _lh_larryPos_State_1_0, _lh_larryPos_State_2_0, _lh_larryPos_State_3_0) -> 
      _lh_larryPos_State_2_0);;
let rec bonoPos_lh__d2 _lh_bonoPos_arg1_1 =
  (match _lh_bonoPos_arg1_1 with
    | `State(_lh_bonoPos_State_0_1, _lh_bonoPos_State_1_1, _lh_bonoPos_State_2_1, _lh_bonoPos_State_3_1) -> 
      _lh_bonoPos_State_0_1);;
let rec edgePos_lh__d2 _lh_edgePos_arg1_2 =
  (match _lh_edgePos_arg1_2 with
    | `State(_lh_edgePos_State_0_2, _lh_edgePos_State_1_2, _lh_edgePos_State_2_2, _lh_edgePos_State_3_2) -> 
      _lh_edgePos_State_1_2);;
let rec position_lh__d2 _lh_position_arg1_0 =
  (match _lh_position_arg1_0 with
    | `Bono -> 
      bonoPos_lh__d2
    | `Edge -> 
      edgePos_lh__d2
    | `Larry -> 
      larryPos_lh__d2
    | `Adam -> 
      adamPos_lh__d2);;
let rec mappend_lh__d5 xs_5 ys_5 =
  (match xs_5 with
    | `LH_C(h_3, t_3) -> 
      (`LH_C(h_3, ((mappend_lh__d5 t_3) ys_5)))
    | `LH_N -> 
      ys_5);;
let rec succItem_lh__d4 _lh_succItem_arg1_1 =
  (match _lh_succItem_arg1_1 with
    | `Bono -> 
      (`Edge)
    | `Edge -> 
      (`Larry)
    | `Larry -> 
      (`Adam));;
let rec all_lh__d2 _lh_all_arg1_1 _lh_all_arg2_1 =
  (match _lh_all_arg2_1 with
    | `LH_N -> 
      true
    | `LH_C(_lh_all_LH_C_0_1, _lh_all_LH_C_1_1) -> 
      (if (_lh_all_arg1_1 _lh_all_LH_C_0_1) then
        ((all_lh__d2 _lh_all_arg1_1) _lh_all_LH_C_1_1)
      else
        false));;
let rec notSeen_lh__d2 _lh_notSeen_arg1_1 =
  (all_lh__d2 (fun _s_1 -> 
    (let rec _lh_matchIdent_2 = _s_1 in
      (match _lh_matchIdent_2 with
        | `LH_P2(_lh_notSeen_LH_P2_0_1, _lh_notSeen_LH_P2_1_1) -> 
          (_lh_notSeen_arg1_1 <> _lh_notSeen_LH_P2_1_1)))));;
let rec adamPos_lh__d1 _lh_adamPos_arg1_2 =
  (match _lh_adamPos_arg1_2 with
    | `State(_lh_adamPos_State_0_2, _lh_adamPos_State_1_2, _lh_adamPos_State_2_2, _lh_adamPos_State_3_2) -> 
      _lh_adamPos_State_3_2);;
let rec larryPos_lh__d1 _lh_larryPos_arg1_1 =
  (match _lh_larryPos_arg1_1 with
    | `State(_lh_larryPos_State_0_1, _lh_larryPos_State_1_1, _lh_larryPos_State_2_1, _lh_larryPos_State_3_1) -> 
      _lh_larryPos_State_2_1);;
let rec edgePos_lh__d1 _lh_edgePos_arg1_0 =
  (match _lh_edgePos_arg1_0 with
    | `State(_lh_edgePos_State_0_0, _lh_edgePos_State_1_0, _lh_edgePos_State_2_0, _lh_edgePos_State_3_0) -> 
      _lh_edgePos_State_1_0);;
let rec bonoPos_lh__d1 _lh_bonoPos_arg1_0 =
  (match _lh_bonoPos_arg1_0 with
    | `State(_lh_bonoPos_State_0_0, _lh_bonoPos_State_1_0, _lh_bonoPos_State_2_0, _lh_bonoPos_State_3_0) -> 
      _lh_bonoPos_State_0_0);;
let rec position_lh__d1 _lh_position_arg1_1 =
  (match _lh_position_arg1_1 with
    | `Bono -> 
      bonoPos_lh__d1
    | `Edge -> 
      edgePos_lh__d1
    | `Larry -> 
      larryPos_lh__d1
    | `Adam -> 
      adamPos_lh__d1);;
let rec updateState_lh__d2 _lh_updateState_arg1_2 _lh_updateState_arg2_6 _lh_updateState_arg3_6 =
  ((_lh_updateState_arg1_2 _lh_updateState_arg2_6) _lh_updateState_arg3_6);;
let rec concat_lh__d1 lss_1 =
  (lss_1 99);;
let rec u2times_lh__d2 _lh_u2times_arg1_1 =
  (match _lh_u2times_arg1_1 with
    | `Bono -> 
      10
    | `Edge -> 
      5
    | `Larry -> 
      2
    | `Adam -> 
      1);;
let rec all_lh__d1 _lh_all_arg1_0 _lh_all_arg2_0 =
  (match _lh_all_arg2_0 with
    | `LH_N -> 
      true
    | `LH_C(_lh_all_LH_C_0_0, _lh_all_LH_C_1_0) -> 
      (if (_lh_all_arg1_0 _lh_all_LH_C_0_0) then
        ((all_lh__d1 _lh_all_arg1_0) _lh_all_LH_C_1_0)
      else
        false));;
let rec notSeen_lh__d1 _lh_notSeen_arg1_0 =
  (all_lh__d1 (fun _s_0 -> 
    (let rec _lh_matchIdent_1 = _s_0 in
      (match _lh_matchIdent_1 with
        | `LH_P2(_lh_notSeen_LH_P2_0_0, _lh_notSeen_LH_P2_1_0) -> 
          (_lh_notSeen_arg1_0 <> _lh_notSeen_LH_P2_1_0)))));;
let rec succItem_lh__d3 _lh_succItem_arg1_2 =
  (match _lh_succItem_arg1_2 with
    | `Bono -> 
      (`Edge)
    | `Edge -> 
      (`Larry)
    | `Larry -> 
      (`Adam));;
let rec mappend_lh__d4 xs_7 ys_3_8_0 =
  (match xs_7 with
    | `LH_C(h_3_6_7, t_3_6_7) -> 
      (let rec t_3_6_8 = ((mappend_lh__d4 t_3_6_7) ys_3_8_0) in
        (let rec h_3_6_8 = h_3_6_7 in
          (fun ys_3_8_1 -> 
            (`LH_C(h_3_6_8, ((mappend_lh__d1 t_3_6_8) ys_3_8_1))))))
    | `LH_N -> 
      ys_3_8_0);;
let rec edgePos_lh__d3 _lh_edgePos_arg1_1 =
  (match _lh_edgePos_arg1_1 with
    | `State(_lh_edgePos_State_0_1, _lh_edgePos_State_1_1, _lh_edgePos_State_2_1, _lh_edgePos_State_3_1) -> 
      _lh_edgePos_State_1_1);;
let rec adamPos_lh__d3 _lh_adamPos_arg1_1 =
  (match _lh_adamPos_arg1_1 with
    | `State(_lh_adamPos_State_0_1, _lh_adamPos_State_1_1, _lh_adamPos_State_2_1, _lh_adamPos_State_3_1) -> 
      _lh_adamPos_State_3_1);;
let rec larryPos_lh__d3 _lh_larryPos_arg1_2 =
  (match _lh_larryPos_arg1_2 with
    | `State(_lh_larryPos_State_0_2, _lh_larryPos_State_1_2, _lh_larryPos_State_2_2, _lh_larryPos_State_3_2) -> 
      _lh_larryPos_State_2_2);;
let rec bonoPos_lh__d3 _lh_bonoPos_arg1_2 =
  (match _lh_bonoPos_arg1_2 with
    | `State(_lh_bonoPos_State_0_2, _lh_bonoPos_State_1_2, _lh_bonoPos_State_2_2, _lh_bonoPos_State_3_2) -> 
      _lh_bonoPos_State_0_2);;
let rec position_lh__d3 _lh_position_arg1_2 =
  (match _lh_position_arg1_2 with
    | `Bono -> 
      bonoPos_lh__d3
    | `Edge -> 
      edgePos_lh__d3
    | `Larry -> 
      larryPos_lh__d3
    | `Adam -> 
      adamPos_lh__d3);;
let rec updateState_lh__d3 _lh_updateState_arg1_1 _lh_updateState_arg2_5 _lh_updateState_arg3_5 =
  (match _lh_updateState_arg1_1 with
    | `State(_lh_updateState_State_0_5, _lh_updateState_State_1_5, _lh_updateState_State_2_5, _lh_updateState_State_3_5) -> 
      (match _lh_updateState_arg2_5 with
        | `Bono -> 
          (`State(_lh_updateState_arg3_5, _lh_updateState_State_1_5, _lh_updateState_State_2_5, _lh_updateState_State_3_5))
        | `Edge -> 
          (`State(_lh_updateState_State_0_5, _lh_updateState_arg3_5, _lh_updateState_State_2_5, _lh_updateState_State_3_5))
        | `Larry -> 
          (`State(_lh_updateState_State_0_5, _lh_updateState_State_1_5, _lh_updateState_arg3_5, _lh_updateState_State_3_5))
        | `Adam -> 
          (`State(_lh_updateState_State_0_5, _lh_updateState_State_1_5, _lh_updateState_State_2_5, _lh_updateState_arg3_5))));;
let rec itemFromTo_lh__d1 _lh_itemFromTo_arg1_1 _lh_itemFromTo_arg2_1 =
  (if (_lh_itemFromTo_arg1_1 = _lh_itemFromTo_arg2_1) then
    (let rec _lh_listcomp_fun_ls_t_5 = (fun _lh_listcomp_fun_8 _lh_transfer_arg1_4 _lh_transfer_arg2_4 _lh_transfer_arg3_4 _lh_transfer_arg4_4 _lh_transfer_arg5_4 newHistory_4 newLocation_4 _lh_dummy_2 -> 
      (`LH_N)) in
      (let rec _lh_listcomp_fun_ls_h_5 = _lh_itemFromTo_arg1_1 in
        (fun _lh_listcomp_fun_9 _lh_transfer_arg1_5 _lh_transfer_arg2_5 _lh_transfer_arg3_5 _lh_transfer_arg4_5 _lh_transfer_arg5_5 newHistory_5 newLocation_5 -> 
          (let rec _lh_listcomp_fun_1_0 = (fun _lh_listcomp_fun_para_2 -> 
            (((((((((((_lh_listcomp_fun_para_2 _lh_listcomp_fun_ls_h_5) _lh_listcomp_fun_1_0) _lh_transfer_arg1_5) _lh_transfer_arg2_5) _lh_transfer_arg3_5) _lh_transfer_arg4_5) _lh_transfer_arg5_5) newHistory_5) newLocation_5) _lh_listcomp_fun_ls_t_5) _lh_listcomp_fun_9)) in
            (_lh_listcomp_fun_1_0 ((itemFromTo_lh__d3 (succItem_lh__d1 _lh_listcomp_fun_ls_h_5)) (`Adam)))))))
  else
    (let rec _lh_listcomp_fun_ls_t_6 = ((itemFromTo_lh__d1 (succItem_lh__d2 _lh_itemFromTo_arg1_1)) _lh_itemFromTo_arg2_1) in
      (let rec _lh_listcomp_fun_ls_h_6 = _lh_itemFromTo_arg1_1 in
        (fun _lh_listcomp_fun_1_1 _lh_transfer_arg1_6 _lh_transfer_arg2_6 _lh_transfer_arg3_6 _lh_transfer_arg4_6 _lh_transfer_arg5_6 newHistory_6 newLocation_6 -> 
          (let rec _lh_listcomp_fun_1_2 = (fun _lh_listcomp_fun_para_3 -> 
            (((((((((((_lh_listcomp_fun_para_3 _lh_listcomp_fun_ls_h_6) _lh_listcomp_fun_1_2) _lh_transfer_arg1_6) _lh_transfer_arg2_6) _lh_transfer_arg3_6) _lh_transfer_arg4_6) _lh_transfer_arg5_6) newHistory_6) newLocation_6) _lh_listcomp_fun_ls_t_6) _lh_listcomp_fun_1_1)) in
            (_lh_listcomp_fun_1_2 ((itemFromTo_lh__d3 (succItem_lh__d1 _lh_listcomp_fun_ls_h_6)) (`Adam))))))))
and
itemFromTo_lh__d2 _lh_itemFromTo_arg1_2 _lh_itemFromTo_arg2_2 =
  (if (_lh_itemFromTo_arg1_2 = _lh_itemFromTo_arg2_2) then
    (let rec _lh_listcomp_fun_ls_t_7 = (fun _lh_listcomp_fun_1_3 _lh_transfer_arg1_7 _lh_transfer_arg2_7 _lh_transfer_arg3_7 _lh_transfer_arg4_7 _lh_transfer_arg5_7 newHistory_7 newLocation_7 _lh_dummy_3 ys_4_1_9 -> 
      ys_4_1_9) in
      (let rec _lh_listcomp_fun_ls_h_7 = _lh_itemFromTo_arg1_2 in
        (fun _lh_listcomp_fun_1_4 _lh_transfer_arg1_8 _lh_transfer_arg2_8 _lh_transfer_arg3_8 _lh_transfer_arg4_8 _lh_transfer_arg5_8 newHistory_8 newLocation_8 -> 
          (if (((position_lh__d3 _lh_listcomp_fun_ls_h_7) _lh_transfer_arg2_8) = _lh_transfer_arg3_8) then
            (let rec newDest_2 = (((updateState_lh__d3 _lh_transfer_arg2_8) _lh_listcomp_fun_ls_h_7) newLocation_8) in
              (if ((notSeen_lh__d1 newDest_2) _lh_transfer_arg5_8) then
                (let rec newTime_2 = (_lh_transfer_arg4_8 + (u2times_lh__d2 _lh_listcomp_fun_ls_h_7)) in
                  (let rec t_4_0_8 = (_lh_listcomp_fun_1_4 _lh_listcomp_fun_ls_t_7) in
                    (let rec h_4_0_8 = (((((transfer_lh__d1 _lh_transfer_arg1_8) newDest_2) newLocation_8) newTime_2) newHistory_8) in
                      (fun _lh_dummy_4 -> 
                        ((mappend_lh__d4 h_4_0_8) (concat_lh__d1 t_4_0_8))))))
              else
                (_lh_listcomp_fun_1_4 _lh_listcomp_fun_ls_t_7)))
          else
            (_lh_listcomp_fun_1_4 _lh_listcomp_fun_ls_t_7)))))
  else
    (let rec _lh_listcomp_fun_ls_t_8 = ((itemFromTo_lh__d2 (succItem_lh__d3 _lh_itemFromTo_arg1_2)) _lh_itemFromTo_arg2_2) in
      (let rec _lh_listcomp_fun_ls_h_8 = _lh_itemFromTo_arg1_2 in
        (fun _lh_listcomp_fun_1_5 _lh_transfer_arg1_9 _lh_transfer_arg2_9 _lh_transfer_arg3_9 _lh_transfer_arg4_9 _lh_transfer_arg5_9 newHistory_9 newLocation_9 -> 
          (if (((position_lh__d3 _lh_listcomp_fun_ls_h_8) _lh_transfer_arg2_9) = _lh_transfer_arg3_9) then
            (let rec newDest_3 = (((updateState_lh__d3 _lh_transfer_arg2_9) _lh_listcomp_fun_ls_h_8) newLocation_9) in
              (if ((notSeen_lh__d1 newDest_3) _lh_transfer_arg5_9) then
                (let rec newTime_3 = (_lh_transfer_arg4_9 + (u2times_lh__d2 _lh_listcomp_fun_ls_h_8)) in
                  (let rec t_4_0_9 = (_lh_listcomp_fun_1_5 _lh_listcomp_fun_ls_t_8) in
                    (let rec h_4_0_9 = (((((transfer_lh__d1 _lh_transfer_arg1_9) newDest_3) newLocation_9) newTime_3) newHistory_9) in
                      (fun _lh_dummy_5 -> 
                        ((mappend_lh__d4 h_4_0_9) (concat_lh__d1 t_4_0_9))))))
              else
                (_lh_listcomp_fun_1_5 _lh_listcomp_fun_ls_t_8)))
          else
            (_lh_listcomp_fun_1_5 _lh_listcomp_fun_ls_t_8))))))
and
itemFromTo_lh__d3 _lh_itemFromTo_arg1_0 _lh_itemFromTo_arg2_0 =
  (if (_lh_itemFromTo_arg1_0 = _lh_itemFromTo_arg2_0) then
    (let rec _lh_listcomp_fun_ls_t_0 = (fun _lh_listcomp_fun_ls_h_0 _lh_listcomp_fun_2 _lh_transfer_arg1_1 _lh_transfer_arg2_1 _lh_transfer_arg3_1 _lh_transfer_arg4_1 _lh_transfer_arg5_1 newHistory_1 newLocation_1 _lh_listcomp_fun_ls_t_1 _lh_listcomp_fun_3 -> 
      (_lh_listcomp_fun_3 _lh_listcomp_fun_ls_t_1)) in
      (let rec _lh_listcomp_fun_ls_h_1 = _lh_itemFromTo_arg1_0 in
        (fun _lh_listcomp_fun_ls_h_2 _lh_listcomp_fun_4 _lh_transfer_arg1_2 _lh_transfer_arg2_2 _lh_transfer_arg3_2 _lh_transfer_arg4_2 _lh_transfer_arg5_2 newHistory_2 newLocation_2 _lh_listcomp_fun_ls_t_2 _lh_listcomp_fun_5 -> 
          (if ((((position_lh__d2 _lh_listcomp_fun_ls_h_2) _lh_transfer_arg2_2) = _lh_transfer_arg3_2) && (((position_lh__d1 _lh_listcomp_fun_ls_h_1) _lh_transfer_arg2_2) = _lh_transfer_arg3_2)) then
            (let rec newDest_0 = (((updateState_lh__d2 (((updateState_lh__d1 _lh_transfer_arg2_2) _lh_listcomp_fun_ls_h_2) newLocation_2)) _lh_listcomp_fun_ls_h_1) newLocation_2) in
              (if ((notSeen_lh__d2 newDest_0) _lh_transfer_arg5_2) then
                (let rec newTime_0 = (_lh_transfer_arg4_2 + (u2times_lh__d1 _lh_listcomp_fun_ls_h_2)) in
                  (let rec t_4_0_6 = (_lh_listcomp_fun_4 _lh_listcomp_fun_ls_t_0) in
                    (let rec h_4_0_6 = (((((transfer_lh__d1 _lh_transfer_arg1_2) newDest_0) newLocation_2) newTime_0) newHistory_2) in
                      (fun _lh_dummy_0 -> 
                        ((mappend_lh__d5 h_4_0_6) (concat_lh__d2 t_4_0_6))))))
              else
                (_lh_listcomp_fun_4 _lh_listcomp_fun_ls_t_0)))
          else
            (_lh_listcomp_fun_4 _lh_listcomp_fun_ls_t_0)))))
  else
    (let rec _lh_listcomp_fun_ls_t_3 = ((itemFromTo_lh__d3 (succItem_lh__d4 _lh_itemFromTo_arg1_0)) _lh_itemFromTo_arg2_0) in
      (let rec _lh_listcomp_fun_ls_h_3 = _lh_itemFromTo_arg1_0 in
        (fun _lh_listcomp_fun_ls_h_4 _lh_listcomp_fun_6 _lh_transfer_arg1_3 _lh_transfer_arg2_3 _lh_transfer_arg3_3 _lh_transfer_arg4_3 _lh_transfer_arg5_3 newHistory_3 newLocation_3 _lh_listcomp_fun_ls_t_4 _lh_listcomp_fun_7 -> 
          (if ((((position_lh__d2 _lh_listcomp_fun_ls_h_4) _lh_transfer_arg2_3) = _lh_transfer_arg3_3) && (((position_lh__d1 _lh_listcomp_fun_ls_h_3) _lh_transfer_arg2_3) = _lh_transfer_arg3_3)) then
            (let rec newDest_1 = (((updateState_lh__d2 (((updateState_lh__d1 _lh_transfer_arg2_3) _lh_listcomp_fun_ls_h_4) newLocation_3)) _lh_listcomp_fun_ls_h_3) newLocation_3) in
              (if ((notSeen_lh__d2 newDest_1) _lh_transfer_arg5_3) then
                (let rec newTime_1 = (_lh_transfer_arg4_3 + (u2times_lh__d1 _lh_listcomp_fun_ls_h_4)) in
                  (let rec t_4_0_7 = (_lh_listcomp_fun_6 _lh_listcomp_fun_ls_t_3) in
                    (let rec h_4_0_7 = (((((transfer_lh__d1 _lh_transfer_arg1_3) newDest_1) newLocation_3) newTime_1) newHistory_3) in
                      (fun _lh_dummy_1 -> 
                        ((mappend_lh__d5 h_4_0_7) (concat_lh__d2 t_4_0_7))))))
              else
                (_lh_listcomp_fun_6 _lh_listcomp_fun_ls_t_3)))
          else
            (_lh_listcomp_fun_6 _lh_listcomp_fun_ls_t_3))))))
and
transfer_lh__d1 _lh_transfer_arg1_0 _lh_transfer_arg2_0 _lh_transfer_arg3_0 _lh_transfer_arg4_0 _lh_transfer_arg5_0 =
  (if (_lh_transfer_arg1_0 = _lh_transfer_arg2_0) then
    (`LH_C((`LH_C((`LH_P2(_lh_transfer_arg4_0, _lh_transfer_arg2_0)), _lh_transfer_arg5_0)), (`LH_N)))
  else
    (let rec newHistory_0 = (`LH_C((`LH_P2(_lh_transfer_arg4_0, _lh_transfer_arg2_0)), _lh_transfer_arg5_0)) in
      (let rec newLocation_0 = (opposite_lh__d1 _lh_transfer_arg3_0) in
        (let rec moveOne_0 = (concat_lh__d1 (let rec _lh_listcomp_fun_0 = (fun _lh_listcomp_fun_para_0 -> 
          ((((((((_lh_listcomp_fun_para_0 _lh_listcomp_fun_0) _lh_transfer_arg1_0) _lh_transfer_arg2_0) _lh_transfer_arg3_0) _lh_transfer_arg4_0) _lh_transfer_arg5_0) newHistory_0) newLocation_0)) in
          (_lh_listcomp_fun_0 ((itemFromTo_lh__d2 (`Bono)) (`Adam))))) in
          (let rec moveTwo_0 = (concat_lh__d2 (let rec _lh_listcomp_fun_1 = (fun _lh_listcomp_fun_para_1 -> 
            ((((((((_lh_listcomp_fun_para_1 _lh_listcomp_fun_1) _lh_transfer_arg1_0) _lh_transfer_arg2_0) _lh_transfer_arg3_0) _lh_transfer_arg4_0) _lh_transfer_arg5_0) newHistory_0) newLocation_0)) in
            (_lh_listcomp_fun_1 ((itemFromTo_lh__d1 (`Bono)) (`Larry))))) in
            ((mappend_lh__d1 moveOne_0) moveTwo_0))))));;
let rec initialState_lh__d1 =
  (`State((`LeftBank), (`LeftBank), (`LeftBank), (`LeftBank)));;
let rec length_lh__d1 ls_2 =
  (match ls_2 with
    | `LH_C(h_3_7_5, t_3_7_5) -> 
      (1 + (length_lh__d1 t_3_7_5))
    | `LH_N -> 
      0);;
let rec writeSolutions_lh__d1 _lh_writeSolutions_arg1_0 _lh_writeSolutions_arg2_0 =
  (_lh_writeSolutions_arg1_0 _lh_writeSolutions_arg2_0);;
let rec mappend_lh__d3 xs_0 ys_0 =
  (match xs_0 with
    | `LH_C(h_0, t_0) -> 
      (`LH_C(h_0, ((mappend_lh__d3 t_0) ys_0)))
    | `LH_N -> 
      ys_0);;
let rec reverse_helper_lh__d1 ls_0 a_0 =
  (ls_0 a_0);;
let rec mappend_lh__d2 xs_4 ys_4 =
  (xs_4 ys_4);;
let rec totalTime_lh__d2 _lh_totalTime_arg1_0 =
  (match _lh_totalTime_arg1_0 with
    | `LH_C(_lh_totalTime_LH_C_0_0, _lh_totalTime_LH_C_1_0) -> 
      (match _lh_totalTime_LH_C_0_0 with
        | `LH_P2(_lh_totalTime_LH_P2_0_0, _lh_totalTime_LH_P2_1_0) -> 
          _lh_totalTime_LH_P2_0_0));;
let rec foldr_lh__d1 f_0 i_0 ls_1 =
  (match ls_1 with
    | `LH_C(h_1, t_1) -> 
      ((f_0 h_1) (((foldr_lh__d1 f_0) i_0) t_1))
    | `LH_N -> 
      i_0);;
let rec mappend_lh__d7 xs_3 ys_3 =
  (match xs_3 with
    | `LH_C(h_2, t_2) -> 
      (`LH_C(h_2, ((mappend_lh__d7 t_2) ys_3)))
    | `LH_N -> 
      ys_3);;
let rec mappend_lh__d8 xs_2 ys_2 =
  (xs_2 ys_2);;
let rec writeItem_lh__d1 _lh_writeItem_arg1_0 _lh_writeItem_arg2_0 _lh_writeItem_arg3_0 =
  ((_lh_writeItem_arg1_0 _lh_writeItem_arg2_0) _lh_writeItem_arg3_0);;
let rec writeState_lh__d1 _lh_writeState_arg1_0 _lh_funcomp_x_0 =
  ((fun _lh_funcomp_x_1 -> 
    ((fun _lh_funcomp_x_2 -> 
      ((fun _lh_funcomp_x_3 -> 
        ((fun _lh_funcomp_x_4 -> 
          ((fun s_0 -> 
            ((mappend_lh__d8 (let rec t_4 = (let rec t_5 = (let rec t_6 = (let rec t_7 = (let rec t_8 = (let rec t_9 = (let rec t_1_0 = (let rec t_1_1 = (let rec t_1_2 = (let rec t_1_3 = (let rec t_1_4 = (let rec t_1_5 = (let rec t_1_6 = (let rec t_1_7 = (let rec t_1_8 = (let rec t_1_9 = (let rec t_2_0 = (let rec t_2_1 = (let rec t_2_2 = (let rec t_2_3 = (let rec t_2_4 = (let rec t_2_5 = (let rec t_2_6 = (let rec t_2_7 = (let rec t_2_8 = (let rec t_2_9 = (let rec t_3_0 = (let rec t_3_1 = (let rec t_3_2 = (let rec t_3_3 = (let rec t_3_4 = (let rec t_3_5 = (let rec t_3_6 = (let rec t_3_7 = (let rec t_3_8 = (let rec t_3_9 = (let rec t_4_0 = (let rec t_4_1 = (let rec t_4_2 = (let rec t_4_3 = (let rec t_4_4 = (fun ys_6 -> 
              ys_6) in
              (let rec h_4 = '|' in
                (fun ys_7 -> 
                  (`LH_C(h_4, ((mappend_lh__d8 t_4_4) ys_7)))))) in
              (let rec h_5 = '-' in
                (fun ys_8 -> 
                  (`LH_C(h_5, ((mappend_lh__d8 t_4_3) ys_8)))))) in
              (let rec h_6 = '-' in
                (fun ys_9 -> 
                  (`LH_C(h_6, ((mappend_lh__d8 t_4_2) ys_9)))))) in
              (let rec h_7 = '-' in
                (fun ys_1_0 -> 
                  (`LH_C(h_7, ((mappend_lh__d8 t_4_1) ys_1_0)))))) in
              (let rec h_8 = '-' in
                (fun ys_1_1 -> 
                  (`LH_C(h_8, ((mappend_lh__d8 t_4_0) ys_1_1)))))) in
              (let rec h_9 = '-' in
                (fun ys_1_2 -> 
                  (`LH_C(h_9, ((mappend_lh__d8 t_3_9) ys_1_2)))))) in
              (let rec h_1_0 = '-' in
                (fun ys_1_3 -> 
                  (`LH_C(h_1_0, ((mappend_lh__d8 t_3_8) ys_1_3)))))) in
              (let rec h_1_1 = '-' in
                (fun ys_1_4 -> 
                  (`LH_C(h_1_1, ((mappend_lh__d8 t_3_7) ys_1_4)))))) in
              (let rec h_1_2 = '-' in
                (fun ys_1_5 -> 
                  (`LH_C(h_1_2, ((mappend_lh__d8 t_3_6) ys_1_5)))))) in
              (let rec h_1_3 = '-' in
                (fun ys_1_6 -> 
                  (`LH_C(h_1_3, ((mappend_lh__d8 t_3_5) ys_1_6)))))) in
              (let rec h_1_4 = '-' in
                (fun ys_1_7 -> 
                  (`LH_C(h_1_4, ((mappend_lh__d8 t_3_4) ys_1_7)))))) in
              (let rec h_1_5 = '-' in
                (fun ys_1_8 -> 
                  (`LH_C(h_1_5, ((mappend_lh__d8 t_3_3) ys_1_8)))))) in
              (let rec h_1_6 = '-' in
                (fun ys_1_9 -> 
                  (`LH_C(h_1_6, ((mappend_lh__d8 t_3_2) ys_1_9)))))) in
              (let rec h_1_7 = '-' in
                (fun ys_2_0 -> 
                  (`LH_C(h_1_7, ((mappend_lh__d8 t_3_1) ys_2_0)))))) in
              (let rec h_1_8 = '-' in
                (fun ys_2_1 -> 
                  (`LH_C(h_1_8, ((mappend_lh__d8 t_3_0) ys_2_1)))))) in
              (let rec h_1_9 = '-' in
                (fun ys_2_2 -> 
                  (`LH_C(h_1_9, ((mappend_lh__d8 t_2_9) ys_2_2)))))) in
              (let rec h_2_0 = '-' in
                (fun ys_2_3 -> 
                  (`LH_C(h_2_0, ((mappend_lh__d8 t_2_8) ys_2_3)))))) in
              (let rec h_2_1 = '-' in
                (fun ys_2_4 -> 
                  (`LH_C(h_2_1, ((mappend_lh__d8 t_2_7) ys_2_4)))))) in
              (let rec h_2_2 = '-' in
                (fun ys_2_5 -> 
                  (`LH_C(h_2_2, ((mappend_lh__d8 t_2_6) ys_2_5)))))) in
              (let rec h_2_3 = '-' in
                (fun ys_2_6 -> 
                  (`LH_C(h_2_3, ((mappend_lh__d8 t_2_5) ys_2_6)))))) in
              (let rec h_2_4 = '-' in
                (fun ys_2_7 -> 
                  (`LH_C(h_2_4, ((mappend_lh__d8 t_2_4) ys_2_7)))))) in
              (let rec h_2_5 = '-' in
                (fun ys_2_8 -> 
                  (`LH_C(h_2_5, ((mappend_lh__d8 t_2_3) ys_2_8)))))) in
              (let rec h_2_6 = '-' in
                (fun ys_2_9 -> 
                  (`LH_C(h_2_6, ((mappend_lh__d8 t_2_2) ys_2_9)))))) in
              (let rec h_2_7 = '-' in
                (fun ys_3_0 -> 
                  (`LH_C(h_2_7, ((mappend_lh__d8 t_2_1) ys_3_0)))))) in
              (let rec h_2_8 = '-' in
                (fun ys_3_1 -> 
                  (`LH_C(h_2_8, ((mappend_lh__d8 t_2_0) ys_3_1)))))) in
              (let rec h_2_9 = '-' in
                (fun ys_3_2 -> 
                  (`LH_C(h_2_9, ((mappend_lh__d8 t_1_9) ys_3_2)))))) in
              (let rec h_3_0 = '-' in
                (fun ys_3_3 -> 
                  (`LH_C(h_3_0, ((mappend_lh__d8 t_1_8) ys_3_3)))))) in
              (let rec h_3_1 = '-' in
                (fun ys_3_4 -> 
                  (`LH_C(h_3_1, ((mappend_lh__d8 t_1_7) ys_3_4)))))) in
              (let rec h_3_2 = '-' in
                (fun ys_3_5 -> 
                  (`LH_C(h_3_2, ((mappend_lh__d8 t_1_6) ys_3_5)))))) in
              (let rec h_3_3 = '-' in
                (fun ys_3_6 -> 
                  (`LH_C(h_3_3, ((mappend_lh__d8 t_1_5) ys_3_6)))))) in
              (let rec h_3_4 = '-' in
                (fun ys_3_7 -> 
                  (`LH_C(h_3_4, ((mappend_lh__d8 t_1_4) ys_3_7)))))) in
              (let rec h_3_5 = '-' in
                (fun ys_3_8 -> 
                  (`LH_C(h_3_5, ((mappend_lh__d8 t_1_3) ys_3_8)))))) in
              (let rec h_3_6 = '-' in
                (fun ys_3_9 -> 
                  (`LH_C(h_3_6, ((mappend_lh__d8 t_1_2) ys_3_9)))))) in
              (let rec h_3_7 = '-' in
                (fun ys_4_0 -> 
                  (`LH_C(h_3_7, ((mappend_lh__d8 t_1_1) ys_4_0)))))) in
              (let rec h_3_8 = '-' in
                (fun ys_4_1 -> 
                  (`LH_C(h_3_8, ((mappend_lh__d8 t_1_0) ys_4_1)))))) in
              (let rec h_3_9 = '-' in
                (fun ys_4_2 -> 
                  (`LH_C(h_3_9, ((mappend_lh__d8 t_9) ys_4_2)))))) in
              (let rec h_4_0 = '-' in
                (fun ys_4_3 -> 
                  (`LH_C(h_4_0, ((mappend_lh__d8 t_8) ys_4_3)))))) in
              (let rec h_4_1 = '-' in
                (fun ys_4_4 -> 
                  (`LH_C(h_4_1, ((mappend_lh__d8 t_7) ys_4_4)))))) in
              (let rec h_4_2 = '-' in
                (fun ys_4_5 -> 
                  (`LH_C(h_4_2, ((mappend_lh__d8 t_6) ys_4_5)))))) in
              (let rec h_4_3 = '-' in
                (fun ys_4_6 -> 
                  (`LH_C(h_4_3, ((mappend_lh__d8 t_5) ys_4_6)))))) in
              (let rec h_4_4 = '-' in
                (fun ys_4_7 -> 
                  (`LH_C(h_4_4, ((mappend_lh__d8 t_4) ys_4_7))))))) s_0)) (((writeItem_lh__d1 (fun _lh_writeItem_arg2_1 _lh_writeItem_arg3_1 -> 
            (match _lh_writeItem_arg2_1 with
              | `LeftBank -> 
                ((mappend_lh__d8 (let rec t_4_5 = (let rec t_4_6 = (let rec t_4_7 = (let rec t_4_8 = (let rec t_4_9 = (let rec t_5_0 = (let rec t_5_1 = (let rec t_5_2 = (let rec t_5_3 = (let rec t_5_4 = (let rec t_5_5 = (let rec t_5_6 = (let rec t_5_7 = (let rec t_5_8 = (let rec t_5_9 = (let rec t_6_0 = (let rec t_6_1 = (let rec t_6_2 = (let rec t_6_3 = (let rec t_6_4 = (let rec t_6_5 = (let rec t_6_6 = (let rec t_6_7 = (let rec t_6_8 = (let rec t_6_9 = (let rec t_7_0 = (let rec t_7_1 = (let rec t_7_2 = (let rec t_7_3 = (let rec t_7_4 = (let rec t_7_5 = (let rec t_7_6 = (fun ys_4_8 -> 
                  ys_4_8) in
                  (let rec h_4_5 = '|' in
                    (fun ys_4_9 -> 
                      (`LH_C(h_4_5, ((mappend_lh__d8 t_7_6) ys_4_9)))))) in
                  (let rec h_4_6 = '|' in
                    (fun ys_5_0 -> 
                      (`LH_C(h_4_6, ((mappend_lh__d8 t_7_5) ys_5_0)))))) in
                  (let rec h_4_7 = ' ' in
                    (fun ys_5_1 -> 
                      (`LH_C(h_4_7, ((mappend_lh__d8 t_7_4) ys_5_1)))))) in
                  (let rec h_4_8 = ' ' in
                    (fun ys_5_2 -> 
                      (`LH_C(h_4_8, ((mappend_lh__d8 t_7_3) ys_5_2)))))) in
                  (let rec h_4_9 = ' ' in
                    (fun ys_5_3 -> 
                      (`LH_C(h_4_9, ((mappend_lh__d8 t_7_2) ys_5_3)))))) in
                  (let rec h_5_0 = ' ' in
                    (fun ys_5_4 -> 
                      (`LH_C(h_5_0, ((mappend_lh__d8 t_7_1) ys_5_4)))))) in
                  (let rec h_5_1 = ' ' in
                    (fun ys_5_5 -> 
                      (`LH_C(h_5_1, ((mappend_lh__d8 t_7_0) ys_5_5)))))) in
                  (let rec h_5_2 = ' ' in
                    (fun ys_5_6 -> 
                      (`LH_C(h_5_2, ((mappend_lh__d8 t_6_9) ys_5_6)))))) in
                  (let rec h_5_3 = ' ' in
                    (fun ys_5_7 -> 
                      (`LH_C(h_5_3, ((mappend_lh__d8 t_6_8) ys_5_7)))))) in
                  (let rec h_5_4 = ' ' in
                    (fun ys_5_8 -> 
                      (`LH_C(h_5_4, ((mappend_lh__d8 t_6_7) ys_5_8)))))) in
                  (let rec h_5_5 = ' ' in
                    (fun ys_5_9 -> 
                      (`LH_C(h_5_5, ((mappend_lh__d8 t_6_6) ys_5_9)))))) in
                  (let rec h_5_6 = ' ' in
                    (fun ys_6_0 -> 
                      (`LH_C(h_5_6, ((mappend_lh__d8 t_6_5) ys_6_0)))))) in
                  (let rec h_5_7 = ' ' in
                    (fun ys_6_1 -> 
                      (`LH_C(h_5_7, ((mappend_lh__d8 t_6_4) ys_6_1)))))) in
                  (let rec h_5_8 = ' ' in
                    (fun ys_6_2 -> 
                      (`LH_C(h_5_8, ((mappend_lh__d8 t_6_3) ys_6_2)))))) in
                  (let rec h_5_9 = ' ' in
                    (fun ys_6_3 -> 
                      (`LH_C(h_5_9, ((mappend_lh__d8 t_6_2) ys_6_3)))))) in
                  (let rec h_6_0 = ' ' in
                    (fun ys_6_4 -> 
                      (`LH_C(h_6_0, ((mappend_lh__d8 t_6_1) ys_6_4)))))) in
                  (let rec h_6_1 = ' ' in
                    (fun ys_6_5 -> 
                      (`LH_C(h_6_1, ((mappend_lh__d8 t_6_0) ys_6_5)))))) in
                  (let rec h_6_2 = ' ' in
                    (fun ys_6_6 -> 
                      (`LH_C(h_6_2, ((mappend_lh__d8 t_5_9) ys_6_6)))))) in
                  (let rec h_6_3 = ' ' in
                    (fun ys_6_7 -> 
                      (`LH_C(h_6_3, ((mappend_lh__d8 t_5_8) ys_6_7)))))) in
                  (let rec h_6_4 = ' ' in
                    (fun ys_6_8 -> 
                      (`LH_C(h_6_4, ((mappend_lh__d8 t_5_7) ys_6_8)))))) in
                  (let rec h_6_5 = ' ' in
                    (fun ys_6_9 -> 
                      (`LH_C(h_6_5, ((mappend_lh__d8 t_5_6) ys_6_9)))))) in
                  (let rec h_6_6 = ' ' in
                    (fun ys_7_0 -> 
                      (`LH_C(h_6_6, ((mappend_lh__d8 t_5_5) ys_7_0)))))) in
                  (let rec h_6_7 = '|' in
                    (fun ys_7_1 -> 
                      (`LH_C(h_6_7, ((mappend_lh__d8 t_5_4) ys_7_1)))))) in
                  (let rec h_6_8 = ' ' in
                    (fun ys_7_2 -> 
                      (`LH_C(h_6_8, ((mappend_lh__d8 t_5_3) ys_7_2)))))) in
                  (let rec h_6_9 = 'o' in
                    (fun ys_7_3 -> 
                      (`LH_C(h_6_9, ((mappend_lh__d8 t_5_2) ys_7_3)))))) in
                  (let rec h_7_0 = 'n' in
                    (fun ys_7_4 -> 
                      (`LH_C(h_7_0, ((mappend_lh__d8 t_5_1) ys_7_4)))))) in
                  (let rec h_7_1 = 'o' in
                    (fun ys_7_5 -> 
                      (`LH_C(h_7_1, ((mappend_lh__d8 t_5_0) ys_7_5)))))) in
                  (let rec h_7_2 = 'B' in
                    (fun ys_7_6 -> 
                      (`LH_C(h_7_2, ((mappend_lh__d8 t_4_9) ys_7_6)))))) in
                  (let rec h_7_3 = ' ' in
                    (fun ys_7_7 -> 
                      (`LH_C(h_7_3, ((mappend_lh__d8 t_4_8) ys_7_7)))))) in
                  (let rec h_7_4 = ' ' in
                    (fun ys_7_8 -> 
                      (`LH_C(h_7_4, ((mappend_lh__d8 t_4_7) ys_7_8)))))) in
                  (let rec h_7_5 = ' ' in
                    (fun ys_7_9 -> 
                      (`LH_C(h_7_5, ((mappend_lh__d8 t_4_6) ys_7_9)))))) in
                  (let rec h_7_6 = ' ' in
                    (fun ys_8_0 -> 
                      (`LH_C(h_7_6, ((mappend_lh__d8 t_4_5) ys_8_0))))))) _lh_writeItem_arg3_1)
              | `RightBank -> 
                ((mappend_lh__d8 (let rec t_7_7 = (let rec t_7_8 = (let rec t_7_9 = (let rec t_8_0 = (let rec t_8_1 = (let rec t_8_2 = (let rec t_8_3 = (let rec t_8_4 = (let rec t_8_5 = (let rec t_8_6 = (let rec t_8_7 = (let rec t_8_8 = (let rec t_8_9 = (let rec t_9_0 = (let rec t_9_1 = (let rec t_9_2 = (let rec t_9_3 = (let rec t_9_4 = (let rec t_9_5 = (let rec t_9_6 = (let rec t_9_7 = (let rec t_9_8 = (let rec t_9_9 = (let rec t_1_0_0 = (let rec t_1_0_1 = (let rec t_1_0_2 = (let rec t_1_0_3 = (let rec t_1_0_4 = (let rec t_1_0_5 = (let rec t_1_0_6 = (let rec t_1_0_7 = (let rec t_1_0_8 = (let rec t_1_0_9 = (let rec t_1_1_0 = (let rec t_1_1_1 = (let rec t_1_1_2 = (let rec t_1_1_3 = (fun ys_8_1 -> 
                  ys_8_1) in
                  (let rec h_7_7 = '|' in
                    (fun ys_8_2 -> 
                      (`LH_C(h_7_7, ((mappend_lh__d8 t_1_1_3) ys_8_2)))))) in
                  (let rec h_7_8 = 'o' in
                    (fun ys_8_3 -> 
                      (`LH_C(h_7_8, ((mappend_lh__d8 t_1_1_2) ys_8_3)))))) in
                  (let rec h_7_9 = 'n' in
                    (fun ys_8_4 -> 
                      (`LH_C(h_7_9, ((mappend_lh__d8 t_1_1_1) ys_8_4)))))) in
                  (let rec h_8_0 = 'o' in
                    (fun ys_8_5 -> 
                      (`LH_C(h_8_0, ((mappend_lh__d8 t_1_1_0) ys_8_5)))))) in
                  (let rec h_8_1 = 'B' in
                    (fun ys_8_6 -> 
                      (`LH_C(h_8_1, ((mappend_lh__d8 t_1_0_9) ys_8_6)))))) in
                  (let rec h_8_2 = ' ' in
                    (fun ys_8_7 -> 
                      (`LH_C(h_8_2, ((mappend_lh__d8 t_1_0_8) ys_8_7)))))) in
                  (let rec h_8_3 = '|' in
                    (fun ys_8_8 -> 
                      (`LH_C(h_8_3, ((mappend_lh__d8 t_1_0_7) ys_8_8)))))) in
                  (let rec h_8_4 = ' ' in
                    (fun ys_8_9 -> 
                      (`LH_C(h_8_4, ((mappend_lh__d8 t_1_0_6) ys_8_9)))))) in
                  (let rec h_8_5 = ' ' in
                    (fun ys_9_0 -> 
                      (`LH_C(h_8_5, ((mappend_lh__d8 t_1_0_5) ys_9_0)))))) in
                  (let rec h_8_6 = ' ' in
                    (fun ys_9_1 -> 
                      (`LH_C(h_8_6, ((mappend_lh__d8 t_1_0_4) ys_9_1)))))) in
                  (let rec h_8_7 = ' ' in
                    (fun ys_9_2 -> 
                      (`LH_C(h_8_7, ((mappend_lh__d8 t_1_0_3) ys_9_2)))))) in
                  (let rec h_8_8 = ' ' in
                    (fun ys_9_3 -> 
                      (`LH_C(h_8_8, ((mappend_lh__d8 t_1_0_2) ys_9_3)))))) in
                  (let rec h_8_9 = ' ' in
                    (fun ys_9_4 -> 
                      (`LH_C(h_8_9, ((mappend_lh__d8 t_1_0_1) ys_9_4)))))) in
                  (let rec h_9_0 = ' ' in
                    (fun ys_9_5 -> 
                      (`LH_C(h_9_0, ((mappend_lh__d8 t_1_0_0) ys_9_5)))))) in
                  (let rec h_9_1 = ' ' in
                    (fun ys_9_6 -> 
                      (`LH_C(h_9_1, ((mappend_lh__d8 t_9_9) ys_9_6)))))) in
                  (let rec h_9_2 = ' ' in
                    (fun ys_9_7 -> 
                      (`LH_C(h_9_2, ((mappend_lh__d8 t_9_8) ys_9_7)))))) in
                  (let rec h_9_3 = ' ' in
                    (fun ys_9_8 -> 
                      (`LH_C(h_9_3, ((mappend_lh__d8 t_9_7) ys_9_8)))))) in
                  (let rec h_9_4 = ' ' in
                    (fun ys_9_9 -> 
                      (`LH_C(h_9_4, ((mappend_lh__d8 t_9_6) ys_9_9)))))) in
                  (let rec h_9_5 = ' ' in
                    (fun ys_1_0_0 -> 
                      (`LH_C(h_9_5, ((mappend_lh__d8 t_9_5) ys_1_0_0)))))) in
                  (let rec h_9_6 = ' ' in
                    (fun ys_1_0_1 -> 
                      (`LH_C(h_9_6, ((mappend_lh__d8 t_9_4) ys_1_0_1)))))) in
                  (let rec h_9_7 = ' ' in
                    (fun ys_1_0_2 -> 
                      (`LH_C(h_9_7, ((mappend_lh__d8 t_9_3) ys_1_0_2)))))) in
                  (let rec h_9_8 = ' ' in
                    (fun ys_1_0_3 -> 
                      (`LH_C(h_9_8, ((mappend_lh__d8 t_9_2) ys_1_0_3)))))) in
                  (let rec h_9_9 = ' ' in
                    (fun ys_1_0_4 -> 
                      (`LH_C(h_9_9, ((mappend_lh__d8 t_9_1) ys_1_0_4)))))) in
                  (let rec h_1_0_0 = ' ' in
                    (fun ys_1_0_5 -> 
                      (`LH_C(h_1_0_0, ((mappend_lh__d8 t_9_0) ys_1_0_5)))))) in
                  (let rec h_1_0_1 = ' ' in
                    (fun ys_1_0_6 -> 
                      (`LH_C(h_1_0_1, ((mappend_lh__d8 t_8_9) ys_1_0_6)))))) in
                  (let rec h_1_0_2 = ' ' in
                    (fun ys_1_0_7 -> 
                      (`LH_C(h_1_0_2, ((mappend_lh__d8 t_8_8) ys_1_0_7)))))) in
                  (let rec h_1_0_3 = ' ' in
                    (fun ys_1_0_8 -> 
                      (`LH_C(h_1_0_3, ((mappend_lh__d8 t_8_7) ys_1_0_8)))))) in
                  (let rec h_1_0_4 = '|' in
                    (fun ys_1_0_9 -> 
                      (`LH_C(h_1_0_4, ((mappend_lh__d8 t_8_6) ys_1_0_9)))))) in
                  (let rec h_1_0_5 = ' ' in
                    (fun ys_1_1_0 -> 
                      (`LH_C(h_1_0_5, ((mappend_lh__d8 t_8_5) ys_1_1_0)))))) in
                  (let rec h_1_0_6 = ' ' in
                    (fun ys_1_1_1 -> 
                      (`LH_C(h_1_0_6, ((mappend_lh__d8 t_8_4) ys_1_1_1)))))) in
                  (let rec h_1_0_7 = ' ' in
                    (fun ys_1_1_2 -> 
                      (`LH_C(h_1_0_7, ((mappend_lh__d8 t_8_3) ys_1_1_2)))))) in
                  (let rec h_1_0_8 = ' ' in
                    (fun ys_1_1_3 -> 
                      (`LH_C(h_1_0_8, ((mappend_lh__d8 t_8_2) ys_1_1_3)))))) in
                  (let rec h_1_0_9 = ' ' in
                    (fun ys_1_1_4 -> 
                      (`LH_C(h_1_0_9, ((mappend_lh__d8 t_8_1) ys_1_1_4)))))) in
                  (let rec h_1_1_0 = ' ' in
                    (fun ys_1_1_5 -> 
                      (`LH_C(h_1_1_0, ((mappend_lh__d8 t_8_0) ys_1_1_5)))))) in
                  (let rec h_1_1_1 = ' ' in
                    (fun ys_1_1_6 -> 
                      (`LH_C(h_1_1_1, ((mappend_lh__d8 t_7_9) ys_1_1_6)))))) in
                  (let rec h_1_1_2 = ' ' in
                    (fun ys_1_1_7 -> 
                      (`LH_C(h_1_1_2, ((mappend_lh__d8 t_7_8) ys_1_1_7)))))) in
                  (let rec h_1_1_3 = ' ' in
                    (fun ys_1_1_8 -> 
                      (`LH_C(h_1_1_3, ((mappend_lh__d8 t_7_7) ys_1_1_8))))))) _lh_writeItem_arg3_1)))) (bonoPos_lh__d3 _lh_writeState_arg1_0)) _lh_funcomp_x_4))) (((writeItem_lh__d1 (fun _lh_writeItem_arg2_2 _lh_writeItem_arg3_2 -> 
          (match _lh_writeItem_arg2_2 with
            | `LeftBank -> 
              ((mappend_lh__d8 (let rec t_1_1_4 = (let rec t_1_1_5 = (let rec t_1_1_6 = (let rec t_1_1_7 = (let rec t_1_1_8 = (let rec t_1_1_9 = (let rec t_1_2_0 = (let rec t_1_2_1 = (let rec t_1_2_2 = (let rec t_1_2_3 = (let rec t_1_2_4 = (let rec t_1_2_5 = (let rec t_1_2_6 = (let rec t_1_2_7 = (let rec t_1_2_8 = (let rec t_1_2_9 = (let rec t_1_3_0 = (let rec t_1_3_1 = (let rec t_1_3_2 = (let rec t_1_3_3 = (let rec t_1_3_4 = (let rec t_1_3_5 = (let rec t_1_3_6 = (let rec t_1_3_7 = (let rec t_1_3_8 = (let rec t_1_3_9 = (let rec t_1_4_0 = (let rec t_1_4_1 = (let rec t_1_4_2 = (let rec t_1_4_3 = (let rec t_1_4_4 = (let rec t_1_4_5 = (fun ys_1_1_9 -> 
                ys_1_1_9) in
                (let rec h_1_1_4 = '|' in
                  (fun ys_1_2_0 -> 
                    (`LH_C(h_1_1_4, ((mappend_lh__d8 t_1_4_5) ys_1_2_0)))))) in
                (let rec h_1_1_5 = '|' in
                  (fun ys_1_2_1 -> 
                    (`LH_C(h_1_1_5, ((mappend_lh__d8 t_1_4_4) ys_1_2_1)))))) in
                (let rec h_1_1_6 = ' ' in
                  (fun ys_1_2_2 -> 
                    (`LH_C(h_1_1_6, ((mappend_lh__d8 t_1_4_3) ys_1_2_2)))))) in
                (let rec h_1_1_7 = ' ' in
                  (fun ys_1_2_3 -> 
                    (`LH_C(h_1_1_7, ((mappend_lh__d8 t_1_4_2) ys_1_2_3)))))) in
                (let rec h_1_1_8 = ' ' in
                  (fun ys_1_2_4 -> 
                    (`LH_C(h_1_1_8, ((mappend_lh__d8 t_1_4_1) ys_1_2_4)))))) in
                (let rec h_1_1_9 = ' ' in
                  (fun ys_1_2_5 -> 
                    (`LH_C(h_1_1_9, ((mappend_lh__d8 t_1_4_0) ys_1_2_5)))))) in
                (let rec h_1_2_0 = ' ' in
                  (fun ys_1_2_6 -> 
                    (`LH_C(h_1_2_0, ((mappend_lh__d8 t_1_3_9) ys_1_2_6)))))) in
                (let rec h_1_2_1 = ' ' in
                  (fun ys_1_2_7 -> 
                    (`LH_C(h_1_2_1, ((mappend_lh__d8 t_1_3_8) ys_1_2_7)))))) in
                (let rec h_1_2_2 = ' ' in
                  (fun ys_1_2_8 -> 
                    (`LH_C(h_1_2_2, ((mappend_lh__d8 t_1_3_7) ys_1_2_8)))))) in
                (let rec h_1_2_3 = ' ' in
                  (fun ys_1_2_9 -> 
                    (`LH_C(h_1_2_3, ((mappend_lh__d8 t_1_3_6) ys_1_2_9)))))) in
                (let rec h_1_2_4 = ' ' in
                  (fun ys_1_3_0 -> 
                    (`LH_C(h_1_2_4, ((mappend_lh__d8 t_1_3_5) ys_1_3_0)))))) in
                (let rec h_1_2_5 = ' ' in
                  (fun ys_1_3_1 -> 
                    (`LH_C(h_1_2_5, ((mappend_lh__d8 t_1_3_4) ys_1_3_1)))))) in
                (let rec h_1_2_6 = ' ' in
                  (fun ys_1_3_2 -> 
                    (`LH_C(h_1_2_6, ((mappend_lh__d8 t_1_3_3) ys_1_3_2)))))) in
                (let rec h_1_2_7 = ' ' in
                  (fun ys_1_3_3 -> 
                    (`LH_C(h_1_2_7, ((mappend_lh__d8 t_1_3_2) ys_1_3_3)))))) in
                (let rec h_1_2_8 = ' ' in
                  (fun ys_1_3_4 -> 
                    (`LH_C(h_1_2_8, ((mappend_lh__d8 t_1_3_1) ys_1_3_4)))))) in
                (let rec h_1_2_9 = ' ' in
                  (fun ys_1_3_5 -> 
                    (`LH_C(h_1_2_9, ((mappend_lh__d8 t_1_3_0) ys_1_3_5)))))) in
                (let rec h_1_3_0 = ' ' in
                  (fun ys_1_3_6 -> 
                    (`LH_C(h_1_3_0, ((mappend_lh__d8 t_1_2_9) ys_1_3_6)))))) in
                (let rec h_1_3_1 = ' ' in
                  (fun ys_1_3_7 -> 
                    (`LH_C(h_1_3_1, ((mappend_lh__d8 t_1_2_8) ys_1_3_7)))))) in
                (let rec h_1_3_2 = ' ' in
                  (fun ys_1_3_8 -> 
                    (`LH_C(h_1_3_2, ((mappend_lh__d8 t_1_2_7) ys_1_3_8)))))) in
                (let rec h_1_3_3 = ' ' in
                  (fun ys_1_3_9 -> 
                    (`LH_C(h_1_3_3, ((mappend_lh__d8 t_1_2_6) ys_1_3_9)))))) in
                (let rec h_1_3_4 = ' ' in
                  (fun ys_1_4_0 -> 
                    (`LH_C(h_1_3_4, ((mappend_lh__d8 t_1_2_5) ys_1_4_0)))))) in
                (let rec h_1_3_5 = ' ' in
                  (fun ys_1_4_1 -> 
                    (`LH_C(h_1_3_5, ((mappend_lh__d8 t_1_2_4) ys_1_4_1)))))) in
                (let rec h_1_3_6 = '|' in
                  (fun ys_1_4_2 -> 
                    (`LH_C(h_1_3_6, ((mappend_lh__d8 t_1_2_3) ys_1_4_2)))))) in
                (let rec h_1_3_7 = ' ' in
                  (fun ys_1_4_3 -> 
                    (`LH_C(h_1_3_7, ((mappend_lh__d8 t_1_2_2) ys_1_4_3)))))) in
                (let rec h_1_3_8 = 'e' in
                  (fun ys_1_4_4 -> 
                    (`LH_C(h_1_3_8, ((mappend_lh__d8 t_1_2_1) ys_1_4_4)))))) in
                (let rec h_1_3_9 = 'g' in
                  (fun ys_1_4_5 -> 
                    (`LH_C(h_1_3_9, ((mappend_lh__d8 t_1_2_0) ys_1_4_5)))))) in
                (let rec h_1_4_0 = 'd' in
                  (fun ys_1_4_6 -> 
                    (`LH_C(h_1_4_0, ((mappend_lh__d8 t_1_1_9) ys_1_4_6)))))) in
                (let rec h_1_4_1 = 'E' in
                  (fun ys_1_4_7 -> 
                    (`LH_C(h_1_4_1, ((mappend_lh__d8 t_1_1_8) ys_1_4_7)))))) in
                (let rec h_1_4_2 = ' ' in
                  (fun ys_1_4_8 -> 
                    (`LH_C(h_1_4_2, ((mappend_lh__d8 t_1_1_7) ys_1_4_8)))))) in
                (let rec h_1_4_3 = 'e' in
                  (fun ys_1_4_9 -> 
                    (`LH_C(h_1_4_3, ((mappend_lh__d8 t_1_1_6) ys_1_4_9)))))) in
                (let rec h_1_4_4 = 'h' in
                  (fun ys_1_5_0 -> 
                    (`LH_C(h_1_4_4, ((mappend_lh__d8 t_1_1_5) ys_1_5_0)))))) in
                (let rec h_1_4_5 = 'T' in
                  (fun ys_1_5_1 -> 
                    (`LH_C(h_1_4_5, ((mappend_lh__d8 t_1_1_4) ys_1_5_1))))))) _lh_writeItem_arg3_2)
            | `RightBank -> 
              ((mappend_lh__d8 (let rec t_1_4_6 = (let rec t_1_4_7 = (let rec t_1_4_8 = (let rec t_1_4_9 = (let rec t_1_5_0 = (let rec t_1_5_1 = (let rec t_1_5_2 = (let rec t_1_5_3 = (let rec t_1_5_4 = (let rec t_1_5_5 = (let rec t_1_5_6 = (let rec t_1_5_7 = (let rec t_1_5_8 = (let rec t_1_5_9 = (let rec t_1_6_0 = (let rec t_1_6_1 = (let rec t_1_6_2 = (let rec t_1_6_3 = (let rec t_1_6_4 = (let rec t_1_6_5 = (let rec t_1_6_6 = (let rec t_1_6_7 = (let rec t_1_6_8 = (let rec t_1_6_9 = (let rec t_1_7_0 = (let rec t_1_7_1 = (let rec t_1_7_2 = (let rec t_1_7_3 = (let rec t_1_7_4 = (let rec t_1_7_5 = (let rec t_1_7_6 = (let rec t_1_7_7 = (let rec t_1_7_8 = (let rec t_1_7_9 = (let rec t_1_8_0 = (let rec t_1_8_1 = (let rec t_1_8_2 = (let rec t_1_8_3 = (let rec t_1_8_4 = (let rec t_1_8_5 = (let rec t_1_8_6 = (fun ys_1_5_2 -> 
                ys_1_5_2) in
                (let rec h_1_4_6 = '|' in
                  (fun ys_1_5_3 -> 
                    (`LH_C(h_1_4_6, ((mappend_lh__d8 t_1_8_6) ys_1_5_3)))))) in
                (let rec h_1_4_7 = 'e' in
                  (fun ys_1_5_4 -> 
                    (`LH_C(h_1_4_7, ((mappend_lh__d8 t_1_8_5) ys_1_5_4)))))) in
                (let rec h_1_4_8 = 'g' in
                  (fun ys_1_5_5 -> 
                    (`LH_C(h_1_4_8, ((mappend_lh__d8 t_1_8_4) ys_1_5_5)))))) in
                (let rec h_1_4_9 = 'd' in
                  (fun ys_1_5_6 -> 
                    (`LH_C(h_1_4_9, ((mappend_lh__d8 t_1_8_3) ys_1_5_6)))))) in
                (let rec h_1_5_0 = 'E' in
                  (fun ys_1_5_7 -> 
                    (`LH_C(h_1_5_0, ((mappend_lh__d8 t_1_8_2) ys_1_5_7)))))) in
                (let rec h_1_5_1 = ' ' in
                  (fun ys_1_5_8 -> 
                    (`LH_C(h_1_5_1, ((mappend_lh__d8 t_1_8_1) ys_1_5_8)))))) in
                (let rec h_1_5_2 = 'e' in
                  (fun ys_1_5_9 -> 
                    (`LH_C(h_1_5_2, ((mappend_lh__d8 t_1_8_0) ys_1_5_9)))))) in
                (let rec h_1_5_3 = 'h' in
                  (fun ys_1_6_0 -> 
                    (`LH_C(h_1_5_3, ((mappend_lh__d8 t_1_7_9) ys_1_6_0)))))) in
                (let rec h_1_5_4 = 'T' in
                  (fun ys_1_6_1 -> 
                    (`LH_C(h_1_5_4, ((mappend_lh__d8 t_1_7_8) ys_1_6_1)))))) in
                (let rec h_1_5_5 = ' ' in
                  (fun ys_1_6_2 -> 
                    (`LH_C(h_1_5_5, ((mappend_lh__d8 t_1_7_7) ys_1_6_2)))))) in
                (let rec h_1_5_6 = '|' in
                  (fun ys_1_6_3 -> 
                    (`LH_C(h_1_5_6, ((mappend_lh__d8 t_1_7_6) ys_1_6_3)))))) in
                (let rec h_1_5_7 = ' ' in
                  (fun ys_1_6_4 -> 
                    (`LH_C(h_1_5_7, ((mappend_lh__d8 t_1_7_5) ys_1_6_4)))))) in
                (let rec h_1_5_8 = ' ' in
                  (fun ys_1_6_5 -> 
                    (`LH_C(h_1_5_8, ((mappend_lh__d8 t_1_7_4) ys_1_6_5)))))) in
                (let rec h_1_5_9 = ' ' in
                  (fun ys_1_6_6 -> 
                    (`LH_C(h_1_5_9, ((mappend_lh__d8 t_1_7_3) ys_1_6_6)))))) in
                (let rec h_1_6_0 = ' ' in
                  (fun ys_1_6_7 -> 
                    (`LH_C(h_1_6_0, ((mappend_lh__d8 t_1_7_2) ys_1_6_7)))))) in
                (let rec h_1_6_1 = ' ' in
                  (fun ys_1_6_8 -> 
                    (`LH_C(h_1_6_1, ((mappend_lh__d8 t_1_7_1) ys_1_6_8)))))) in
                (let rec h_1_6_2 = ' ' in
                  (fun ys_1_6_9 -> 
                    (`LH_C(h_1_6_2, ((mappend_lh__d8 t_1_7_0) ys_1_6_9)))))) in
                (let rec h_1_6_3 = ' ' in
                  (fun ys_1_7_0 -> 
                    (`LH_C(h_1_6_3, ((mappend_lh__d8 t_1_6_9) ys_1_7_0)))))) in
                (let rec h_1_6_4 = ' ' in
                  (fun ys_1_7_1 -> 
                    (`LH_C(h_1_6_4, ((mappend_lh__d8 t_1_6_8) ys_1_7_1)))))) in
                (let rec h_1_6_5 = ' ' in
                  (fun ys_1_7_2 -> 
                    (`LH_C(h_1_6_5, ((mappend_lh__d8 t_1_6_7) ys_1_7_2)))))) in
                (let rec h_1_6_6 = ' ' in
                  (fun ys_1_7_3 -> 
                    (`LH_C(h_1_6_6, ((mappend_lh__d8 t_1_6_6) ys_1_7_3)))))) in
                (let rec h_1_6_7 = ' ' in
                  (fun ys_1_7_4 -> 
                    (`LH_C(h_1_6_7, ((mappend_lh__d8 t_1_6_5) ys_1_7_4)))))) in
                (let rec h_1_6_8 = ' ' in
                  (fun ys_1_7_5 -> 
                    (`LH_C(h_1_6_8, ((mappend_lh__d8 t_1_6_4) ys_1_7_5)))))) in
                (let rec h_1_6_9 = ' ' in
                  (fun ys_1_7_6 -> 
                    (`LH_C(h_1_6_9, ((mappend_lh__d8 t_1_6_3) ys_1_7_6)))))) in
                (let rec h_1_7_0 = ' ' in
                  (fun ys_1_7_7 -> 
                    (`LH_C(h_1_7_0, ((mappend_lh__d8 t_1_6_2) ys_1_7_7)))))) in
                (let rec h_1_7_1 = ' ' in
                  (fun ys_1_7_8 -> 
                    (`LH_C(h_1_7_1, ((mappend_lh__d8 t_1_6_1) ys_1_7_8)))))) in
                (let rec h_1_7_2 = ' ' in
                  (fun ys_1_7_9 -> 
                    (`LH_C(h_1_7_2, ((mappend_lh__d8 t_1_6_0) ys_1_7_9)))))) in
                (let rec h_1_7_3 = ' ' in
                  (fun ys_1_8_0 -> 
                    (`LH_C(h_1_7_3, ((mappend_lh__d8 t_1_5_9) ys_1_8_0)))))) in
                (let rec h_1_7_4 = ' ' in
                  (fun ys_1_8_1 -> 
                    (`LH_C(h_1_7_4, ((mappend_lh__d8 t_1_5_8) ys_1_8_1)))))) in
                (let rec h_1_7_5 = ' ' in
                  (fun ys_1_8_2 -> 
                    (`LH_C(h_1_7_5, ((mappend_lh__d8 t_1_5_7) ys_1_8_2)))))) in
                (let rec h_1_7_6 = ' ' in
                  (fun ys_1_8_3 -> 
                    (`LH_C(h_1_7_6, ((mappend_lh__d8 t_1_5_6) ys_1_8_3)))))) in
                (let rec h_1_7_7 = '|' in
                  (fun ys_1_8_4 -> 
                    (`LH_C(h_1_7_7, ((mappend_lh__d8 t_1_5_5) ys_1_8_4)))))) in
                (let rec h_1_7_8 = ' ' in
                  (fun ys_1_8_5 -> 
                    (`LH_C(h_1_7_8, ((mappend_lh__d8 t_1_5_4) ys_1_8_5)))))) in
                (let rec h_1_7_9 = ' ' in
                  (fun ys_1_8_6 -> 
                    (`LH_C(h_1_7_9, ((mappend_lh__d8 t_1_5_3) ys_1_8_6)))))) in
                (let rec h_1_8_0 = ' ' in
                  (fun ys_1_8_7 -> 
                    (`LH_C(h_1_8_0, ((mappend_lh__d8 t_1_5_2) ys_1_8_7)))))) in
                (let rec h_1_8_1 = ' ' in
                  (fun ys_1_8_8 -> 
                    (`LH_C(h_1_8_1, ((mappend_lh__d8 t_1_5_1) ys_1_8_8)))))) in
                (let rec h_1_8_2 = ' ' in
                  (fun ys_1_8_9 -> 
                    (`LH_C(h_1_8_2, ((mappend_lh__d8 t_1_5_0) ys_1_8_9)))))) in
                (let rec h_1_8_3 = ' ' in
                  (fun ys_1_9_0 -> 
                    (`LH_C(h_1_8_3, ((mappend_lh__d8 t_1_4_9) ys_1_9_0)))))) in
                (let rec h_1_8_4 = ' ' in
                  (fun ys_1_9_1 -> 
                    (`LH_C(h_1_8_4, ((mappend_lh__d8 t_1_4_8) ys_1_9_1)))))) in
                (let rec h_1_8_5 = ' ' in
                  (fun ys_1_9_2 -> 
                    (`LH_C(h_1_8_5, ((mappend_lh__d8 t_1_4_7) ys_1_9_2)))))) in
                (let rec h_1_8_6 = ' ' in
                  (fun ys_1_9_3 -> 
                    (`LH_C(h_1_8_6, ((mappend_lh__d8 t_1_4_6) ys_1_9_3))))))) _lh_writeItem_arg3_2)))) (edgePos_lh__d3 _lh_writeState_arg1_0)) _lh_funcomp_x_3))) (((writeItem_lh__d1 (fun _lh_writeItem_arg2_3 _lh_writeItem_arg3_3 -> 
        (match _lh_writeItem_arg2_3 with
          | `LeftBank -> 
            ((mappend_lh__d8 (let rec t_1_8_7 = (let rec t_1_8_8 = (let rec t_1_8_9 = (let rec t_1_9_0 = (let rec t_1_9_1 = (let rec t_1_9_2 = (let rec t_1_9_3 = (let rec t_1_9_4 = (let rec t_1_9_5 = (let rec t_1_9_6 = (let rec t_1_9_7 = (let rec t_1_9_8 = (let rec t_1_9_9 = (let rec t_2_0_0 = (let rec t_2_0_1 = (let rec t_2_0_2 = (let rec t_2_0_3 = (let rec t_2_0_4 = (let rec t_2_0_5 = (let rec t_2_0_6 = (let rec t_2_0_7 = (let rec t_2_0_8 = (let rec t_2_0_9 = (let rec t_2_1_0 = (let rec t_2_1_1 = (let rec t_2_1_2 = (let rec t_2_1_3 = (let rec t_2_1_4 = (let rec t_2_1_5 = (let rec t_2_1_6 = (let rec t_2_1_7 = (let rec t_2_1_8 = (fun ys_1_9_4 -> 
              ys_1_9_4) in
              (let rec h_1_8_7 = '|' in
                (fun ys_1_9_5 -> 
                  (`LH_C(h_1_8_7, ((mappend_lh__d8 t_2_1_8) ys_1_9_5)))))) in
              (let rec h_1_8_8 = '|' in
                (fun ys_1_9_6 -> 
                  (`LH_C(h_1_8_8, ((mappend_lh__d8 t_2_1_7) ys_1_9_6)))))) in
              (let rec h_1_8_9 = ' ' in
                (fun ys_1_9_7 -> 
                  (`LH_C(h_1_8_9, ((mappend_lh__d8 t_2_1_6) ys_1_9_7)))))) in
              (let rec h_1_9_0 = ' ' in
                (fun ys_1_9_8 -> 
                  (`LH_C(h_1_9_0, ((mappend_lh__d8 t_2_1_5) ys_1_9_8)))))) in
              (let rec h_1_9_1 = ' ' in
                (fun ys_1_9_9 -> 
                  (`LH_C(h_1_9_1, ((mappend_lh__d8 t_2_1_4) ys_1_9_9)))))) in
              (let rec h_1_9_2 = ' ' in
                (fun ys_2_0_0 -> 
                  (`LH_C(h_1_9_2, ((mappend_lh__d8 t_2_1_3) ys_2_0_0)))))) in
              (let rec h_1_9_3 = ' ' in
                (fun ys_2_0_1 -> 
                  (`LH_C(h_1_9_3, ((mappend_lh__d8 t_2_1_2) ys_2_0_1)))))) in
              (let rec h_1_9_4 = ' ' in
                (fun ys_2_0_2 -> 
                  (`LH_C(h_1_9_4, ((mappend_lh__d8 t_2_1_1) ys_2_0_2)))))) in
              (let rec h_1_9_5 = ' ' in
                (fun ys_2_0_3 -> 
                  (`LH_C(h_1_9_5, ((mappend_lh__d8 t_2_1_0) ys_2_0_3)))))) in
              (let rec h_1_9_6 = ' ' in
                (fun ys_2_0_4 -> 
                  (`LH_C(h_1_9_6, ((mappend_lh__d8 t_2_0_9) ys_2_0_4)))))) in
              (let rec h_1_9_7 = ' ' in
                (fun ys_2_0_5 -> 
                  (`LH_C(h_1_9_7, ((mappend_lh__d8 t_2_0_8) ys_2_0_5)))))) in
              (let rec h_1_9_8 = ' ' in
                (fun ys_2_0_6 -> 
                  (`LH_C(h_1_9_8, ((mappend_lh__d8 t_2_0_7) ys_2_0_6)))))) in
              (let rec h_1_9_9 = ' ' in
                (fun ys_2_0_7 -> 
                  (`LH_C(h_1_9_9, ((mappend_lh__d8 t_2_0_6) ys_2_0_7)))))) in
              (let rec h_2_0_0 = ' ' in
                (fun ys_2_0_8 -> 
                  (`LH_C(h_2_0_0, ((mappend_lh__d8 t_2_0_5) ys_2_0_8)))))) in
              (let rec h_2_0_1 = ' ' in
                (fun ys_2_0_9 -> 
                  (`LH_C(h_2_0_1, ((mappend_lh__d8 t_2_0_4) ys_2_0_9)))))) in
              (let rec h_2_0_2 = ' ' in
                (fun ys_2_1_0 -> 
                  (`LH_C(h_2_0_2, ((mappend_lh__d8 t_2_0_3) ys_2_1_0)))))) in
              (let rec h_2_0_3 = ' ' in
                (fun ys_2_1_1 -> 
                  (`LH_C(h_2_0_3, ((mappend_lh__d8 t_2_0_2) ys_2_1_1)))))) in
              (let rec h_2_0_4 = ' ' in
                (fun ys_2_1_2 -> 
                  (`LH_C(h_2_0_4, ((mappend_lh__d8 t_2_0_1) ys_2_1_2)))))) in
              (let rec h_2_0_5 = ' ' in
                (fun ys_2_1_3 -> 
                  (`LH_C(h_2_0_5, ((mappend_lh__d8 t_2_0_0) ys_2_1_3)))))) in
              (let rec h_2_0_6 = ' ' in
                (fun ys_2_1_4 -> 
                  (`LH_C(h_2_0_6, ((mappend_lh__d8 t_1_9_9) ys_2_1_4)))))) in
              (let rec h_2_0_7 = ' ' in
                (fun ys_2_1_5 -> 
                  (`LH_C(h_2_0_7, ((mappend_lh__d8 t_1_9_8) ys_2_1_5)))))) in
              (let rec h_2_0_8 = ' ' in
                (fun ys_2_1_6 -> 
                  (`LH_C(h_2_0_8, ((mappend_lh__d8 t_1_9_7) ys_2_1_6)))))) in
              (let rec h_2_0_9 = '|' in
                (fun ys_2_1_7 -> 
                  (`LH_C(h_2_0_9, ((mappend_lh__d8 t_1_9_6) ys_2_1_7)))))) in
              (let rec h_2_1_0 = ' ' in
                (fun ys_2_1_8 -> 
                  (`LH_C(h_2_1_0, ((mappend_lh__d8 t_1_9_5) ys_2_1_8)))))) in
              (let rec h_2_1_1 = 'y' in
                (fun ys_2_1_9 -> 
                  (`LH_C(h_2_1_1, ((mappend_lh__d8 t_1_9_4) ys_2_1_9)))))) in
              (let rec h_2_1_2 = 'r' in
                (fun ys_2_2_0 -> 
                  (`LH_C(h_2_1_2, ((mappend_lh__d8 t_1_9_3) ys_2_2_0)))))) in
              (let rec h_2_1_3 = 'r' in
                (fun ys_2_2_1 -> 
                  (`LH_C(h_2_1_3, ((mappend_lh__d8 t_1_9_2) ys_2_2_1)))))) in
              (let rec h_2_1_4 = 'a' in
                (fun ys_2_2_2 -> 
                  (`LH_C(h_2_1_4, ((mappend_lh__d8 t_1_9_1) ys_2_2_2)))))) in
              (let rec h_2_1_5 = 'L' in
                (fun ys_2_2_3 -> 
                  (`LH_C(h_2_1_5, ((mappend_lh__d8 t_1_9_0) ys_2_2_3)))))) in
              (let rec h_2_1_6 = ' ' in
                (fun ys_2_2_4 -> 
                  (`LH_C(h_2_1_6, ((mappend_lh__d8 t_1_8_9) ys_2_2_4)))))) in
              (let rec h_2_1_7 = ' ' in
                (fun ys_2_2_5 -> 
                  (`LH_C(h_2_1_7, ((mappend_lh__d8 t_1_8_8) ys_2_2_5)))))) in
              (let rec h_2_1_8 = ' ' in
                (fun ys_2_2_6 -> 
                  (`LH_C(h_2_1_8, ((mappend_lh__d8 t_1_8_7) ys_2_2_6))))))) _lh_writeItem_arg3_3)
          | `RightBank -> 
            ((mappend_lh__d8 (let rec t_2_1_9 = (let rec t_2_2_0 = (let rec t_2_2_1 = (let rec t_2_2_2 = (let rec t_2_2_3 = (let rec t_2_2_4 = (let rec t_2_2_5 = (let rec t_2_2_6 = (let rec t_2_2_7 = (let rec t_2_2_8 = (let rec t_2_2_9 = (let rec t_2_3_0 = (let rec t_2_3_1 = (let rec t_2_3_2 = (let rec t_2_3_3 = (let rec t_2_3_4 = (let rec t_2_3_5 = (let rec t_2_3_6 = (let rec t_2_3_7 = (let rec t_2_3_8 = (let rec t_2_3_9 = (let rec t_2_4_0 = (let rec t_2_4_1 = (let rec t_2_4_2 = (let rec t_2_4_3 = (let rec t_2_4_4 = (let rec t_2_4_5 = (let rec t_2_4_6 = (let rec t_2_4_7 = (let rec t_2_4_8 = (let rec t_2_4_9 = (let rec t_2_5_0 = (let rec t_2_5_1 = (let rec t_2_5_2 = (let rec t_2_5_3 = (let rec t_2_5_4 = (let rec t_2_5_5 = (let rec t_2_5_6 = (fun ys_2_2_7 -> 
              ys_2_2_7) in
              (let rec h_2_1_9 = '|' in
                (fun ys_2_2_8 -> 
                  (`LH_C(h_2_1_9, ((mappend_lh__d8 t_2_5_6) ys_2_2_8)))))) in
              (let rec h_2_2_0 = 'y' in
                (fun ys_2_2_9 -> 
                  (`LH_C(h_2_2_0, ((mappend_lh__d8 t_2_5_5) ys_2_2_9)))))) in
              (let rec h_2_2_1 = 'r' in
                (fun ys_2_3_0 -> 
                  (`LH_C(h_2_2_1, ((mappend_lh__d8 t_2_5_4) ys_2_3_0)))))) in
              (let rec h_2_2_2 = 'r' in
                (fun ys_2_3_1 -> 
                  (`LH_C(h_2_2_2, ((mappend_lh__d8 t_2_5_3) ys_2_3_1)))))) in
              (let rec h_2_2_3 = 'a' in
                (fun ys_2_3_2 -> 
                  (`LH_C(h_2_2_3, ((mappend_lh__d8 t_2_5_2) ys_2_3_2)))))) in
              (let rec h_2_2_4 = 'L' in
                (fun ys_2_3_3 -> 
                  (`LH_C(h_2_2_4, ((mappend_lh__d8 t_2_5_1) ys_2_3_3)))))) in
              (let rec h_2_2_5 = ' ' in
                (fun ys_2_3_4 -> 
                  (`LH_C(h_2_2_5, ((mappend_lh__d8 t_2_5_0) ys_2_3_4)))))) in
              (let rec h_2_2_6 = '|' in
                (fun ys_2_3_5 -> 
                  (`LH_C(h_2_2_6, ((mappend_lh__d8 t_2_4_9) ys_2_3_5)))))) in
              (let rec h_2_2_7 = ' ' in
                (fun ys_2_3_6 -> 
                  (`LH_C(h_2_2_7, ((mappend_lh__d8 t_2_4_8) ys_2_3_6)))))) in
              (let rec h_2_2_8 = ' ' in
                (fun ys_2_3_7 -> 
                  (`LH_C(h_2_2_8, ((mappend_lh__d8 t_2_4_7) ys_2_3_7)))))) in
              (let rec h_2_2_9 = ' ' in
                (fun ys_2_3_8 -> 
                  (`LH_C(h_2_2_9, ((mappend_lh__d8 t_2_4_6) ys_2_3_8)))))) in
              (let rec h_2_3_0 = ' ' in
                (fun ys_2_3_9 -> 
                  (`LH_C(h_2_3_0, ((mappend_lh__d8 t_2_4_5) ys_2_3_9)))))) in
              (let rec h_2_3_1 = ' ' in
                (fun ys_2_4_0 -> 
                  (`LH_C(h_2_3_1, ((mappend_lh__d8 t_2_4_4) ys_2_4_0)))))) in
              (let rec h_2_3_2 = ' ' in
                (fun ys_2_4_1 -> 
                  (`LH_C(h_2_3_2, ((mappend_lh__d8 t_2_4_3) ys_2_4_1)))))) in
              (let rec h_2_3_3 = ' ' in
                (fun ys_2_4_2 -> 
                  (`LH_C(h_2_3_3, ((mappend_lh__d8 t_2_4_2) ys_2_4_2)))))) in
              (let rec h_2_3_4 = ' ' in
                (fun ys_2_4_3 -> 
                  (`LH_C(h_2_3_4, ((mappend_lh__d8 t_2_4_1) ys_2_4_3)))))) in
              (let rec h_2_3_5 = ' ' in
                (fun ys_2_4_4 -> 
                  (`LH_C(h_2_3_5, ((mappend_lh__d8 t_2_4_0) ys_2_4_4)))))) in
              (let rec h_2_3_6 = ' ' in
                (fun ys_2_4_5 -> 
                  (`LH_C(h_2_3_6, ((mappend_lh__d8 t_2_3_9) ys_2_4_5)))))) in
              (let rec h_2_3_7 = ' ' in
                (fun ys_2_4_6 -> 
                  (`LH_C(h_2_3_7, ((mappend_lh__d8 t_2_3_8) ys_2_4_6)))))) in
              (let rec h_2_3_8 = ' ' in
                (fun ys_2_4_7 -> 
                  (`LH_C(h_2_3_8, ((mappend_lh__d8 t_2_3_7) ys_2_4_7)))))) in
              (let rec h_2_3_9 = ' ' in
                (fun ys_2_4_8 -> 
                  (`LH_C(h_2_3_9, ((mappend_lh__d8 t_2_3_6) ys_2_4_8)))))) in
              (let rec h_2_4_0 = ' ' in
                (fun ys_2_4_9 -> 
                  (`LH_C(h_2_4_0, ((mappend_lh__d8 t_2_3_5) ys_2_4_9)))))) in
              (let rec h_2_4_1 = ' ' in
                (fun ys_2_5_0 -> 
                  (`LH_C(h_2_4_1, ((mappend_lh__d8 t_2_3_4) ys_2_5_0)))))) in
              (let rec h_2_4_2 = ' ' in
                (fun ys_2_5_1 -> 
                  (`LH_C(h_2_4_2, ((mappend_lh__d8 t_2_3_3) ys_2_5_1)))))) in
              (let rec h_2_4_3 = ' ' in
                (fun ys_2_5_2 -> 
                  (`LH_C(h_2_4_3, ((mappend_lh__d8 t_2_3_2) ys_2_5_2)))))) in
              (let rec h_2_4_4 = ' ' in
                (fun ys_2_5_3 -> 
                  (`LH_C(h_2_4_4, ((mappend_lh__d8 t_2_3_1) ys_2_5_3)))))) in
              (let rec h_2_4_5 = ' ' in
                (fun ys_2_5_4 -> 
                  (`LH_C(h_2_4_5, ((mappend_lh__d8 t_2_3_0) ys_2_5_4)))))) in
              (let rec h_2_4_6 = ' ' in
                (fun ys_2_5_5 -> 
                  (`LH_C(h_2_4_6, ((mappend_lh__d8 t_2_2_9) ys_2_5_5)))))) in
              (let rec h_2_4_7 = '|' in
                (fun ys_2_5_6 -> 
                  (`LH_C(h_2_4_7, ((mappend_lh__d8 t_2_2_8) ys_2_5_6)))))) in
              (let rec h_2_4_8 = ' ' in
                (fun ys_2_5_7 -> 
                  (`LH_C(h_2_4_8, ((mappend_lh__d8 t_2_2_7) ys_2_5_7)))))) in
              (let rec h_2_4_9 = ' ' in
                (fun ys_2_5_8 -> 
                  (`LH_C(h_2_4_9, ((mappend_lh__d8 t_2_2_6) ys_2_5_8)))))) in
              (let rec h_2_5_0 = ' ' in
                (fun ys_2_5_9 -> 
                  (`LH_C(h_2_5_0, ((mappend_lh__d8 t_2_2_5) ys_2_5_9)))))) in
              (let rec h_2_5_1 = ' ' in
                (fun ys_2_6_0 -> 
                  (`LH_C(h_2_5_1, ((mappend_lh__d8 t_2_2_4) ys_2_6_0)))))) in
              (let rec h_2_5_2 = ' ' in
                (fun ys_2_6_1 -> 
                  (`LH_C(h_2_5_2, ((mappend_lh__d8 t_2_2_3) ys_2_6_1)))))) in
              (let rec h_2_5_3 = ' ' in
                (fun ys_2_6_2 -> 
                  (`LH_C(h_2_5_3, ((mappend_lh__d8 t_2_2_2) ys_2_6_2)))))) in
              (let rec h_2_5_4 = ' ' in
                (fun ys_2_6_3 -> 
                  (`LH_C(h_2_5_4, ((mappend_lh__d8 t_2_2_1) ys_2_6_3)))))) in
              (let rec h_2_5_5 = ' ' in
                (fun ys_2_6_4 -> 
                  (`LH_C(h_2_5_5, ((mappend_lh__d8 t_2_2_0) ys_2_6_4)))))) in
              (let rec h_2_5_6 = ' ' in
                (fun ys_2_6_5 -> 
                  (`LH_C(h_2_5_6, ((mappend_lh__d8 t_2_1_9) ys_2_6_5))))))) _lh_writeItem_arg3_3)))) (larryPos_lh__d3 _lh_writeState_arg1_0)) _lh_funcomp_x_2))) (((writeItem_lh__d1 (fun _lh_writeItem_arg2_4 _lh_writeItem_arg3_4 -> 
      (match _lh_writeItem_arg2_4 with
        | `LeftBank -> 
          ((mappend_lh__d8 (let rec t_2_5_7 = (let rec t_2_5_8 = (let rec t_2_5_9 = (let rec t_2_6_0 = (let rec t_2_6_1 = (let rec t_2_6_2 = (let rec t_2_6_3 = (let rec t_2_6_4 = (let rec t_2_6_5 = (let rec t_2_6_6 = (let rec t_2_6_7 = (let rec t_2_6_8 = (let rec t_2_6_9 = (let rec t_2_7_0 = (let rec t_2_7_1 = (let rec t_2_7_2 = (let rec t_2_7_3 = (let rec t_2_7_4 = (let rec t_2_7_5 = (let rec t_2_7_6 = (let rec t_2_7_7 = (let rec t_2_7_8 = (let rec t_2_7_9 = (let rec t_2_8_0 = (let rec t_2_8_1 = (let rec t_2_8_2 = (let rec t_2_8_3 = (let rec t_2_8_4 = (let rec t_2_8_5 = (let rec t_2_8_6 = (let rec t_2_8_7 = (let rec t_2_8_8 = (fun ys_2_6_6 -> 
            ys_2_6_6) in
            (let rec h_2_5_7 = '|' in
              (fun ys_2_6_7 -> 
                (`LH_C(h_2_5_7, ((mappend_lh__d8 t_2_8_8) ys_2_6_7)))))) in
            (let rec h_2_5_8 = '|' in
              (fun ys_2_6_8 -> 
                (`LH_C(h_2_5_8, ((mappend_lh__d8 t_2_8_7) ys_2_6_8)))))) in
            (let rec h_2_5_9 = ' ' in
              (fun ys_2_6_9 -> 
                (`LH_C(h_2_5_9, ((mappend_lh__d8 t_2_8_6) ys_2_6_9)))))) in
            (let rec h_2_6_0 = ' ' in
              (fun ys_2_7_0 -> 
                (`LH_C(h_2_6_0, ((mappend_lh__d8 t_2_8_5) ys_2_7_0)))))) in
            (let rec h_2_6_1 = ' ' in
              (fun ys_2_7_1 -> 
                (`LH_C(h_2_6_1, ((mappend_lh__d8 t_2_8_4) ys_2_7_1)))))) in
            (let rec h_2_6_2 = ' ' in
              (fun ys_2_7_2 -> 
                (`LH_C(h_2_6_2, ((mappend_lh__d8 t_2_8_3) ys_2_7_2)))))) in
            (let rec h_2_6_3 = ' ' in
              (fun ys_2_7_3 -> 
                (`LH_C(h_2_6_3, ((mappend_lh__d8 t_2_8_2) ys_2_7_3)))))) in
            (let rec h_2_6_4 = ' ' in
              (fun ys_2_7_4 -> 
                (`LH_C(h_2_6_4, ((mappend_lh__d8 t_2_8_1) ys_2_7_4)))))) in
            (let rec h_2_6_5 = ' ' in
              (fun ys_2_7_5 -> 
                (`LH_C(h_2_6_5, ((mappend_lh__d8 t_2_8_0) ys_2_7_5)))))) in
            (let rec h_2_6_6 = ' ' in
              (fun ys_2_7_6 -> 
                (`LH_C(h_2_6_6, ((mappend_lh__d8 t_2_7_9) ys_2_7_6)))))) in
            (let rec h_2_6_7 = ' ' in
              (fun ys_2_7_7 -> 
                (`LH_C(h_2_6_7, ((mappend_lh__d8 t_2_7_8) ys_2_7_7)))))) in
            (let rec h_2_6_8 = ' ' in
              (fun ys_2_7_8 -> 
                (`LH_C(h_2_6_8, ((mappend_lh__d8 t_2_7_7) ys_2_7_8)))))) in
            (let rec h_2_6_9 = ' ' in
              (fun ys_2_7_9 -> 
                (`LH_C(h_2_6_9, ((mappend_lh__d8 t_2_7_6) ys_2_7_9)))))) in
            (let rec h_2_7_0 = ' ' in
              (fun ys_2_8_0 -> 
                (`LH_C(h_2_7_0, ((mappend_lh__d8 t_2_7_5) ys_2_8_0)))))) in
            (let rec h_2_7_1 = ' ' in
              (fun ys_2_8_1 -> 
                (`LH_C(h_2_7_1, ((mappend_lh__d8 t_2_7_4) ys_2_8_1)))))) in
            (let rec h_2_7_2 = ' ' in
              (fun ys_2_8_2 -> 
                (`LH_C(h_2_7_2, ((mappend_lh__d8 t_2_7_3) ys_2_8_2)))))) in
            (let rec h_2_7_3 = ' ' in
              (fun ys_2_8_3 -> 
                (`LH_C(h_2_7_3, ((mappend_lh__d8 t_2_7_2) ys_2_8_3)))))) in
            (let rec h_2_7_4 = ' ' in
              (fun ys_2_8_4 -> 
                (`LH_C(h_2_7_4, ((mappend_lh__d8 t_2_7_1) ys_2_8_4)))))) in
            (let rec h_2_7_5 = ' ' in
              (fun ys_2_8_5 -> 
                (`LH_C(h_2_7_5, ((mappend_lh__d8 t_2_7_0) ys_2_8_5)))))) in
            (let rec h_2_7_6 = ' ' in
              (fun ys_2_8_6 -> 
                (`LH_C(h_2_7_6, ((mappend_lh__d8 t_2_6_9) ys_2_8_6)))))) in
            (let rec h_2_7_7 = ' ' in
              (fun ys_2_8_7 -> 
                (`LH_C(h_2_7_7, ((mappend_lh__d8 t_2_6_8) ys_2_8_7)))))) in
            (let rec h_2_7_8 = ' ' in
              (fun ys_2_8_8 -> 
                (`LH_C(h_2_7_8, ((mappend_lh__d8 t_2_6_7) ys_2_8_8)))))) in
            (let rec h_2_7_9 = '|' in
              (fun ys_2_8_9 -> 
                (`LH_C(h_2_7_9, ((mappend_lh__d8 t_2_6_6) ys_2_8_9)))))) in
            (let rec h_2_8_0 = ' ' in
              (fun ys_2_9_0 -> 
                (`LH_C(h_2_8_0, ((mappend_lh__d8 t_2_6_5) ys_2_9_0)))))) in
            (let rec h_2_8_1 = 'm' in
              (fun ys_2_9_1 -> 
                (`LH_C(h_2_8_1, ((mappend_lh__d8 t_2_6_4) ys_2_9_1)))))) in
            (let rec h_2_8_2 = 'a' in
              (fun ys_2_9_2 -> 
                (`LH_C(h_2_8_2, ((mappend_lh__d8 t_2_6_3) ys_2_9_2)))))) in
            (let rec h_2_8_3 = 'd' in
              (fun ys_2_9_3 -> 
                (`LH_C(h_2_8_3, ((mappend_lh__d8 t_2_6_2) ys_2_9_3)))))) in
            (let rec h_2_8_4 = 'A' in
              (fun ys_2_9_4 -> 
                (`LH_C(h_2_8_4, ((mappend_lh__d8 t_2_6_1) ys_2_9_4)))))) in
            (let rec h_2_8_5 = ' ' in
              (fun ys_2_9_5 -> 
                (`LH_C(h_2_8_5, ((mappend_lh__d8 t_2_6_0) ys_2_9_5)))))) in
            (let rec h_2_8_6 = ' ' in
              (fun ys_2_9_6 -> 
                (`LH_C(h_2_8_6, ((mappend_lh__d8 t_2_5_9) ys_2_9_6)))))) in
            (let rec h_2_8_7 = ' ' in
              (fun ys_2_9_7 -> 
                (`LH_C(h_2_8_7, ((mappend_lh__d8 t_2_5_8) ys_2_9_7)))))) in
            (let rec h_2_8_8 = ' ' in
              (fun ys_2_9_8 -> 
                (`LH_C(h_2_8_8, ((mappend_lh__d8 t_2_5_7) ys_2_9_8))))))) _lh_writeItem_arg3_4)
        | `RightBank -> 
          ((mappend_lh__d8 (let rec t_2_8_9 = (let rec t_2_9_0 = (let rec t_2_9_1 = (let rec t_2_9_2 = (let rec t_2_9_3 = (let rec t_2_9_4 = (let rec t_2_9_5 = (let rec t_2_9_6 = (let rec t_2_9_7 = (let rec t_2_9_8 = (let rec t_2_9_9 = (let rec t_3_0_0 = (let rec t_3_0_1 = (let rec t_3_0_2 = (let rec t_3_0_3 = (let rec t_3_0_4 = (let rec t_3_0_5 = (let rec t_3_0_6 = (let rec t_3_0_7 = (let rec t_3_0_8 = (let rec t_3_0_9 = (let rec t_3_1_0 = (let rec t_3_1_1 = (let rec t_3_1_2 = (let rec t_3_1_3 = (let rec t_3_1_4 = (let rec t_3_1_5 = (let rec t_3_1_6 = (let rec t_3_1_7 = (let rec t_3_1_8 = (let rec t_3_1_9 = (let rec t_3_2_0 = (let rec t_3_2_1 = (let rec t_3_2_2 = (let rec t_3_2_3 = (let rec t_3_2_4 = (let rec t_3_2_5 = (fun ys_2_9_9 -> 
            ys_2_9_9) in
            (let rec h_2_8_9 = '|' in
              (fun ys_3_0_0 -> 
                (`LH_C(h_2_8_9, ((mappend_lh__d8 t_3_2_5) ys_3_0_0)))))) in
            (let rec h_2_9_0 = 'm' in
              (fun ys_3_0_1 -> 
                (`LH_C(h_2_9_0, ((mappend_lh__d8 t_3_2_4) ys_3_0_1)))))) in
            (let rec h_2_9_1 = 'a' in
              (fun ys_3_0_2 -> 
                (`LH_C(h_2_9_1, ((mappend_lh__d8 t_3_2_3) ys_3_0_2)))))) in
            (let rec h_2_9_2 = 'd' in
              (fun ys_3_0_3 -> 
                (`LH_C(h_2_9_2, ((mappend_lh__d8 t_3_2_2) ys_3_0_3)))))) in
            (let rec h_2_9_3 = 'A' in
              (fun ys_3_0_4 -> 
                (`LH_C(h_2_9_3, ((mappend_lh__d8 t_3_2_1) ys_3_0_4)))))) in
            (let rec h_2_9_4 = ' ' in
              (fun ys_3_0_5 -> 
                (`LH_C(h_2_9_4, ((mappend_lh__d8 t_3_2_0) ys_3_0_5)))))) in
            (let rec h_2_9_5 = '|' in
              (fun ys_3_0_6 -> 
                (`LH_C(h_2_9_5, ((mappend_lh__d8 t_3_1_9) ys_3_0_6)))))) in
            (let rec h_2_9_6 = ' ' in
              (fun ys_3_0_7 -> 
                (`LH_C(h_2_9_6, ((mappend_lh__d8 t_3_1_8) ys_3_0_7)))))) in
            (let rec h_2_9_7 = ' ' in
              (fun ys_3_0_8 -> 
                (`LH_C(h_2_9_7, ((mappend_lh__d8 t_3_1_7) ys_3_0_8)))))) in
            (let rec h_2_9_8 = ' ' in
              (fun ys_3_0_9 -> 
                (`LH_C(h_2_9_8, ((mappend_lh__d8 t_3_1_6) ys_3_0_9)))))) in
            (let rec h_2_9_9 = ' ' in
              (fun ys_3_1_0 -> 
                (`LH_C(h_2_9_9, ((mappend_lh__d8 t_3_1_5) ys_3_1_0)))))) in
            (let rec h_3_0_0 = ' ' in
              (fun ys_3_1_1 -> 
                (`LH_C(h_3_0_0, ((mappend_lh__d8 t_3_1_4) ys_3_1_1)))))) in
            (let rec h_3_0_1 = ' ' in
              (fun ys_3_1_2 -> 
                (`LH_C(h_3_0_1, ((mappend_lh__d8 t_3_1_3) ys_3_1_2)))))) in
            (let rec h_3_0_2 = ' ' in
              (fun ys_3_1_3 -> 
                (`LH_C(h_3_0_2, ((mappend_lh__d8 t_3_1_2) ys_3_1_3)))))) in
            (let rec h_3_0_3 = ' ' in
              (fun ys_3_1_4 -> 
                (`LH_C(h_3_0_3, ((mappend_lh__d8 t_3_1_1) ys_3_1_4)))))) in
            (let rec h_3_0_4 = ' ' in
              (fun ys_3_1_5 -> 
                (`LH_C(h_3_0_4, ((mappend_lh__d8 t_3_1_0) ys_3_1_5)))))) in
            (let rec h_3_0_5 = ' ' in
              (fun ys_3_1_6 -> 
                (`LH_C(h_3_0_5, ((mappend_lh__d8 t_3_0_9) ys_3_1_6)))))) in
            (let rec h_3_0_6 = ' ' in
              (fun ys_3_1_7 -> 
                (`LH_C(h_3_0_6, ((mappend_lh__d8 t_3_0_8) ys_3_1_7)))))) in
            (let rec h_3_0_7 = ' ' in
              (fun ys_3_1_8 -> 
                (`LH_C(h_3_0_7, ((mappend_lh__d8 t_3_0_7) ys_3_1_8)))))) in
            (let rec h_3_0_8 = ' ' in
              (fun ys_3_1_9 -> 
                (`LH_C(h_3_0_8, ((mappend_lh__d8 t_3_0_6) ys_3_1_9)))))) in
            (let rec h_3_0_9 = ' ' in
              (fun ys_3_2_0 -> 
                (`LH_C(h_3_0_9, ((mappend_lh__d8 t_3_0_5) ys_3_2_0)))))) in
            (let rec h_3_1_0 = ' ' in
              (fun ys_3_2_1 -> 
                (`LH_C(h_3_1_0, ((mappend_lh__d8 t_3_0_4) ys_3_2_1)))))) in
            (let rec h_3_1_1 = ' ' in
              (fun ys_3_2_2 -> 
                (`LH_C(h_3_1_1, ((mappend_lh__d8 t_3_0_3) ys_3_2_2)))))) in
            (let rec h_3_1_2 = ' ' in
              (fun ys_3_2_3 -> 
                (`LH_C(h_3_1_2, ((mappend_lh__d8 t_3_0_2) ys_3_2_3)))))) in
            (let rec h_3_1_3 = ' ' in
              (fun ys_3_2_4 -> 
                (`LH_C(h_3_1_3, ((mappend_lh__d8 t_3_0_1) ys_3_2_4)))))) in
            (let rec h_3_1_4 = ' ' in
              (fun ys_3_2_5 -> 
                (`LH_C(h_3_1_4, ((mappend_lh__d8 t_3_0_0) ys_3_2_5)))))) in
            (let rec h_3_1_5 = ' ' in
              (fun ys_3_2_6 -> 
                (`LH_C(h_3_1_5, ((mappend_lh__d8 t_2_9_9) ys_3_2_6)))))) in
            (let rec h_3_1_6 = '|' in
              (fun ys_3_2_7 -> 
                (`LH_C(h_3_1_6, ((mappend_lh__d8 t_2_9_8) ys_3_2_7)))))) in
            (let rec h_3_1_7 = ' ' in
              (fun ys_3_2_8 -> 
                (`LH_C(h_3_1_7, ((mappend_lh__d8 t_2_9_7) ys_3_2_8)))))) in
            (let rec h_3_1_8 = ' ' in
              (fun ys_3_2_9 -> 
                (`LH_C(h_3_1_8, ((mappend_lh__d8 t_2_9_6) ys_3_2_9)))))) in
            (let rec h_3_1_9 = ' ' in
              (fun ys_3_3_0 -> 
                (`LH_C(h_3_1_9, ((mappend_lh__d8 t_2_9_5) ys_3_3_0)))))) in
            (let rec h_3_2_0 = ' ' in
              (fun ys_3_3_1 -> 
                (`LH_C(h_3_2_0, ((mappend_lh__d8 t_2_9_4) ys_3_3_1)))))) in
            (let rec h_3_2_1 = ' ' in
              (fun ys_3_3_2 -> 
                (`LH_C(h_3_2_1, ((mappend_lh__d8 t_2_9_3) ys_3_3_2)))))) in
            (let rec h_3_2_2 = ' ' in
              (fun ys_3_3_3 -> 
                (`LH_C(h_3_2_2, ((mappend_lh__d8 t_2_9_2) ys_3_3_3)))))) in
            (let rec h_3_2_3 = ' ' in
              (fun ys_3_3_4 -> 
                (`LH_C(h_3_2_3, ((mappend_lh__d8 t_2_9_1) ys_3_3_4)))))) in
            (let rec h_3_2_4 = ' ' in
              (fun ys_3_3_5 -> 
                (`LH_C(h_3_2_4, ((mappend_lh__d8 t_2_9_0) ys_3_3_5)))))) in
            (let rec h_3_2_5 = ' ' in
              (fun ys_3_3_6 -> 
                (`LH_C(h_3_2_5, ((mappend_lh__d8 t_2_8_9) ys_3_3_6))))))) _lh_writeItem_arg3_4)))) (adamPos_lh__d3 _lh_writeState_arg1_0)) _lh_funcomp_x_1))) ((fun s_1 -> 
    ((mappend_lh__d8 (let rec t_3_2_6 = (let rec t_3_2_7 = (let rec t_3_2_8 = (let rec t_3_2_9 = (let rec t_3_3_0 = (let rec t_3_3_1 = (let rec t_3_3_2 = (let rec t_3_3_3 = (let rec t_3_3_4 = (let rec t_3_3_5 = (let rec t_3_3_6 = (let rec t_3_3_7 = (let rec t_3_3_8 = (let rec t_3_3_9 = (let rec t_3_4_0 = (let rec t_3_4_1 = (let rec t_3_4_2 = (let rec t_3_4_3 = (let rec t_3_4_4 = (let rec t_3_4_5 = (let rec t_3_4_6 = (let rec t_3_4_7 = (let rec t_3_4_8 = (let rec t_3_4_9 = (let rec t_3_5_0 = (let rec t_3_5_1 = (let rec t_3_5_2 = (let rec t_3_5_3 = (let rec t_3_5_4 = (let rec t_3_5_5 = (let rec t_3_5_6 = (let rec t_3_5_7 = (let rec t_3_5_8 = (let rec t_3_5_9 = (let rec t_3_6_0 = (let rec t_3_6_1 = (let rec t_3_6_2 = (let rec t_3_6_3 = (let rec t_3_6_4 = (let rec t_3_6_5 = (let rec t_3_6_6 = (fun ys_3_3_7 -> 
      ys_3_3_7) in
      (let rec h_3_2_6 = '|' in
        (fun ys_3_3_8 -> 
          (`LH_C(h_3_2_6, ((mappend_lh__d8 t_3_6_6) ys_3_3_8)))))) in
      (let rec h_3_2_7 = '-' in
        (fun ys_3_3_9 -> 
          (`LH_C(h_3_2_7, ((mappend_lh__d8 t_3_6_5) ys_3_3_9)))))) in
      (let rec h_3_2_8 = '-' in
        (fun ys_3_4_0 -> 
          (`LH_C(h_3_2_8, ((mappend_lh__d8 t_3_6_4) ys_3_4_0)))))) in
      (let rec h_3_2_9 = '-' in
        (fun ys_3_4_1 -> 
          (`LH_C(h_3_2_9, ((mappend_lh__d8 t_3_6_3) ys_3_4_1)))))) in
      (let rec h_3_3_0 = '-' in
        (fun ys_3_4_2 -> 
          (`LH_C(h_3_3_0, ((mappend_lh__d8 t_3_6_2) ys_3_4_2)))))) in
      (let rec h_3_3_1 = '-' in
        (fun ys_3_4_3 -> 
          (`LH_C(h_3_3_1, ((mappend_lh__d8 t_3_6_1) ys_3_4_3)))))) in
      (let rec h_3_3_2 = '-' in
        (fun ys_3_4_4 -> 
          (`LH_C(h_3_3_2, ((mappend_lh__d8 t_3_6_0) ys_3_4_4)))))) in
      (let rec h_3_3_3 = '-' in
        (fun ys_3_4_5 -> 
          (`LH_C(h_3_3_3, ((mappend_lh__d8 t_3_5_9) ys_3_4_5)))))) in
      (let rec h_3_3_4 = '-' in
        (fun ys_3_4_6 -> 
          (`LH_C(h_3_3_4, ((mappend_lh__d8 t_3_5_8) ys_3_4_6)))))) in
      (let rec h_3_3_5 = '-' in
        (fun ys_3_4_7 -> 
          (`LH_C(h_3_3_5, ((mappend_lh__d8 t_3_5_7) ys_3_4_7)))))) in
      (let rec h_3_3_6 = '-' in
        (fun ys_3_4_8 -> 
          (`LH_C(h_3_3_6, ((mappend_lh__d8 t_3_5_6) ys_3_4_8)))))) in
      (let rec h_3_3_7 = '-' in
        (fun ys_3_4_9 -> 
          (`LH_C(h_3_3_7, ((mappend_lh__d8 t_3_5_5) ys_3_4_9)))))) in
      (let rec h_3_3_8 = '-' in
        (fun ys_3_5_0 -> 
          (`LH_C(h_3_3_8, ((mappend_lh__d8 t_3_5_4) ys_3_5_0)))))) in
      (let rec h_3_3_9 = '-' in
        (fun ys_3_5_1 -> 
          (`LH_C(h_3_3_9, ((mappend_lh__d8 t_3_5_3) ys_3_5_1)))))) in
      (let rec h_3_4_0 = '-' in
        (fun ys_3_5_2 -> 
          (`LH_C(h_3_4_0, ((mappend_lh__d8 t_3_5_2) ys_3_5_2)))))) in
      (let rec h_3_4_1 = '-' in
        (fun ys_3_5_3 -> 
          (`LH_C(h_3_4_1, ((mappend_lh__d8 t_3_5_1) ys_3_5_3)))))) in
      (let rec h_3_4_2 = '-' in
        (fun ys_3_5_4 -> 
          (`LH_C(h_3_4_2, ((mappend_lh__d8 t_3_5_0) ys_3_5_4)))))) in
      (let rec h_3_4_3 = '-' in
        (fun ys_3_5_5 -> 
          (`LH_C(h_3_4_3, ((mappend_lh__d8 t_3_4_9) ys_3_5_5)))))) in
      (let rec h_3_4_4 = '-' in
        (fun ys_3_5_6 -> 
          (`LH_C(h_3_4_4, ((mappend_lh__d8 t_3_4_8) ys_3_5_6)))))) in
      (let rec h_3_4_5 = '-' in
        (fun ys_3_5_7 -> 
          (`LH_C(h_3_4_5, ((mappend_lh__d8 t_3_4_7) ys_3_5_7)))))) in
      (let rec h_3_4_6 = '-' in
        (fun ys_3_5_8 -> 
          (`LH_C(h_3_4_6, ((mappend_lh__d8 t_3_4_6) ys_3_5_8)))))) in
      (let rec h_3_4_7 = '-' in
        (fun ys_3_5_9 -> 
          (`LH_C(h_3_4_7, ((mappend_lh__d8 t_3_4_5) ys_3_5_9)))))) in
      (let rec h_3_4_8 = '-' in
        (fun ys_3_6_0 -> 
          (`LH_C(h_3_4_8, ((mappend_lh__d8 t_3_4_4) ys_3_6_0)))))) in
      (let rec h_3_4_9 = '-' in
        (fun ys_3_6_1 -> 
          (`LH_C(h_3_4_9, ((mappend_lh__d8 t_3_4_3) ys_3_6_1)))))) in
      (let rec h_3_5_0 = '-' in
        (fun ys_3_6_2 -> 
          (`LH_C(h_3_5_0, ((mappend_lh__d8 t_3_4_2) ys_3_6_2)))))) in
      (let rec h_3_5_1 = '-' in
        (fun ys_3_6_3 -> 
          (`LH_C(h_3_5_1, ((mappend_lh__d8 t_3_4_1) ys_3_6_3)))))) in
      (let rec h_3_5_2 = '-' in
        (fun ys_3_6_4 -> 
          (`LH_C(h_3_5_2, ((mappend_lh__d8 t_3_4_0) ys_3_6_4)))))) in
      (let rec h_3_5_3 = '-' in
        (fun ys_3_6_5 -> 
          (`LH_C(h_3_5_3, ((mappend_lh__d8 t_3_3_9) ys_3_6_5)))))) in
      (let rec h_3_5_4 = '-' in
        (fun ys_3_6_6 -> 
          (`LH_C(h_3_5_4, ((mappend_lh__d8 t_3_3_8) ys_3_6_6)))))) in
      (let rec h_3_5_5 = '-' in
        (fun ys_3_6_7 -> 
          (`LH_C(h_3_5_5, ((mappend_lh__d8 t_3_3_7) ys_3_6_7)))))) in
      (let rec h_3_5_6 = '-' in
        (fun ys_3_6_8 -> 
          (`LH_C(h_3_5_6, ((mappend_lh__d8 t_3_3_6) ys_3_6_8)))))) in
      (let rec h_3_5_7 = '-' in
        (fun ys_3_6_9 -> 
          (`LH_C(h_3_5_7, ((mappend_lh__d8 t_3_3_5) ys_3_6_9)))))) in
      (let rec h_3_5_8 = '-' in
        (fun ys_3_7_0 -> 
          (`LH_C(h_3_5_8, ((mappend_lh__d8 t_3_3_4) ys_3_7_0)))))) in
      (let rec h_3_5_9 = '-' in
        (fun ys_3_7_1 -> 
          (`LH_C(h_3_5_9, ((mappend_lh__d8 t_3_3_3) ys_3_7_1)))))) in
      (let rec h_3_6_0 = '-' in
        (fun ys_3_7_2 -> 
          (`LH_C(h_3_6_0, ((mappend_lh__d8 t_3_3_2) ys_3_7_2)))))) in
      (let rec h_3_6_1 = '-' in
        (fun ys_3_7_3 -> 
          (`LH_C(h_3_6_1, ((mappend_lh__d8 t_3_3_1) ys_3_7_3)))))) in
      (let rec h_3_6_2 = '-' in
        (fun ys_3_7_4 -> 
          (`LH_C(h_3_6_2, ((mappend_lh__d8 t_3_3_0) ys_3_7_4)))))) in
      (let rec h_3_6_3 = '-' in
        (fun ys_3_7_5 -> 
          (`LH_C(h_3_6_3, ((mappend_lh__d8 t_3_2_9) ys_3_7_5)))))) in
      (let rec h_3_6_4 = '-' in
        (fun ys_3_7_6 -> 
          (`LH_C(h_3_6_4, ((mappend_lh__d8 t_3_2_8) ys_3_7_6)))))) in
      (let rec h_3_6_5 = '-' in
        (fun ys_3_7_7 -> 
          (`LH_C(h_3_6_5, ((mappend_lh__d8 t_3_2_7) ys_3_7_7)))))) in
      (let rec h_3_6_6 = '-' in
        (fun ys_3_7_8 -> 
          (`LH_C(h_3_6_6, ((mappend_lh__d8 t_3_2_6) ys_3_7_8))))))) s_1)) _lh_funcomp_x_0));;
let rec mappend_lh__d6 xs_6 ys_3_7_9 =
  (xs_6 ys_3_7_9);;
let rec totalTime_lh__d3 _lh_totalTime_arg1_1 =
  (match _lh_totalTime_arg1_1 with
    | `LH_C(_lh_totalTime_LH_C_0_1, _lh_totalTime_LH_C_1_1) -> 
      (match _lh_totalTime_LH_C_0_1 with
        | `LH_P2(_lh_totalTime_LH_P2_0_1, _lh_totalTime_LH_P2_1_1) -> 
          _lh_totalTime_LH_P2_0_1));;
let rec writeHistory_lh__d1 _lh_writeHistory_arg1_0 =
  (match _lh_writeHistory_arg1_0 with
    | `LH_N -> 
      (fun x_0 -> 
        x_0)
    | _ -> 
      (((foldr_lh__d1 (fun timestate_0 acc_0 -> 
        (let rec _lh_matchIdent_0 = timestate_0 in
          (match _lh_matchIdent_0 with
            | `LH_P2(_lh_writeHistory_LH_P2_0_0, _lh_writeHistory_LH_P2_1_0) -> 
              (fun _lh_funcomp_x_5 -> 
                ((fun _lh_funcomp_x_6 -> 
                  ((fun _lh_funcomp_x_7 -> 
                    ((fun _lh_funcomp_x_8 -> 
                      ((fun x_1 -> 
                        ((mappend_lh__d6 (let rec t_3_6_9 = (let rec t_3_7_0 = (let rec t_3_7_1 = (let rec t_3_7_2 = (let rec t_3_7_3 = (let rec t_3_7_4 = (fun ys_3_8_2 -> 
                          ys_3_8_2) in
                          (let rec h_3_6_9 = ' ' in
                            (fun ys_3_8_3 -> 
                              (`LH_C(h_3_6_9, ((mappend_lh__d6 t_3_7_4) ys_3_8_3)))))) in
                          (let rec h_3_7_0 = ':' in
                            (fun ys_3_8_4 -> 
                              (`LH_C(h_3_7_0, ((mappend_lh__d6 t_3_7_3) ys_3_8_4)))))) in
                          (let rec h_3_7_1 = 'e' in
                            (fun ys_3_8_5 -> 
                              (`LH_C(h_3_7_1, ((mappend_lh__d6 t_3_7_2) ys_3_8_5)))))) in
                          (let rec h_3_7_2 = 'm' in
                            (fun ys_3_8_6 -> 
                              (`LH_C(h_3_7_2, ((mappend_lh__d6 t_3_7_1) ys_3_8_6)))))) in
                          (let rec h_3_7_3 = 'i' in
                            (fun ys_3_8_7 -> 
                              (`LH_C(h_3_7_3, ((mappend_lh__d6 t_3_7_0) ys_3_8_7)))))) in
                          (let rec h_3_7_4 = 'T' in
                            (fun ys_3_8_8 -> 
                              (`LH_C(h_3_7_4, ((mappend_lh__d6 t_3_6_9) ys_3_8_8))))))) x_1)) ((fun x_2 -> 
                        ((mappend_lh__d7 (string_of_int ((totalTime_lh__d3 _lh_writeHistory_arg1_0) - _lh_writeHistory_LH_P2_0_0))) x_2)) _lh_funcomp_x_8))) ((fun x_3 -> 
                      (`LH_C('|', x_3))) _lh_funcomp_x_7))) ((writeState_lh__d1 _lh_writeHistory_LH_P2_1_0) _lh_funcomp_x_6))) (acc_0 _lh_funcomp_x_5))))))) (fun x_4 -> 
        x_4)) _lh_writeHistory_arg1_0));;
let rec totalTime_lh__d1 _lh_totalTime_arg1_2 =
  (match _lh_totalTime_arg1_2 with
    | `LH_C(_lh_totalTime_LH_C_0_2, _lh_totalTime_LH_C_1_2) -> 
      (match _lh_totalTime_LH_C_0_2 with
        | `LH_P2(_lh_totalTime_LH_P2_0_2, _lh_totalTime_LH_P2_1_2) -> 
          _lh_totalTime_LH_P2_0_2));;
let rec reverse_lh__d1 ls_4 =
  ((reverse_helper_lh__d1 ls_4) (fun _lh_writeSolutions_arg2_5 x_1_5 -> 
    x_1_5));;
let rec minSolutions_lh__d1 _lh_minSolutions_arg1_0 =
  (match _lh_minSolutions_arg1_0 with
    | `LH_N -> 
      (fun _lh_writeSolutions_arg2_1 x_5 -> 
        x_5)
    | `LH_C(_lh_minSolutions_LH_C_0_0, _lh_minSolutions_LH_C_1_0) -> 
      (let rec minAcc_0 = (fun minSoFar_0 mins_0 ls_3 -> 
        (let rec _lh_matchIdent_3 = ls_3 in
          (match _lh_matchIdent_3 with
            | `LH_N -> 
              mins_0
            | `LH_C(_lh_minSolutions_LH_C_0_1, _lh_minSolutions_LH_C_1_1) -> 
              (let rec total_0 = (totalTime_lh__d1 _lh_minSolutions_LH_C_0_1) in
                (if (minSoFar_0 < total_0) then
                  (((minAcc_0 minSoFar_0) mins_0) _lh_minSolutions_LH_C_1_1)
                else
                  (if (minSoFar_0 = total_0) then
                    (((minAcc_0 minSoFar_0) (let rec t_3_7_6 = mins_0 in
                      (let rec h_3_7_6 = _lh_minSolutions_LH_C_0_1 in
                        (fun a_1 -> 
                          ((reverse_helper_lh__d1 t_3_7_6) (let rec _lh_writeSolutions_LH_C_1_0 = a_1 in
                            (let rec _lh_writeSolutions_LH_C_0_0 = h_3_7_6 in
                              (fun _lh_writeSolutions_arg2_2 _lh_funcomp_x_9 -> 
                                ((fun _lh_funcomp_x_1_0 -> 
                                  ((fun _lh_funcomp_x_1_1 -> 
                                    ((fun _lh_funcomp_x_1_2 -> 
                                      ((fun x_6 -> 
                                        ((mappend_lh__d2 (let rec t_3_7_7 = (let rec t_3_7_8 = (let rec t_3_7_9 = (let rec t_3_8_0 = (let rec t_3_8_1 = (let rec t_3_8_2 = (let rec t_3_8_3 = (let rec t_3_8_4 = (let rec t_3_8_5 = (fun ys_3_8_9 -> 
                                          ys_3_8_9) in
                                          (let rec h_3_7_7 = ' ' in
                                            (fun ys_3_9_0 -> 
                                              (`LH_C(h_3_7_7, ((mappend_lh__d2 t_3_8_5) ys_3_9_0)))))) in
                                          (let rec h_3_7_8 = 'n' in
                                            (fun ys_3_9_1 -> 
                                              (`LH_C(h_3_7_8, ((mappend_lh__d2 t_3_8_4) ys_3_9_1)))))) in
                                          (let rec h_3_7_9 = 'o' in
                                            (fun ys_3_9_2 -> 
                                              (`LH_C(h_3_7_9, ((mappend_lh__d2 t_3_8_3) ys_3_9_2)))))) in
                                          (let rec h_3_8_0 = 'i' in
                                            (fun ys_3_9_3 -> 
                                              (`LH_C(h_3_8_0, ((mappend_lh__d2 t_3_8_2) ys_3_9_3)))))) in
                                          (let rec h_3_8_1 = 't' in
                                            (fun ys_3_9_4 -> 
                                              (`LH_C(h_3_8_1, ((mappend_lh__d2 t_3_8_1) ys_3_9_4)))))) in
                                          (let rec h_3_8_2 = 'u' in
                                            (fun ys_3_9_5 -> 
                                              (`LH_C(h_3_8_2, ((mappend_lh__d2 t_3_8_0) ys_3_9_5)))))) in
                                          (let rec h_3_8_3 = 'l' in
                                            (fun ys_3_9_6 -> 
                                              (`LH_C(h_3_8_3, ((mappend_lh__d2 t_3_7_9) ys_3_9_6)))))) in
                                          (let rec h_3_8_4 = 'o' in
                                            (fun ys_3_9_7 -> 
                                              (`LH_C(h_3_8_4, ((mappend_lh__d2 t_3_7_8) ys_3_9_7)))))) in
                                          (let rec h_3_8_5 = 'S' in
                                            (fun ys_3_9_8 -> 
                                              (`LH_C(h_3_8_5, ((mappend_lh__d2 t_3_7_7) ys_3_9_8))))))) x_6)) ((fun x_7 -> 
                                        ((mappend_lh__d3 (string_of_int _lh_writeSolutions_arg2_2)) x_7)) _lh_funcomp_x_1_2))) ((fun x_8 -> 
                                      (`LH_C('|', x_8))) _lh_funcomp_x_1_1))) ((writeHistory_lh__d1 _lh_writeSolutions_LH_C_0_0) _lh_funcomp_x_1_0))) (((writeSolutions_lh__d1 _lh_writeSolutions_LH_C_1_0) (_lh_writeSolutions_arg2_2 + 1)) _lh_funcomp_x_9)))))))))) _lh_minSolutions_LH_C_1_1)
                  else
                    (((minAcc_0 total_0) (let rec t_3_8_6 = (fun a_2 -> 
                      a_2) in
                      (let rec h_3_8_6 = _lh_minSolutions_LH_C_0_1 in
                        (fun a_3 -> 
                          ((reverse_helper_lh__d1 t_3_8_6) (let rec _lh_writeSolutions_LH_C_1_1 = a_3 in
                            (let rec _lh_writeSolutions_LH_C_0_1 = h_3_8_6 in
                              (fun _lh_writeSolutions_arg2_3 _lh_funcomp_x_1_3 -> 
                                ((fun _lh_funcomp_x_1_4 -> 
                                  ((fun _lh_funcomp_x_1_5 -> 
                                    ((fun _lh_funcomp_x_1_6 -> 
                                      ((fun x_9 -> 
                                        ((mappend_lh__d2 (let rec t_3_8_7 = (let rec t_3_8_8 = (let rec t_3_8_9 = (let rec t_3_9_0 = (let rec t_3_9_1 = (let rec t_3_9_2 = (let rec t_3_9_3 = (let rec t_3_9_4 = (let rec t_3_9_5 = (fun ys_3_9_9 -> 
                                          ys_3_9_9) in
                                          (let rec h_3_8_7 = ' ' in
                                            (fun ys_4_0_0 -> 
                                              (`LH_C(h_3_8_7, ((mappend_lh__d2 t_3_9_5) ys_4_0_0)))))) in
                                          (let rec h_3_8_8 = 'n' in
                                            (fun ys_4_0_1 -> 
                                              (`LH_C(h_3_8_8, ((mappend_lh__d2 t_3_9_4) ys_4_0_1)))))) in
                                          (let rec h_3_8_9 = 'o' in
                                            (fun ys_4_0_2 -> 
                                              (`LH_C(h_3_8_9, ((mappend_lh__d2 t_3_9_3) ys_4_0_2)))))) in
                                          (let rec h_3_9_0 = 'i' in
                                            (fun ys_4_0_3 -> 
                                              (`LH_C(h_3_9_0, ((mappend_lh__d2 t_3_9_2) ys_4_0_3)))))) in
                                          (let rec h_3_9_1 = 't' in
                                            (fun ys_4_0_4 -> 
                                              (`LH_C(h_3_9_1, ((mappend_lh__d2 t_3_9_1) ys_4_0_4)))))) in
                                          (let rec h_3_9_2 = 'u' in
                                            (fun ys_4_0_5 -> 
                                              (`LH_C(h_3_9_2, ((mappend_lh__d2 t_3_9_0) ys_4_0_5)))))) in
                                          (let rec h_3_9_3 = 'l' in
                                            (fun ys_4_0_6 -> 
                                              (`LH_C(h_3_9_3, ((mappend_lh__d2 t_3_8_9) ys_4_0_6)))))) in
                                          (let rec h_3_9_4 = 'o' in
                                            (fun ys_4_0_7 -> 
                                              (`LH_C(h_3_9_4, ((mappend_lh__d2 t_3_8_8) ys_4_0_7)))))) in
                                          (let rec h_3_9_5 = 'S' in
                                            (fun ys_4_0_8 -> 
                                              (`LH_C(h_3_9_5, ((mappend_lh__d2 t_3_8_7) ys_4_0_8))))))) x_9)) ((fun x_1_0 -> 
                                        ((mappend_lh__d3 (string_of_int _lh_writeSolutions_arg2_3)) x_1_0)) _lh_funcomp_x_1_6))) ((fun x_1_1 -> 
                                      (`LH_C('|', x_1_1))) _lh_funcomp_x_1_5))) ((writeHistory_lh__d1 _lh_writeSolutions_LH_C_0_1) _lh_funcomp_x_1_4))) (((writeSolutions_lh__d1 _lh_writeSolutions_LH_C_1_1) (_lh_writeSolutions_arg2_3 + 1)) _lh_funcomp_x_1_3)))))))))) _lh_minSolutions_LH_C_1_1))))))) in
        (reverse_lh__d1 (((minAcc_0 (totalTime_lh__d2 _lh_minSolutions_LH_C_0_0)) (let rec t_3_9_6 = (fun a_4 -> 
          a_4) in
          (let rec h_3_9_6 = _lh_minSolutions_LH_C_0_0 in
            (fun a_5 -> 
              ((reverse_helper_lh__d1 t_3_9_6) (let rec _lh_writeSolutions_LH_C_1_2 = a_5 in
                (let rec _lh_writeSolutions_LH_C_0_2 = h_3_9_6 in
                  (fun _lh_writeSolutions_arg2_4 _lh_funcomp_x_1_7 -> 
                    ((fun _lh_funcomp_x_1_8 -> 
                      ((fun _lh_funcomp_x_1_9 -> 
                        ((fun _lh_funcomp_x_2_0 -> 
                          ((fun x_1_2 -> 
                            ((mappend_lh__d2 (let rec t_3_9_7 = (let rec t_3_9_8 = (let rec t_3_9_9 = (let rec t_4_0_0 = (let rec t_4_0_1 = (let rec t_4_0_2 = (let rec t_4_0_3 = (let rec t_4_0_4 = (let rec t_4_0_5 = (fun ys_4_0_9 -> 
                              ys_4_0_9) in
                              (let rec h_3_9_7 = ' ' in
                                (fun ys_4_1_0 -> 
                                  (`LH_C(h_3_9_7, ((mappend_lh__d2 t_4_0_5) ys_4_1_0)))))) in
                              (let rec h_3_9_8 = 'n' in
                                (fun ys_4_1_1 -> 
                                  (`LH_C(h_3_9_8, ((mappend_lh__d2 t_4_0_4) ys_4_1_1)))))) in
                              (let rec h_3_9_9 = 'o' in
                                (fun ys_4_1_2 -> 
                                  (`LH_C(h_3_9_9, ((mappend_lh__d2 t_4_0_3) ys_4_1_2)))))) in
                              (let rec h_4_0_0 = 'i' in
                                (fun ys_4_1_3 -> 
                                  (`LH_C(h_4_0_0, ((mappend_lh__d2 t_4_0_2) ys_4_1_3)))))) in
                              (let rec h_4_0_1 = 't' in
                                (fun ys_4_1_4 -> 
                                  (`LH_C(h_4_0_1, ((mappend_lh__d2 t_4_0_1) ys_4_1_4)))))) in
                              (let rec h_4_0_2 = 'u' in
                                (fun ys_4_1_5 -> 
                                  (`LH_C(h_4_0_2, ((mappend_lh__d2 t_4_0_0) ys_4_1_5)))))) in
                              (let rec h_4_0_3 = 'l' in
                                (fun ys_4_1_6 -> 
                                  (`LH_C(h_4_0_3, ((mappend_lh__d2 t_3_9_9) ys_4_1_6)))))) in
                              (let rec h_4_0_4 = 'o' in
                                (fun ys_4_1_7 -> 
                                  (`LH_C(h_4_0_4, ((mappend_lh__d2 t_3_9_8) ys_4_1_7)))))) in
                              (let rec h_4_0_5 = 'S' in
                                (fun ys_4_1_8 -> 
                                  (`LH_C(h_4_0_5, ((mappend_lh__d2 t_3_9_7) ys_4_1_8))))))) x_1_2)) ((fun x_1_3 -> 
                            ((mappend_lh__d3 (string_of_int _lh_writeSolutions_arg2_4)) x_1_3)) _lh_funcomp_x_2_0))) ((fun x_1_4 -> 
                          (`LH_C('|', x_1_4))) _lh_funcomp_x_1_9))) ((writeHistory_lh__d1 _lh_writeSolutions_LH_C_0_2) _lh_funcomp_x_1_8))) (((writeSolutions_lh__d1 _lh_writeSolutions_LH_C_1_2) (_lh_writeSolutions_arg2_4 + 1)) _lh_funcomp_x_1_7)))))))))) _lh_minSolutions_LH_C_1_0))));;
let rec testPuzzle_nofib_lh__d1 _lh_testPuzzle_nofib_arg1_0 =
  (let rec time_0 = (if ((length_lh__d1 _lh_testPuzzle_nofib_arg1_0) = 1) then
    0
  else
    (failwith "msg"(`LH_C('p', (`LH_C('u', (`LH_C('z', (`LH_C('z', (`LH_C('l', (`LH_C('e', (`LH_C(' ', (`LH_C('e', (`LH_C('x', (`LH_C('p', (`LH_C('e', (`LH_C('c', (`LH_C('t', (`LH_C('s', (`LH_C(' ', (`LH_C('e', (`LH_C('x', (`LH_C('a', (`LH_C('c', (`LH_C('t', (`LH_C('l', (`LH_C('y', (`LH_C(' ', (`LH_C('o', (`LH_C('n', (`LH_C('e', (`LH_C(' ', (`LH_C('a', (`LH_C('r', (`LH_C('g', (`LH_C('u', (`LH_C('m', (`LH_C('e', (`LH_C('n', (`LH_C('t', (`LH_N))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) in
    (let rec solutions_0 = (((((transfer_lh__d1 initialState_lh__d1) finalState_lh__d1) (`RightBank)) time_0) (`LH_N)) in
      (let rec mins_1 = (minSolutions_lh__d1 solutions_0) in
        (((writeSolutions_lh__d1 mins_1) 1) (`LH_N)))));;
let run () = 1 + (Obj.magic ((testPuzzle_nofib_lh__d1 (`LH_C(2, (`LH_N))))));
end;;

