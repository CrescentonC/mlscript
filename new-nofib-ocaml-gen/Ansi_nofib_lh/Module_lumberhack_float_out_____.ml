

(* lumberhack_float_out *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack_float_out_____(LH_Dum: sig end): sig val run: unit -> int end = struct
let rec foldr_lh__d1 f_1 i_0 ls_2 =
  ((ls_2 f_1) i_0);;
let rec copy_lh__d1 _lh_copy_arg1_0 _lh_copy_arg2_0 _lh_floatOutId_0_0 _lh_floatOutId_1_0 =
  (if (_lh_copy_arg1_0 > 0) then
    (let rec t_4_4_7 = ((copy_lh__d1 (_lh_copy_arg1_0 - 1)) _lh_copy_arg2_0) in
      (let rec h_4_4_7 = _lh_copy_arg2_0 in
        ((_lh_floatOutId_0_0 h_4_4_7) (((foldr_lh__d1 _lh_floatOutId_0_0) _lh_floatOutId_1_0) t_4_4_7))))
  else
    _lh_floatOutId_1_0);;
let rec mappend_lh__d1_d5 xs_1_4 ys_4_9_4 =
  (match xs_1_4 with
    | `LH_C(h_4_8_6, t_4_8_6) -> 
      (`LH_C(h_4_8_6, ((mappend_lh__d1_d5 t_4_8_6) ys_4_9_4)))
    | `LH_N -> 
      ys_4_9_4);;
let rec goto_lh__d1 _lh_goto_arg1_1 _lh_goto_arg2_1 =
  (`LH_C('E', (`LH_C('[', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg2_1)) (`LH_C(';', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg1_1)) (`LH_C('H', (`LH_N)))))))))));;
let rec mappend_lh__d1_d3 xs_1_2 ys_4_5_8 =
  (xs_1_2 ys_4_5_8);;
let rec mappend_lh__d1_d4 xs_8 ys_4_5_2 =
  (xs_8 ys_4_5_2);;
let rec cls_lh__d1 ys_1 ys_2 =
  (let rec t_0 = (fun ys_0 -> 
    ys_0) in
    (let rec h_0 = 'L' in
      (let rec t_1 = ((mappend_lh__d1_d3 t_0) ys_1) in
        (let rec h_1 = h_0 in
          (`LH_C(h_1, ((mappend_lh__d1_d4 t_1) ys_2)))))));;
let rec at_lh__d2 _lh_at_arg1_0 _lh_at_arg2_0 =
  (_lh_at_arg1_0 _lh_at_arg2_0);;
let rec at_lh__d1 _lh_at_arg1_1 _lh_at_arg2_7 =
  (_lh_at_arg1_1 _lh_at_arg2_7);;
let rec mappend_lh__d5 xs_7 ys_4_5_1 =
  (xs_7 ys_4_5_1);;
let rec writeString_lh__d1 _lh_writeString_arg1_0 _lh_writeString_arg2_0 _lh_writeString_arg3_0 =
  ((mappend_lh__d5 _lh_writeString_arg1_0) (_lh_writeString_arg2_0 _lh_writeString_arg3_0));;
let rec writeString_lh__d4 _lh_writeString_arg1_2 _lh_writeString_arg2_2 _lh_writeString_arg3_2 =
  ((mappend_lh__d1_d5 _lh_writeString_arg1_2) (_lh_writeString_arg2_2 _lh_writeString_arg3_2));;
let rec writeAt_lh__d3 _lh_writeAt_arg1_0 _lh_writeAt_arg2_3 =
  (_lh_writeAt_arg1_0 _lh_writeAt_arg2_3);;
let rec mappend_lh__d9 xs_1_3 ys_4_5_9 =
  (match xs_1_3 with
    | `LH_C(h_4_5_3, t_4_5_3) -> 
      (let rec t_4_5_4 = ((mappend_lh__d9 t_4_5_3) ys_4_5_9) in
        (let rec h_4_5_4 = h_4_5_3 in
          (fun ys_4_6_0 -> 
            (let rec t_4_5_5 = ((mappend_lh__d1_d3 t_4_5_4) ys_4_6_0) in
              (let rec h_4_5_5 = h_4_5_4 in
                (fun ys_4_6_1 -> 
                  (`LH_C(h_4_5_5, ((mappend_lh__d1_d4 t_4_5_5) ys_4_6_1)))))))))
    | `LH_N -> 
      ys_4_5_9);;
let rec goto_lh__d6 _lh_goto_arg1_0 _lh_goto_arg2_0 =
  (`LH_C('E', (`LH_C('[', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg2_0)) (`LH_C(';', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg1_0)) (`LH_C('H', (`LH_N)))))))))));;
let rec length_lh__d1 ls_0 =
  (match ls_0 with
    | `LH_C(h_2, t_2) -> 
      (1 + (length_lh__d1 t_2))
    | `LH_N -> 
      0);;
let rec readAt_lh__d1 _lh_readAt_arg1_0 _lh_readAt_arg2_1 _lh_readAt_arg3_1 =
  ((_lh_readAt_arg1_0 _lh_readAt_arg2_1) _lh_readAt_arg3_1);;
let rec concat_lh__d1 lss_0 =
  (lss_0 99);;
let rec mappend_lh__d1_d2 xs_0 ys_4_3_5 =
  (match xs_0 with
    | `LH_C(h_4_3_3, t_4_3_3) -> 
      (let rec t_4_3_4 = ((mappend_lh__d1_d2 t_4_3_3) ys_4_3_5) in
        (let rec h_4_3_4 = h_4_3_3 in
          (fun ys_4_3_6 -> 
            (let rec t_4_3_5 = ((mappend_lh__d1_d3 t_4_3_4) ys_4_3_6) in
              (let rec h_4_3_5 = h_4_3_4 in
                (fun ys_4_3_7 -> 
                  (`LH_C(h_4_3_5, ((mappend_lh__d1_d4 t_4_3_5) ys_4_3_7)))))))))
    | `LH_N -> 
      ys_4_3_5);;
let rec at_lh__d4 _lh_at_arg1_2 _lh_at_arg2_8 =
  (_lh_at_arg1_2 _lh_at_arg2_8);;
let rec mappend_lh__d1 xs_2 ys_4_3_9 =
  (xs_2 ys_4_3_9);;
let rec goto_lh__d5 _lh_goto_arg1_2 _lh_goto_arg2_2 =
  (`LH_C('E', (`LH_C('[', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg2_2)) (`LH_C(';', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg1_2)) (`LH_C('H', (`LH_N)))))))))));;
let rec mappend_lh__d8 xs_3 ys_4_4_0 =
  (match xs_3 with
    | `LH_C(h_4_3_6, t_4_3_6) -> 
      (let rec t_4_3_7 = ((mappend_lh__d8 t_4_3_6) ys_4_4_0) in
        (let rec h_4_3_7 = h_4_3_6 in
          (fun ys_4_4_1 -> 
            (let rec t_4_3_8 = ((mappend_lh__d1_d3 t_4_3_7) ys_4_4_1) in
              (let rec h_4_3_8 = h_4_3_7 in
                (fun ys_4_4_2 -> 
                  (`LH_C(h_4_3_8, ((mappend_lh__d1_d4 t_4_3_8) ys_4_4_2)))))))))
    | `LH_N -> 
      ys_4_4_0);;
let rec mappend_lh__d1_d0 xs_4 ys_4_4_4 =
  (match xs_4 with
    | `LH_C(h_4_4_1, t_4_4_1) -> 
      (let rec t_4_4_2 = ((mappend_lh__d1_d0 t_4_4_1) ys_4_4_4) in
        (let rec h_4_4_2 = h_4_4_1 in
          (fun ys_4_4_5 -> 
            (let rec t_4_4_3 = ((mappend_lh__d1_d3 t_4_4_2) ys_4_4_5) in
              (let rec h_4_4_3 = h_4_4_2 in
                (fun ys_4_4_6 -> 
                  (`LH_C(h_4_4_3, ((mappend_lh__d1_d4 t_4_4_3) ys_4_4_6)))))))))
    | `LH_N -> 
      ys_4_4_4);;
let rec mappend_lh__d7 xs_5 ys_4_4_7 =
  (match xs_5 with
    | `LH_C(h_4_4_4, t_4_4_4) -> 
      (let rec t_4_4_5 = ((mappend_lh__d7 t_4_4_4) ys_4_4_7) in
        (let rec h_4_4_5 = h_4_4_4 in
          (fun ys_4_4_8 -> 
            (let rec t_4_4_6 = ((mappend_lh__d1_d3 t_4_4_5) ys_4_4_8) in
              (let rec h_4_4_6 = h_4_4_5 in
                (fun ys_4_4_9 -> 
                  (`LH_C(h_4_4_6, ((mappend_lh__d1_d4 t_4_4_6) ys_4_4_9)))))))))
    | `LH_N -> 
      ys_4_4_7);;
let rec mappend_lh__d2 xs_6 ys_4_5_0 =
  (xs_6 ys_4_5_0);;
let rec goto_lh__d4 _lh_goto_arg1_3 _lh_goto_arg2_3 =
  (`LH_C('E', (`LH_C('[', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg2_3)) (`LH_C(';', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg1_3)) (`LH_C('H', (`LH_N)))))))))));;
let rec at_lh__d6 _lh_at_arg1_3 _lh_at_arg2_9 =
  (_lh_at_arg1_3 _lh_at_arg2_9);;
let rec goto_lh__d2 _lh_goto_arg1_4 _lh_goto_arg2_4 =
  (`LH_C('E', (`LH_C('[', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg2_4)) (`LH_C(';', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg1_4)) (`LH_C('H', (`LH_N)))))))))));;
let rec promptReadAt_lh__d1 _lh_promptReadAt_arg1_0 _lh_promptReadAt_arg2_1 _lh_promptReadAt_arg3_1 _lh_promptReadAt_arg4_1 =
  (((_lh_promptReadAt_arg1_0 _lh_promptReadAt_arg2_1) _lh_promptReadAt_arg3_1) _lh_promptReadAt_arg4_1);;
let rec end_lh__d1 _lh_end_arg1_0 =
  (`LH_N);;
let rec mappend_lh__d6 xs_9 ys_4_5_3 =
  (match xs_9 with
    | `LH_C(h_4_4_8, t_4_4_8) -> 
      (`LH_C(h_4_4_8, ((mappend_lh__d6 t_4_4_8) ys_4_5_3)))
    | `LH_N -> 
      ys_4_5_3);;
let rec mappend_lh__d1_d1 xs_1_0 ys_4_5_4 =
  (match xs_1_0 with
    | `LH_C(h_4_4_9, t_4_4_9) -> 
      (let rec t_4_5_0 = ((mappend_lh__d1_d1 t_4_4_9) ys_4_5_4) in
        (let rec h_4_5_0 = h_4_4_9 in
          (fun ys_4_5_5 -> 
            (let rec t_4_5_1 = ((mappend_lh__d1_d3 t_4_5_0) ys_4_5_5) in
              (let rec h_4_5_1 = h_4_5_0 in
                (fun ys_4_5_6 -> 
                  (`LH_C(h_4_5_1, ((mappend_lh__d1_d4 t_4_5_1) ys_4_5_6)))))))))
    | `LH_N -> 
      ys_4_5_4);;
let rec goto_lh__d8 _lh_goto_arg1_5 _lh_goto_arg2_5 =
  (`LH_C('E', (`LH_C('[', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg2_5)) (`LH_C(';', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg1_5)) (`LH_C('H', (`LH_N)))))))))));;
let rec mappend_lh__d4 xs_1_1 ys_4_5_7 =
  (xs_1_1 ys_4_5_7);;
let rec writeAt_lh__d2 _lh_writeAt_arg1_1 _lh_writeAt_arg2_4 =
  (_lh_writeAt_arg1_1 _lh_writeAt_arg2_4);;
let rec writeAt_lh__d1 _lh_writeAt_arg1_2 _lh_writeAt_arg2_5 =
  (_lh_writeAt_arg1_2 _lh_writeAt_arg2_5);;
let rec writeString_lh__d3 _lh_writeString_arg1_3 _lh_writeString_arg2_3 _lh_writeString_arg3_3 =
  ((mappend_lh__d1_d5 _lh_writeString_arg1_3) (_lh_writeString_arg2_3 _lh_writeString_arg3_3));;
let rec mappend_lh__d3 xs_1 ys_4_3_8 =
  (xs_1 ys_4_3_8);;
let rec highlight_lh__d1 _lh_highlight_arg1_0 =
  ((mappend_lh__d3 (let rec t_4_5_6 = (let rec t_4_5_7 = (let rec t_4_5_8 = (let rec t_4_5_9 = (let rec t_4_6_0 = (let rec t_4_6_1 = (fun ys_4_6_2 -> 
    ys_4_6_2) in
    (let rec h_4_5_6 = 'm' in
      (fun ys_4_6_3 -> 
        (let rec t_4_6_2 = ((mappend_lh__d3 t_4_6_1) ys_4_6_3) in
          (let rec h_4_5_7 = h_4_5_6 in
            (fun ys_4_6_4 -> 
              (let rec t_4_6_3 = ((mappend_lh__d1_d3 t_4_6_2) ys_4_6_4) in
                (let rec h_4_5_8 = h_4_5_7 in
                  (fun ys_4_6_5 -> 
                    (`LH_C(h_4_5_8, ((mappend_lh__d1_d4 t_4_6_3) ys_4_6_5)))))))))))) in
    (let rec h_4_5_9 = '7' in
      (fun ys_4_6_6 -> 
        (let rec t_4_6_4 = ((mappend_lh__d3 t_4_6_0) ys_4_6_6) in
          (let rec h_4_6_0 = h_4_5_9 in
            (fun ys_4_6_7 -> 
              (let rec t_4_6_5 = ((mappend_lh__d1_d3 t_4_6_4) ys_4_6_7) in
                (let rec h_4_6_1 = h_4_6_0 in
                  (fun ys_4_6_8 -> 
                    (`LH_C(h_4_6_1, ((mappend_lh__d1_d4 t_4_6_5) ys_4_6_8)))))))))))) in
    (let rec h_4_6_2 = '[' in
      (fun ys_4_6_9 -> 
        (let rec t_4_6_6 = ((mappend_lh__d3 t_4_5_9) ys_4_6_9) in
          (let rec h_4_6_3 = h_4_6_2 in
            (fun ys_4_7_0 -> 
              (let rec t_4_6_7 = ((mappend_lh__d1_d3 t_4_6_6) ys_4_7_0) in
                (let rec h_4_6_4 = h_4_6_3 in
                  (fun ys_4_7_1 -> 
                    (`LH_C(h_4_6_4, ((mappend_lh__d1_d4 t_4_6_7) ys_4_7_1)))))))))))) in
    (let rec h_4_6_5 = 'C' in
      (fun ys_4_7_2 -> 
        (let rec t_4_6_8 = ((mappend_lh__d3 t_4_5_8) ys_4_7_2) in
          (let rec h_4_6_6 = h_4_6_5 in
            (fun ys_4_7_3 -> 
              (let rec t_4_6_9 = ((mappend_lh__d1_d3 t_4_6_8) ys_4_7_3) in
                (let rec h_4_6_7 = h_4_6_6 in
                  (fun ys_4_7_4 -> 
                    (`LH_C(h_4_6_7, ((mappend_lh__d1_d4 t_4_6_9) ys_4_7_4)))))))))))) in
    (let rec h_4_6_8 = 'S' in
      (fun ys_4_7_5 -> 
        (let rec t_4_7_0 = ((mappend_lh__d3 t_4_5_7) ys_4_7_5) in
          (let rec h_4_6_9 = h_4_6_8 in
            (fun ys_4_7_6 -> 
              (let rec t_4_7_1 = ((mappend_lh__d1_d3 t_4_7_0) ys_4_7_6) in
                (let rec h_4_7_0 = h_4_6_9 in
                  (fun ys_4_7_7 -> 
                    (`LH_C(h_4_7_0, ((mappend_lh__d1_d4 t_4_7_1) ys_4_7_7)))))))))))) in
    (let rec h_4_7_1 = 'E' in
      (fun ys_4_7_8 -> 
        (let rec t_4_7_2 = ((mappend_lh__d3 t_4_5_6) ys_4_7_8) in
          (let rec h_4_7_2 = h_4_7_1 in
            (fun ys_4_7_9 -> 
              (let rec t_4_7_3 = ((mappend_lh__d1_d3 t_4_7_2) ys_4_7_9) in
                (let rec h_4_7_3 = h_4_7_2 in
                  (fun ys_4_8_0 -> 
                    (`LH_C(h_4_7_3, ((mappend_lh__d1_d4 t_4_7_3) ys_4_8_0))))))))))))) ((mappend_lh__d4 _lh_highlight_arg1_0) (let rec t_4_7_4 = (let rec t_4_7_5 = (let rec t_4_7_6 = (let rec t_4_7_7 = (let rec t_4_7_8 = (let rec t_4_7_9 = (fun ys_4_8_1 -> 
    ys_4_8_1) in
    (let rec h_4_7_4 = 'm' in
      (fun ys_4_8_2 -> 
        (let rec t_4_8_0 = ((mappend_lh__d1_d3 t_4_7_9) ys_4_8_2) in
          (let rec h_4_7_5 = h_4_7_4 in
            (fun ys_4_8_3 -> 
              (`LH_C(h_4_7_5, ((mappend_lh__d1_d4 t_4_8_0) ys_4_8_3))))))))) in
    (let rec h_4_7_6 = '0' in
      (fun ys_4_8_4 -> 
        (let rec t_4_8_1 = ((mappend_lh__d1_d3 t_4_7_8) ys_4_8_4) in
          (let rec h_4_7_7 = h_4_7_6 in
            (fun ys_4_8_5 -> 
              (`LH_C(h_4_7_7, ((mappend_lh__d1_d4 t_4_8_1) ys_4_8_5))))))))) in
    (let rec h_4_7_8 = '[' in
      (fun ys_4_8_6 -> 
        (let rec t_4_8_2 = ((mappend_lh__d1_d3 t_4_7_7) ys_4_8_6) in
          (let rec h_4_7_9 = h_4_7_8 in
            (fun ys_4_8_7 -> 
              (`LH_C(h_4_7_9, ((mappend_lh__d1_d4 t_4_8_2) ys_4_8_7))))))))) in
    (let rec h_4_8_0 = 'C' in
      (fun ys_4_8_8 -> 
        (let rec t_4_8_3 = ((mappend_lh__d1_d3 t_4_7_6) ys_4_8_8) in
          (let rec h_4_8_1 = h_4_8_0 in
            (fun ys_4_8_9 -> 
              (`LH_C(h_4_8_1, ((mappend_lh__d1_d4 t_4_8_3) ys_4_8_9))))))))) in
    (let rec h_4_8_2 = 'S' in
      (fun ys_4_9_0 -> 
        (let rec t_4_8_4 = ((mappend_lh__d1_d3 t_4_7_5) ys_4_9_0) in
          (let rec h_4_8_3 = h_4_8_2 in
            (fun ys_4_9_1 -> 
              (`LH_C(h_4_8_3, ((mappend_lh__d1_d4 t_4_8_4) ys_4_9_1))))))))) in
    (let rec h_4_8_4 = 'E' in
      (fun ys_4_9_2 -> 
        (let rec t_4_8_5 = ((mappend_lh__d1_d3 t_4_7_4) ys_4_9_2) in
          (let rec h_4_8_5 = h_4_8_4 in
            (fun ys_4_9_3 -> 
              (`LH_C(h_4_8_5, ((mappend_lh__d1_d4 t_4_8_5) ys_4_9_3)))))))))));;
let rec moveTo_lh__d1 _lh_moveTo_arg1_0 =
  (_lh_moveTo_arg1_0 99);;
let rec readChar_lh__d2 _lh_readChar_arg1_1 _lh_readChar_arg2_1 _lh_readChar_arg3_1 =
  (match _lh_readChar_arg3_1 with
    | `LH_N -> 
      (_lh_readChar_arg1_1 (`LH_N))
    | `LH_C(_lh_readChar_LH_C_0_1, _lh_readChar_LH_C_1_1) -> 
      ((_lh_readChar_arg2_1 _lh_readChar_LH_C_0_1) _lh_readChar_LH_C_1_1));;
let rec pressAnyKey_lh__d2 _lh_pressAnyKey_arg1_0 =
  ((readChar_lh__d2 _lh_pressAnyKey_arg1_0) (fun c_0 -> 
    _lh_pressAnyKey_arg1_0));;
let rec writeString_lh__d2 _lh_writeString_arg1_1 _lh_writeString_arg2_1 _lh_writeString_arg3_1 =
  ((mappend_lh__d1_d4 _lh_writeString_arg1_1) (_lh_writeString_arg2_1 _lh_writeString_arg3_1));;
let rec writes_lh__d1 _lh_writes_arg1_0 =
  (writeString_lh__d2 (concat_lh__d1 _lh_writes_arg1_0));;
let rec goto_lh__d3 _lh_goto_arg1_6 _lh_goto_arg2_6 =
  (`LH_C('E', (`LH_C('[', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg2_6)) (`LH_C(';', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg1_6)) (`LH_C('H', (`LH_N)))))))))));;
let rec moveTo_lh__d2 _lh_moveTo_arg1_1 =
  (_lh_moveTo_arg1_1 99);;
let rec writeString_lh__d5 _lh_writeString_arg1_4 _lh_writeString_arg2_4 _lh_writeString_arg3_4 =
  ((mappend_lh__d1_d5 _lh_writeString_arg1_4) (_lh_writeString_arg2_4 _lh_writeString_arg3_4));;
let rec readChar_lh__d1 _lh_readChar_arg1_0 _lh_readChar_arg2_0 _lh_readChar_arg3_0 =
  (match _lh_readChar_arg3_0 with
    | `LH_N -> 
      (_lh_readChar_arg1_0 (`LH_N))
    | `LH_C(_lh_readChar_LH_C_0_0, _lh_readChar_LH_C_1_0) -> 
      ((_lh_readChar_arg2_0 _lh_readChar_LH_C_0_0) _lh_readChar_LH_C_1_0));;
let rec pressAnyKey_lh__d1 _lh_pressAnyKey_arg1_1 =
  ((readChar_lh__d1 _lh_pressAnyKey_arg1_1) (fun c_1 -> 
    _lh_pressAnyKey_arg1_1));;
let rec copy_lh__d2 _lh_copy_arg1_1 _lh_copy_arg2_1 =
  (if (_lh_copy_arg1_1 > 0) then
    (`LH_C(_lh_copy_arg2_1, ((copy_lh__d2 (_lh_copy_arg1_1 - 1)) _lh_copy_arg2_1)))
  else
    (`LH_N));;
let rec at_lh__d5 _lh_at_arg1_4 _lh_at_arg2_1_0 =
  (_lh_at_arg1_4 _lh_at_arg2_1_0);;
let rec at_lh__d3 _lh_at_arg1_5 _lh_at_arg2_1_1 =
  (_lh_at_arg1_5 _lh_at_arg2_1_1);;
let rec goto_lh__d7 _lh_goto_arg1_7 _lh_goto_arg2_7 =
  (`LH_C('E', (`LH_C('[', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg2_7)) (`LH_C(';', ((mappend_lh__d1_d5 (string_of_int _lh_goto_arg1_7)) (`LH_C('H', (`LH_N)))))))))));;
let rec writeChar_lh__d1 _lh_writeChar_arg1_0 _lh_writeChar_arg2_0 _lh_writeChar_arg3_0 =
  (`LH_C(_lh_writeChar_arg1_0, (_lh_writeChar_arg2_0 _lh_writeChar_arg3_0)));;
let rec reverse_helper_lh__d1 ls_1 a_0 =
  (match ls_1 with
    | `LH_C(h_4_3_9, t_4_3_9) -> 
      ((reverse_helper_lh__d1 t_4_3_9) (let rec t_4_4_0 = a_0 in
        (let rec h_4_4_0 = h_4_3_9 in
          (fun ys_4_4_3 -> 
            (`LH_C(h_4_4_0, ((mappend_lh__d2 t_4_4_0) ys_4_4_3)))))))
    | `LH_N -> 
      a_0);;
let rec reverse_lh__d1 ls_4 =
  ((reverse_helper_lh__d1 ls_4) (fun ys_4_9_5 -> 
    ys_4_9_5));;
let rec return_lh__d1 _lh_return_arg1_0 _lh_return_arg2_0 =
  (_lh_return_arg2_0 (reverse_lh__d1 _lh_return_arg1_0));;
let rec tail_lh__d1 ls_3 =
  (match ls_3 with
    | `LH_C(h_4_5_2, t_4_5_2) -> 
      t_4_5_2
    | `LH_N -> 
      (failwith "lh_default_error"));;
let rec ringBell_lh__d1 _lh_ringBell_arg1_0 _lh_ringBell_arg2_0 =
  (((writeChar_lh__d1 'B') _lh_ringBell_arg1_0) _lh_ringBell_arg2_0);;
let rec delete_lh__d1 _lh_delete_arg1_0 _lh_delete_arg2_0 _lh_delete_arg3_0 _lh_delete_arg4_0 =
  (if (_lh_delete_arg1_0 > 0) then
    ((writeString_lh__d5 (`LH_C('B', (`LH_C('S', (`LH_C('_', (`LH_C('B', (`LH_C('S', (`LH_N)))))))))))) ((((loop_lh__d1 (_lh_delete_arg1_0 - 1)) (tail_lh__d1 _lh_delete_arg2_0)) _lh_delete_arg3_0) _lh_delete_arg4_0))
  else
    (ringBell_lh__d1 ((((loop_lh__d1 0) (`LH_N)) _lh_delete_arg3_0) _lh_delete_arg4_0)))
and
loop_lh__d1 _lh_loop_arg1_0 _lh_loop_arg2_0 _lh_loop_arg3_0 _lh_loop_arg4_0 =
  ((readChar_lh__d2 ((return_lh__d1 _lh_loop_arg2_0) _lh_loop_arg4_0)) (fun c_2 -> 
    (let rec _lh_matchIdent_0 = c_2 in
      (match _lh_matchIdent_0 with
        | 'B' -> 
          ((((delete_lh__d1 _lh_loop_arg1_0) _lh_loop_arg2_0) _lh_loop_arg3_0) _lh_loop_arg4_0)
        | 'D' -> 
          ((((delete_lh__d1 _lh_loop_arg1_0) _lh_loop_arg2_0) _lh_loop_arg3_0) _lh_loop_arg4_0)
        | '`' -> 
          ((return_lh__d1 _lh_loop_arg2_0) _lh_loop_arg4_0)
        | _ -> 
          (if (_lh_loop_arg1_0 < _lh_loop_arg3_0) then
            ((writeChar_lh__d1 _lh_matchIdent_0) ((((loop_lh__d1 (_lh_loop_arg1_0 + 1)) (`LH_C(_lh_matchIdent_0, _lh_loop_arg2_0))) _lh_loop_arg3_0) _lh_loop_arg4_0))
          else
            (ringBell_lh__d1 ((((loop_lh__d1 _lh_loop_arg1_0) _lh_loop_arg2_0) _lh_loop_arg3_0) _lh_loop_arg4_0)))))));;
let rec length_lh__d2 ls_5 =
  (match ls_5 with
    | `LH_C(h_4_8_7, t_4_8_7) -> 
      (1 + (length_lh__d2 t_4_8_7))
    | `LH_N -> 
      0);;
let rec program_lh__d1 _lh_program_arg1_0 =
  (((writes_lh__d1 (let rec t_3 = (let rec t_4 = (let rec t_5 = (let rec t_6 = (let rec t_7 = (let rec t_8 = (let rec t_9 = (fun _lh_dummy_0 ys_3 -> 
    ys_3) in
    (let rec h_3 = ((at_lh__d6 (let rec _lh_at_LH_P2_1_0 = 11 in
      (let rec _lh_at_LH_P2_0_0 = 17 in
        (fun _lh_at_arg2_1 -> 
          ((mappend_lh__d1_d2 ((goto_lh__d7 _lh_at_LH_P2_0_0) _lh_at_LH_P2_1_0)) _lh_at_arg2_1))))) (let rec t_1_0 = (let rec t_1_1 = (let rec t_1_2 = (let rec t_1_3 = (let rec t_1_4 = (let rec t_1_5 = (let rec t_1_6 = (let rec t_1_7 = (let rec t_1_8 = (let rec t_1_9 = (let rec t_2_0 = (let rec t_2_1 = (let rec t_2_2 = (let rec t_2_3 = (let rec t_2_4 = (let rec t_2_5 = (let rec t_2_6 = (let rec t_2_7 = (let rec t_2_8 = (let rec t_2_9 = (let rec t_3_0 = (let rec t_3_1 = (let rec t_3_2 = (let rec t_3_3 = (let rec t_3_4 = (let rec t_3_5 = (let rec t_3_6 = (let rec t_3_7 = (let rec t_3_8 = (let rec t_3_9 = (let rec t_4_0 = (let rec t_4_1 = (let rec t_4_2 = (let rec t_4_3 = (let rec t_4_4 = (let rec t_4_5 = (fun ys_4 -> 
      ys_4) in
      (let rec h_4 = '.' in
        (fun ys_5 -> 
          (let rec t_4_6 = ((mappend_lh__d1_d3 t_4_5) ys_5) in
            (let rec h_5 = h_4 in
              (fun ys_6 -> 
                (`LH_C(h_5, ((mappend_lh__d1_d4 t_4_6) ys_6))))))))) in
      (let rec h_6 = '.' in
        (fun ys_7 -> 
          (let rec t_4_7 = ((mappend_lh__d1_d3 t_4_4) ys_7) in
            (let rec h_7 = h_6 in
              (fun ys_8 -> 
                (`LH_C(h_7, ((mappend_lh__d1_d4 t_4_7) ys_8))))))))) in
      (let rec h_8 = '.' in
        (fun ys_9 -> 
          (let rec t_4_8 = ((mappend_lh__d1_d3 t_4_3) ys_9) in
            (let rec h_9 = h_8 in
              (fun ys_1_0 -> 
                (`LH_C(h_9, ((mappend_lh__d1_d4 t_4_8) ys_1_0))))))))) in
      (let rec h_1_0 = ' ' in
        (fun ys_1_1 -> 
          (let rec t_4_9 = ((mappend_lh__d1_d3 t_4_2) ys_1_1) in
            (let rec h_1_1 = h_1_0 in
              (fun ys_1_2 -> 
                (`LH_C(h_1_1, ((mappend_lh__d1_d4 t_4_9) ys_1_2))))))))) in
      (let rec h_1_2 = 'e' in
        (fun ys_1_3 -> 
          (let rec t_5_0 = ((mappend_lh__d1_d3 t_4_1) ys_1_3) in
            (let rec h_1_3 = h_1_2 in
              (fun ys_1_4 -> 
                (`LH_C(h_1_3, ((mappend_lh__d1_d4 t_5_0) ys_1_4))))))))) in
      (let rec h_1_4 = 'u' in
        (fun ys_1_5 -> 
          (let rec t_5_1 = ((mappend_lh__d1_d3 t_4_0) ys_1_5) in
            (let rec h_1_5 = h_1_4 in
              (fun ys_1_6 -> 
                (`LH_C(h_1_5, ((mappend_lh__d1_d4 t_5_1) ys_1_6))))))))) in
      (let rec h_1_6 = 'n' in
        (fun ys_1_7 -> 
          (let rec t_5_2 = ((mappend_lh__d1_d3 t_3_9) ys_1_7) in
            (let rec h_1_7 = h_1_6 in
              (fun ys_1_8 -> 
                (`LH_C(h_1_7, ((mappend_lh__d1_d4 t_5_2) ys_1_8))))))))) in
      (let rec h_1_8 = 'i' in
        (fun ys_1_9 -> 
          (let rec t_5_3 = ((mappend_lh__d1_d3 t_3_8) ys_1_9) in
            (let rec h_1_9 = h_1_8 in
              (fun ys_2_0 -> 
                (`LH_C(h_1_9, ((mappend_lh__d1_d4 t_5_3) ys_2_0))))))))) in
      (let rec h_2_0 = 't' in
        (fun ys_2_1 -> 
          (let rec t_5_4 = ((mappend_lh__d1_d3 t_3_7) ys_2_1) in
            (let rec h_2_1 = h_2_0 in
              (fun ys_2_2 -> 
                (`LH_C(h_2_1, ((mappend_lh__d1_d4 t_5_4) ys_2_2))))))))) in
      (let rec h_2_2 = 'n' in
        (fun ys_2_3 -> 
          (let rec t_5_5 = ((mappend_lh__d1_d3 t_3_6) ys_2_3) in
            (let rec h_2_3 = h_2_2 in
              (fun ys_2_4 -> 
                (`LH_C(h_2_3, ((mappend_lh__d1_d4 t_5_5) ys_2_4))))))))) in
      (let rec h_2_4 = 'o' in
        (fun ys_2_5 -> 
          (let rec t_5_6 = ((mappend_lh__d1_d3 t_3_5) ys_2_5) in
            (let rec h_2_5 = h_2_4 in
              (fun ys_2_6 -> 
                (`LH_C(h_2_5, ((mappend_lh__d1_d4 t_5_6) ys_2_6))))))))) in
      (let rec h_2_6 = 'c' in
        (fun ys_2_7 -> 
          (let rec t_5_7 = ((mappend_lh__d1_d3 t_3_4) ys_2_7) in
            (let rec h_2_7 = h_2_6 in
              (fun ys_2_8 -> 
                (`LH_C(h_2_7, ((mappend_lh__d1_d4 t_5_7) ys_2_8))))))))) in
      (let rec h_2_8 = ' ' in
        (fun ys_2_9 -> 
          (let rec t_5_8 = ((mappend_lh__d1_d3 t_3_3) ys_2_9) in
            (let rec h_2_9 = h_2_8 in
              (fun ys_3_0 -> 
                (`LH_C(h_2_9, ((mappend_lh__d1_d4 t_5_8) ys_3_0))))))))) in
      (let rec h_3_0 = 'o' in
        (fun ys_3_1 -> 
          (let rec t_5_9 = ((mappend_lh__d1_d3 t_3_2) ys_3_1) in
            (let rec h_3_1 = h_3_0 in
              (fun ys_3_2 -> 
                (`LH_C(h_3_1, ((mappend_lh__d1_d4 t_5_9) ys_3_2))))))))) in
      (let rec h_3_2 = 't' in
        (fun ys_3_3 -> 
          (let rec t_6_0 = ((mappend_lh__d1_d3 t_3_1) ys_3_3) in
            (let rec h_3_3 = h_3_2 in
              (fun ys_3_4 -> 
                (`LH_C(h_3_3, ((mappend_lh__d1_d4 t_6_0) ys_3_4))))))))) in
      (let rec h_3_4 = ' ' in
        (fun ys_3_5 -> 
          (let rec t_6_1 = ((mappend_lh__d1_d3 t_3_0) ys_3_5) in
            (let rec h_3_5 = h_3_4 in
              (fun ys_3_6 -> 
                (`LH_C(h_3_5, ((mappend_lh__d1_d4 t_6_1) ys_3_6))))))))) in
      (let rec h_3_6 = 'y' in
        (fun ys_3_7 -> 
          (let rec t_6_2 = ((mappend_lh__d1_d3 t_2_9) ys_3_7) in
            (let rec h_3_7 = h_3_6 in
              (fun ys_3_8 -> 
                (`LH_C(h_3_7, ((mappend_lh__d1_d4 t_6_2) ys_3_8))))))))) in
      (let rec h_3_8 = 'e' in
        (fun ys_3_9 -> 
          (let rec t_6_3 = ((mappend_lh__d1_d3 t_2_8) ys_3_9) in
            (let rec h_3_9 = h_3_8 in
              (fun ys_4_0 -> 
                (`LH_C(h_3_9, ((mappend_lh__d1_d4 t_6_3) ys_4_0))))))))) in
      (let rec h_4_0 = 'k' in
        (fun ys_4_1 -> 
          (let rec t_6_4 = ((mappend_lh__d1_d3 t_2_7) ys_4_1) in
            (let rec h_4_1 = h_4_0 in
              (fun ys_4_2 -> 
                (`LH_C(h_4_1, ((mappend_lh__d1_d4 t_6_4) ys_4_2))))))))) in
      (let rec h_4_2 = ' ' in
        (fun ys_4_3 -> 
          (let rec t_6_5 = ((mappend_lh__d1_d3 t_2_6) ys_4_3) in
            (let rec h_4_3 = h_4_2 in
              (fun ys_4_4 -> 
                (`LH_C(h_4_3, ((mappend_lh__d1_d4 t_6_5) ys_4_4))))))))) in
      (let rec h_4_4 = 'y' in
        (fun ys_4_5 -> 
          (let rec t_6_6 = ((mappend_lh__d1_d3 t_2_5) ys_4_5) in
            (let rec h_4_5 = h_4_4 in
              (fun ys_4_6 -> 
                (`LH_C(h_4_5, ((mappend_lh__d1_d4 t_6_6) ys_4_6))))))))) in
      (let rec h_4_6 = 'n' in
        (fun ys_4_7 -> 
          (let rec t_6_7 = ((mappend_lh__d1_d3 t_2_4) ys_4_7) in
            (let rec h_4_7 = h_4_6 in
              (fun ys_4_8 -> 
                (`LH_C(h_4_7, ((mappend_lh__d1_d4 t_6_7) ys_4_8))))))))) in
      (let rec h_4_8 = 'a' in
        (fun ys_4_9 -> 
          (let rec t_6_8 = ((mappend_lh__d1_d3 t_2_3) ys_4_9) in
            (let rec h_4_9 = h_4_8 in
              (fun ys_5_0 -> 
                (`LH_C(h_4_9, ((mappend_lh__d1_d4 t_6_8) ys_5_0))))))))) in
      (let rec h_5_0 = ' ' in
        (fun ys_5_1 -> 
          (let rec t_6_9 = ((mappend_lh__d1_d3 t_2_2) ys_5_1) in
            (let rec h_5_1 = h_5_0 in
              (fun ys_5_2 -> 
                (`LH_C(h_5_1, ((mappend_lh__d1_d4 t_6_9) ys_5_2))))))))) in
      (let rec h_5_2 = 's' in
        (fun ys_5_3 -> 
          (let rec t_7_0 = ((mappend_lh__d1_d3 t_2_1) ys_5_3) in
            (let rec h_5_3 = h_5_2 in
              (fun ys_5_4 -> 
                (`LH_C(h_5_3, ((mappend_lh__d1_d4 t_7_0) ys_5_4))))))))) in
      (let rec h_5_4 = 's' in
        (fun ys_5_5 -> 
          (let rec t_7_1 = ((mappend_lh__d1_d3 t_2_0) ys_5_5) in
            (let rec h_5_5 = h_5_4 in
              (fun ys_5_6 -> 
                (`LH_C(h_5_5, ((mappend_lh__d1_d4 t_7_1) ys_5_6))))))))) in
      (let rec h_5_6 = 'e' in
        (fun ys_5_7 -> 
          (let rec t_7_2 = ((mappend_lh__d1_d3 t_1_9) ys_5_7) in
            (let rec h_5_7 = h_5_6 in
              (fun ys_5_8 -> 
                (`LH_C(h_5_7, ((mappend_lh__d1_d4 t_7_2) ys_5_8))))))))) in
      (let rec h_5_8 = 'r' in
        (fun ys_5_9 -> 
          (let rec t_7_3 = ((mappend_lh__d1_d3 t_1_8) ys_5_9) in
            (let rec h_5_9 = h_5_8 in
              (fun ys_6_0 -> 
                (`LH_C(h_5_9, ((mappend_lh__d1_d4 t_7_3) ys_6_0))))))))) in
      (let rec h_6_0 = 'p' in
        (fun ys_6_1 -> 
          (let rec t_7_4 = ((mappend_lh__d1_d3 t_1_7) ys_6_1) in
            (let rec h_6_1 = h_6_0 in
              (fun ys_6_2 -> 
                (`LH_C(h_6_1, ((mappend_lh__d1_d4 t_7_4) ys_6_2))))))))) in
      (let rec h_6_2 = ' ' in
        (fun ys_6_3 -> 
          (let rec t_7_5 = ((mappend_lh__d1_d3 t_1_6) ys_6_3) in
            (let rec h_6_3 = h_6_2 in
              (fun ys_6_4 -> 
                (`LH_C(h_6_3, ((mappend_lh__d1_d4 t_7_5) ys_6_4))))))))) in
      (let rec h_6_4 = 'e' in
        (fun ys_6_5 -> 
          (let rec t_7_6 = ((mappend_lh__d1_d3 t_1_5) ys_6_5) in
            (let rec h_6_5 = h_6_4 in
              (fun ys_6_6 -> 
                (`LH_C(h_6_5, ((mappend_lh__d1_d4 t_7_6) ys_6_6))))))))) in
      (let rec h_6_6 = 's' in
        (fun ys_6_7 -> 
          (let rec t_7_7 = ((mappend_lh__d1_d3 t_1_4) ys_6_7) in
            (let rec h_6_7 = h_6_6 in
              (fun ys_6_8 -> 
                (`LH_C(h_6_7, ((mappend_lh__d1_d4 t_7_7) ys_6_8))))))))) in
      (let rec h_6_8 = 'a' in
        (fun ys_6_9 -> 
          (let rec t_7_8 = ((mappend_lh__d1_d3 t_1_3) ys_6_9) in
            (let rec h_6_9 = h_6_8 in
              (fun ys_7_0 -> 
                (`LH_C(h_6_9, ((mappend_lh__d1_d4 t_7_8) ys_7_0))))))))) in
      (let rec h_7_0 = 'e' in
        (fun ys_7_1 -> 
          (let rec t_7_9 = ((mappend_lh__d1_d3 t_1_2) ys_7_1) in
            (let rec h_7_1 = h_7_0 in
              (fun ys_7_2 -> 
                (`LH_C(h_7_1, ((mappend_lh__d1_d4 t_7_9) ys_7_2))))))))) in
      (let rec h_7_2 = 'l' in
        (fun ys_7_3 -> 
          (let rec t_8_0 = ((mappend_lh__d1_d3 t_1_1) ys_7_3) in
            (let rec h_7_3 = h_7_2 in
              (fun ys_7_4 -> 
                (`LH_C(h_7_3, ((mappend_lh__d1_d4 t_8_0) ys_7_4))))))))) in
      (let rec h_7_4 = 'P' in
        (fun ys_7_5 -> 
          (let rec t_8_1 = ((mappend_lh__d1_d3 t_1_0) ys_7_5) in
            (let rec h_7_5 = h_7_4 in
              (fun ys_7_6 -> 
                (`LH_C(h_7_5, ((mappend_lh__d1_d4 t_8_1) ys_7_6)))))))))) in
      (fun _lh_dummy_1 -> 
        ((mappend_lh__d1_d3 h_3) (concat_lh__d1 t_9))))) in
    (let rec h_7_6 = ((at_lh__d5 (let rec _lh_at_LH_P2_1_1 = 9 in
      (let rec _lh_at_LH_P2_0_1 = 17 in
        (fun _lh_at_arg2_2 -> 
          ((mappend_lh__d1_d1 ((goto_lh__d6 _lh_at_LH_P2_0_1) _lh_at_LH_P2_1_1)) _lh_at_arg2_2))))) (let rec t_8_2 = (let rec t_8_3 = (let rec t_8_4 = (let rec t_8_5 = (let rec t_8_6 = (let rec t_8_7 = (let rec t_8_8 = (let rec t_8_9 = (let rec t_9_0 = (let rec t_9_1 = (let rec t_9_2 = (let rec t_9_3 = (let rec t_9_4 = (let rec t_9_5 = (let rec t_9_6 = (let rec t_9_7 = (let rec t_9_8 = (let rec t_9_9 = (let rec t_1_0_0 = (let rec t_1_0_1 = (let rec t_1_0_2 = (let rec t_1_0_3 = (let rec t_1_0_4 = (let rec t_1_0_5 = (let rec t_1_0_6 = (let rec t_1_0_7 = (let rec t_1_0_8 = (let rec t_1_0_9 = (let rec t_1_1_0 = (let rec t_1_1_1 = (let rec t_1_1_2 = (let rec t_1_1_3 = (let rec t_1_1_4 = (let rec t_1_1_5 = (let rec t_1_1_6 = (let rec t_1_1_7 = (let rec t_1_1_8 = (let rec t_1_1_9 = (let rec t_1_2_0 = (fun ys_7_7 -> 
      ys_7_7) in
      (let rec h_7_7 = '.' in
        (fun ys_7_8 -> 
          (let rec t_1_2_1 = ((mappend_lh__d1_d3 t_1_2_0) ys_7_8) in
            (let rec h_7_8 = h_7_7 in
              (fun ys_7_9 -> 
                (`LH_C(h_7_8, ((mappend_lh__d1_d4 t_1_2_1) ys_7_9))))))))) in
      (let rec h_7_9 = 'm' in
        (fun ys_8_0 -> 
          (let rec t_1_2_2 = ((mappend_lh__d1_d3 t_1_1_9) ys_8_0) in
            (let rec h_8_0 = h_7_9 in
              (fun ys_8_1 -> 
                (`LH_C(h_8_0, ((mappend_lh__d1_d4 t_1_2_2) ys_8_1))))))))) in
      (let rec h_8_1 = 'e' in
        (fun ys_8_2 -> 
          (let rec t_1_2_3 = ((mappend_lh__d1_d3 t_1_1_8) ys_8_2) in
            (let rec h_8_2 = h_8_1 in
              (fun ys_8_3 -> 
                (`LH_C(h_8_2, ((mappend_lh__d1_d4 t_1_2_3) ys_8_3))))))))) in
      (let rec h_8_3 = 't' in
        (fun ys_8_4 -> 
          (let rec t_1_2_4 = ((mappend_lh__d1_d3 t_1_1_7) ys_8_4) in
            (let rec h_8_4 = h_8_3 in
              (fun ys_8_5 -> 
                (`LH_C(h_8_4, ((mappend_lh__d1_d4 t_1_2_4) ys_8_5))))))))) in
      (let rec h_8_5 = 's' in
        (fun ys_8_6 -> 
          (let rec t_1_2_5 = ((mappend_lh__d1_d3 t_1_1_6) ys_8_6) in
            (let rec h_8_6 = h_8_5 in
              (fun ys_8_7 -> 
                (`LH_C(h_8_6, ((mappend_lh__d1_d4 t_1_2_5) ys_8_7))))))))) in
      (let rec h_8_7 = 'y' in
        (fun ys_8_8 -> 
          (let rec t_1_2_6 = ((mappend_lh__d1_d3 t_1_1_5) ys_8_8) in
            (let rec h_8_8 = h_8_7 in
              (fun ys_8_9 -> 
                (`LH_C(h_8_8, ((mappend_lh__d1_d4 t_1_2_6) ys_8_9))))))))) in
      (let rec h_8_9 = 's' in
        (fun ys_9_0 -> 
          (let rec t_1_2_7 = ((mappend_lh__d1_d3 t_1_1_4) ys_9_0) in
            (let rec h_9_0 = h_8_9 in
              (fun ys_9_1 -> 
                (`LH_C(h_9_0, ((mappend_lh__d1_d4 t_1_2_7) ys_9_1))))))))) in
      (let rec h_9_1 = ' ' in
        (fun ys_9_2 -> 
          (let rec t_1_2_8 = ((mappend_lh__d1_d3 t_1_1_3) ys_9_2) in
            (let rec h_9_2 = h_9_1 in
              (fun ys_9_3 -> 
                (`LH_C(h_9_2, ((mappend_lh__d1_d4 t_1_2_8) ys_9_3))))))))) in
      (let rec h_9_3 = 'g' in
        (fun ys_9_4 -> 
          (let rec t_1_2_9 = ((mappend_lh__d1_d3 t_1_1_2) ys_9_4) in
            (let rec h_9_4 = h_9_3 in
              (fun ys_9_5 -> 
                (`LH_C(h_9_4, ((mappend_lh__d1_d4 t_1_2_9) ys_9_5))))))))) in
      (let rec h_9_5 = 'n' in
        (fun ys_9_6 -> 
          (let rec t_1_3_0 = ((mappend_lh__d1_d3 t_1_1_1) ys_9_6) in
            (let rec h_9_6 = h_9_5 in
              (fun ys_9_7 -> 
                (`LH_C(h_9_6, ((mappend_lh__d1_d4 t_1_3_0) ys_9_7))))))))) in
      (let rec h_9_7 = 'i' in
        (fun ys_9_8 -> 
          (let rec t_1_3_1 = ((mappend_lh__d1_d3 t_1_1_0) ys_9_8) in
            (let rec h_9_8 = h_9_7 in
              (fun ys_9_9 -> 
                (`LH_C(h_9_8, ((mappend_lh__d1_d4 t_1_3_1) ys_9_9))))))))) in
      (let rec h_9_9 = 'm' in
        (fun ys_1_0_0 -> 
          (let rec t_1_3_2 = ((mappend_lh__d1_d3 t_1_0_9) ys_1_0_0) in
            (let rec h_1_0_0 = h_9_9 in
              (fun ys_1_0_1 -> 
                (`LH_C(h_1_0_0, ((mappend_lh__d1_d4 t_1_3_2) ys_1_0_1))))))))) in
      (let rec h_1_0_1 = 'm' in
        (fun ys_1_0_2 -> 
          (let rec t_1_3_3 = ((mappend_lh__d1_d3 t_1_0_8) ys_1_0_2) in
            (let rec h_1_0_2 = h_1_0_1 in
              (fun ys_1_0_3 -> 
                (`LH_C(h_1_0_2, ((mappend_lh__d1_d4 t_1_3_3) ys_1_0_3))))))))) in
      (let rec h_1_0_3 = 'a' in
        (fun ys_1_0_4 -> 
          (let rec t_1_3_4 = ((mappend_lh__d1_d3 t_1_0_7) ys_1_0_4) in
            (let rec h_1_0_4 = h_1_0_3 in
              (fun ys_1_0_5 -> 
                (`LH_C(h_1_0_4, ((mappend_lh__d1_d4 t_1_3_4) ys_1_0_5))))))))) in
      (let rec h_1_0_5 = 'r' in
        (fun ys_1_0_6 -> 
          (let rec t_1_3_5 = ((mappend_lh__d1_d3 t_1_0_6) ys_1_0_6) in
            (let rec h_1_0_6 = h_1_0_5 in
              (fun ys_1_0_7 -> 
                (`LH_C(h_1_0_6, ((mappend_lh__d1_d4 t_1_3_5) ys_1_0_7))))))))) in
      (let rec h_1_0_7 = 'g' in
        (fun ys_1_0_8 -> 
          (let rec t_1_3_6 = ((mappend_lh__d1_d3 t_1_0_5) ys_1_0_8) in
            (let rec h_1_0_8 = h_1_0_7 in
              (fun ys_1_0_9 -> 
                (`LH_C(h_1_0_8, ((mappend_lh__d1_d4 t_1_3_6) ys_1_0_9))))))))) in
      (let rec h_1_0_9 = 'o' in
        (fun ys_1_1_0 -> 
          (let rec t_1_3_7 = ((mappend_lh__d1_d3 t_1_0_4) ys_1_1_0) in
            (let rec h_1_1_0 = h_1_0_9 in
              (fun ys_1_1_1 -> 
                (`LH_C(h_1_1_0, ((mappend_lh__d1_d4 t_1_3_7) ys_1_1_1))))))))) in
      (let rec h_1_1_1 = 'r' in
        (fun ys_1_1_2 -> 
          (let rec t_1_3_8 = ((mappend_lh__d1_d3 t_1_0_3) ys_1_1_2) in
            (let rec h_1_1_2 = h_1_1_1 in
              (fun ys_1_1_3 -> 
                (`LH_C(h_1_1_2, ((mappend_lh__d1_d4 t_1_3_8) ys_1_1_3))))))))) in
      (let rec h_1_1_3 = 'p' in
        (fun ys_1_1_4 -> 
          (let rec t_1_3_9 = ((mappend_lh__d1_d3 t_1_0_2) ys_1_1_4) in
            (let rec h_1_1_4 = h_1_1_3 in
              (fun ys_1_1_5 -> 
                (`LH_C(h_1_1_4, ((mappend_lh__d1_d4 t_1_3_9) ys_1_1_5))))))))) in
      (let rec h_1_1_5 = ' ' in
        (fun ys_1_1_6 -> 
          (let rec t_1_4_0 = ((mappend_lh__d1_d3 t_1_0_1) ys_1_1_6) in
            (let rec h_1_1_6 = h_1_1_5 in
              (fun ys_1_1_7 -> 
                (`LH_C(h_1_1_6, ((mappend_lh__d1_d4 t_1_4_0) ys_1_1_7))))))))) in
      (let rec h_1_1_7 = 'l' in
        (fun ys_1_1_8 -> 
          (let rec t_1_4_1 = ((mappend_lh__d1_d3 t_1_0_0) ys_1_1_8) in
            (let rec h_1_1_8 = h_1_1_7 in
              (fun ys_1_1_9 -> 
                (`LH_C(h_1_1_8, ((mappend_lh__d1_d4 t_1_4_1) ys_1_1_9))))))))) in
      (let rec h_1_1_9 = 'a' in
        (fun ys_1_2_0 -> 
          (let rec t_1_4_2 = ((mappend_lh__d1_d3 t_9_9) ys_1_2_0) in
            (let rec h_1_2_0 = h_1_1_9 in
              (fun ys_1_2_1 -> 
                (`LH_C(h_1_2_0, ((mappend_lh__d1_d4 t_1_4_2) ys_1_2_1))))))))) in
      (let rec h_1_2_1 = 'n' in
        (fun ys_1_2_2 -> 
          (let rec t_1_4_3 = ((mappend_lh__d1_d3 t_9_8) ys_1_2_2) in
            (let rec h_1_2_2 = h_1_2_1 in
              (fun ys_1_2_3 -> 
                (`LH_C(h_1_2_2, ((mappend_lh__d1_d4 t_1_4_3) ys_1_2_3))))))))) in
      (let rec h_1_2_3 = 'o' in
        (fun ys_1_2_4 -> 
          (let rec t_1_4_4 = ((mappend_lh__d1_d3 t_9_7) ys_1_2_4) in
            (let rec h_1_2_4 = h_1_2_3 in
              (fun ys_1_2_5 -> 
                (`LH_C(h_1_2_4, ((mappend_lh__d1_d4 t_1_4_4) ys_1_2_5))))))))) in
      (let rec h_1_2_5 = 'i' in
        (fun ys_1_2_6 -> 
          (let rec t_1_4_5 = ((mappend_lh__d1_d3 t_9_6) ys_1_2_6) in
            (let rec h_1_2_6 = h_1_2_5 in
              (fun ys_1_2_7 -> 
                (`LH_C(h_1_2_6, ((mappend_lh__d1_d4 t_1_4_5) ys_1_2_7))))))))) in
      (let rec h_1_2_7 = 't' in
        (fun ys_1_2_8 -> 
          (let rec t_1_4_6 = ((mappend_lh__d1_d3 t_9_5) ys_1_2_8) in
            (let rec h_1_2_8 = h_1_2_7 in
              (fun ys_1_2_9 -> 
                (`LH_C(h_1_2_8, ((mappend_lh__d1_d4 t_1_4_6) ys_1_2_9))))))))) in
      (let rec h_1_2_9 = 'c' in
        (fun ys_1_3_0 -> 
          (let rec t_1_4_7 = ((mappend_lh__d1_d3 t_9_4) ys_1_3_0) in
            (let rec h_1_3_0 = h_1_2_9 in
              (fun ys_1_3_1 -> 
                (`LH_C(h_1_3_0, ((mappend_lh__d1_d4 t_1_4_7) ys_1_3_1))))))))) in
      (let rec h_1_3_1 = 'n' in
        (fun ys_1_3_2 -> 
          (let rec t_1_4_8 = ((mappend_lh__d1_d3 t_9_3) ys_1_3_2) in
            (let rec h_1_3_2 = h_1_3_1 in
              (fun ys_1_3_3 -> 
                (`LH_C(h_1_3_2, ((mappend_lh__d1_d4 t_1_4_8) ys_1_3_3))))))))) in
      (let rec h_1_3_3 = 'u' in
        (fun ys_1_3_4 -> 
          (let rec t_1_4_9 = ((mappend_lh__d1_d3 t_9_2) ys_1_3_4) in
            (let rec h_1_3_4 = h_1_3_3 in
              (fun ys_1_3_5 -> 
                (`LH_C(h_1_3_4, ((mappend_lh__d1_d4 t_1_4_9) ys_1_3_5))))))))) in
      (let rec h_1_3_5 = 'f' in
        (fun ys_1_3_6 -> 
          (let rec t_1_5_0 = ((mappend_lh__d1_d3 t_9_1) ys_1_3_6) in
            (let rec h_1_3_6 = h_1_3_5 in
              (fun ys_1_3_7 -> 
                (`LH_C(h_1_3_6, ((mappend_lh__d1_d4 t_1_5_0) ys_1_3_7))))))))) in
      (let rec h_1_3_7 = ' ' in
        (fun ys_1_3_8 -> 
          (let rec t_1_5_1 = ((mappend_lh__d1_d3 t_9_0) ys_1_3_8) in
            (let rec h_1_3_8 = h_1_3_7 in
              (fun ys_1_3_9 -> 
                (`LH_C(h_1_3_8, ((mappend_lh__d1_d4 t_1_5_1) ys_1_3_9))))))))) in
      (let rec h_1_3_9 = 's' in
        (fun ys_1_4_0 -> 
          (let rec t_1_5_2 = ((mappend_lh__d1_d3 t_8_9) ys_1_4_0) in
            (let rec h_1_4_0 = h_1_3_9 in
              (fun ys_1_4_1 -> 
                (`LH_C(h_1_4_0, ((mappend_lh__d1_d4 t_1_5_2) ys_1_4_1))))))))) in
      (let rec h_1_4_1 = 'g' in
        (fun ys_1_4_2 -> 
          (let rec t_1_5_3 = ((mappend_lh__d1_d3 t_8_8) ys_1_4_2) in
            (let rec h_1_4_2 = h_1_4_1 in
              (fun ys_1_4_3 -> 
                (`LH_C(h_1_4_2, ((mappend_lh__d1_d4 t_1_5_3) ys_1_4_3))))))))) in
      (let rec h_1_4_3 = 'u' in
        (fun ys_1_4_4 -> 
          (let rec t_1_5_4 = ((mappend_lh__d1_d3 t_8_7) ys_1_4_4) in
            (let rec h_1_4_4 = h_1_4_3 in
              (fun ys_1_4_5 -> 
                (`LH_C(h_1_4_4, ((mappend_lh__d1_d4 t_1_5_4) ys_1_4_5))))))))) in
      (let rec h_1_4_5 = 'H' in
        (fun ys_1_4_6 -> 
          (let rec t_1_5_5 = ((mappend_lh__d1_d3 t_8_6) ys_1_4_6) in
            (let rec h_1_4_6 = h_1_4_5 in
              (fun ys_1_4_7 -> 
                (`LH_C(h_1_4_6, ((mappend_lh__d1_d4 t_1_5_5) ys_1_4_7))))))))) in
      (let rec h_1_4_7 = ' ' in
        (fun ys_1_4_8 -> 
          (let rec t_1_5_6 = ((mappend_lh__d1_d3 t_8_5) ys_1_4_8) in
            (let rec h_1_4_8 = h_1_4_7 in
              (fun ys_1_4_9 -> 
                (`LH_C(h_1_4_8, ((mappend_lh__d1_d4 t_1_5_6) ys_1_4_9))))))))) in
      (let rec h_1_4_9 = 'e' in
        (fun ys_1_5_0 -> 
          (let rec t_1_5_7 = ((mappend_lh__d1_d3 t_8_4) ys_1_5_0) in
            (let rec h_1_5_0 = h_1_4_9 in
              (fun ys_1_5_1 -> 
                (`LH_C(h_1_5_0, ((mappend_lh__d1_d4 t_1_5_7) ys_1_5_1))))))))) in
      (let rec h_1_5_1 = 'h' in
        (fun ys_1_5_2 -> 
          (let rec t_1_5_8 = ((mappend_lh__d1_d3 t_8_3) ys_1_5_2) in
            (let rec h_1_5_2 = h_1_5_1 in
              (fun ys_1_5_3 -> 
                (`LH_C(h_1_5_2, ((mappend_lh__d1_d4 t_1_5_8) ys_1_5_3))))))))) in
      (let rec h_1_5_3 = 't' in
        (fun ys_1_5_4 -> 
          (let rec t_1_5_9 = ((mappend_lh__d1_d3 t_8_2) ys_1_5_4) in
            (let rec h_1_5_4 = h_1_5_3 in
              (fun ys_1_5_5 -> 
                (`LH_C(h_1_5_4, ((mappend_lh__d1_d4 t_1_5_9) ys_1_5_5)))))))))) in
      (fun _lh_dummy_2 -> 
        ((mappend_lh__d1_d3 h_7_6) (concat_lh__d1 t_8))))) in
    (let rec h_1_5_5 = ((at_lh__d2 (let rec _lh_at_LH_P2_1_2 = 8 in
      (let rec _lh_at_LH_P2_0_2 = 17 in
        (fun _lh_at_arg2_3 -> 
          ((mappend_lh__d8 ((goto_lh__d3 _lh_at_LH_P2_0_2) _lh_at_LH_P2_1_2)) _lh_at_arg2_3))))) (let rec t_1_6_0 = (let rec t_1_6_1 = (let rec t_1_6_2 = (let rec t_1_6_3 = (let rec t_1_6_4 = (let rec t_1_6_5 = (let rec t_1_6_6 = (let rec t_1_6_7 = (let rec t_1_6_8 = (let rec t_1_6_9 = (let rec t_1_7_0 = (let rec t_1_7_1 = (let rec t_1_7_2 = (let rec t_1_7_3 = (let rec t_1_7_4 = (let rec t_1_7_5 = (let rec t_1_7_6 = (let rec t_1_7_7 = (let rec t_1_7_8 = (let rec t_1_7_9 = (let rec t_1_8_0 = (let rec t_1_8_1 = (let rec t_1_8_2 = (let rec t_1_8_3 = (let rec t_1_8_4 = (let rec t_1_8_5 = (let rec t_1_8_6 = (let rec t_1_8_7 = (let rec t_1_8_8 = (let rec t_1_8_9 = (let rec t_1_9_0 = (let rec t_1_9_1 = (let rec t_1_9_2 = (let rec t_1_9_3 = (let rec t_1_9_4 = (let rec t_1_9_5 = (let rec t_1_9_6 = (let rec t_1_9_7 = (let rec t_1_9_8 = (let rec t_1_9_9 = (let rec t_2_0_0 = (let rec t_2_0_1 = (fun ys_1_5_6 -> 
      ys_1_5_6) in
      (let rec h_1_5_6 = 'g' in
        (fun ys_1_5_7 -> 
          (let rec t_2_0_2 = ((mappend_lh__d1_d3 t_2_0_1) ys_1_5_7) in
            (let rec h_1_5_7 = h_1_5_6 in
              (fun ys_1_5_8 -> 
                (`LH_C(h_1_5_7, ((mappend_lh__d1_d4 t_2_0_2) ys_1_5_8))))))))) in
      (let rec h_1_5_8 = 'n' in
        (fun ys_1_5_9 -> 
          (let rec t_2_0_3 = ((mappend_lh__d1_d3 t_2_0_0) ys_1_5_9) in
            (let rec h_1_5_9 = h_1_5_8 in
              (fun ys_1_6_0 -> 
                (`LH_C(h_1_5_9, ((mappend_lh__d1_d4 t_2_0_3) ys_1_6_0))))))))) in
      (let rec h_1_6_0 = 'i' in
        (fun ys_1_6_1 -> 
          (let rec t_2_0_4 = ((mappend_lh__d1_d3 t_1_9_9) ys_1_6_1) in
            (let rec h_1_6_1 = h_1_6_0 in
              (fun ys_1_6_2 -> 
                (`LH_C(h_1_6_1, ((mappend_lh__d1_d4 t_2_0_4) ys_1_6_2))))))))) in
      (let rec h_1_6_2 = 's' in
        (fun ys_1_6_3 -> 
          (let rec t_2_0_5 = ((mappend_lh__d1_d3 t_1_9_8) ys_1_6_3) in
            (let rec h_1_6_3 = h_1_6_2 in
              (fun ys_1_6_4 -> 
                (`LH_C(h_1_6_3, ((mappend_lh__d1_d4 t_2_0_5) ys_1_6_4))))))))) in
      (let rec h_1_6_4 = 'u' in
        (fun ys_1_6_5 -> 
          (let rec t_2_0_6 = ((mappend_lh__d1_d3 t_1_9_7) ys_1_6_5) in
            (let rec h_1_6_5 = h_1_6_4 in
              (fun ys_1_6_6 -> 
                (`LH_C(h_1_6_5, ((mappend_lh__d1_d4 t_2_0_6) ys_1_6_6))))))))) in
      (let rec h_1_6_6 = ' ' in
        (fun ys_1_6_7 -> 
          (let rec t_2_0_7 = ((mappend_lh__d1_d3 t_1_9_6) ys_1_6_7) in
            (let rec h_1_6_7 = h_1_6_6 in
              (fun ys_1_6_8 -> 
                (`LH_C(h_1_6_7, ((mappend_lh__d1_d4 t_2_0_7) ys_1_6_8))))))))) in
      (let rec h_1_6_8 = 's' in
        (fun ys_1_6_9 -> 
          (let rec t_2_0_8 = ((mappend_lh__d1_d3 t_1_9_5) ys_1_6_9) in
            (let rec h_1_6_9 = h_1_6_8 in
              (fun ys_1_7_0 -> 
                (`LH_C(h_1_6_9, ((mappend_lh__d1_d4 t_2_0_8) ys_1_7_0))))))))) in
      (let rec h_1_7_0 = 'm' in
        (fun ys_1_7_1 -> 
          (let rec t_2_0_9 = ((mappend_lh__d1_d3 t_1_9_4) ys_1_7_1) in
            (let rec h_1_7_1 = h_1_7_0 in
              (fun ys_1_7_2 -> 
                (`LH_C(h_1_7_1, ((mappend_lh__d1_d4 t_2_0_9) ys_1_7_2))))))))) in
      (let rec h_1_7_2 = 'a' in
        (fun ys_1_7_3 -> 
          (let rec t_2_1_0 = ((mappend_lh__d1_d3 t_1_9_3) ys_1_7_3) in
            (let rec h_1_7_3 = h_1_7_2 in
              (fun ys_1_7_4 -> 
                (`LH_C(h_1_7_3, ((mappend_lh__d1_d4 t_2_1_0) ys_1_7_4))))))))) in
      (let rec h_1_7_4 = 'r' in
        (fun ys_1_7_5 -> 
          (let rec t_2_1_1 = ((mappend_lh__d1_d3 t_1_9_2) ys_1_7_5) in
            (let rec h_1_7_5 = h_1_7_4 in
              (fun ys_1_7_6 -> 
                (`LH_C(h_1_7_5, ((mappend_lh__d1_d4 t_2_1_1) ys_1_7_6))))))))) in
      (let rec h_1_7_6 = 'g' in
        (fun ys_1_7_7 -> 
          (let rec t_2_1_2 = ((mappend_lh__d1_d3 t_1_9_1) ys_1_7_7) in
            (let rec h_1_7_7 = h_1_7_6 in
              (fun ys_1_7_8 -> 
                (`LH_C(h_1_7_7, ((mappend_lh__d1_d4 t_2_1_2) ys_1_7_8))))))))) in
      (let rec h_1_7_8 = 'o' in
        (fun ys_1_7_9 -> 
          (let rec t_2_1_3 = ((mappend_lh__d1_d3 t_1_9_0) ys_1_7_9) in
            (let rec h_1_7_9 = h_1_7_8 in
              (fun ys_1_8_0 -> 
                (`LH_C(h_1_7_9, ((mappend_lh__d1_d4 t_2_1_3) ys_1_8_0))))))))) in
      (let rec h_1_8_0 = 'r' in
        (fun ys_1_8_1 -> 
          (let rec t_2_1_4 = ((mappend_lh__d1_d3 t_1_8_9) ys_1_8_1) in
            (let rec h_1_8_1 = h_1_8_0 in
              (fun ys_1_8_2 -> 
                (`LH_C(h_1_8_1, ((mappend_lh__d1_d4 t_2_1_4) ys_1_8_2))))))))) in
      (let rec h_1_8_2 = 'p' in
        (fun ys_1_8_3 -> 
          (let rec t_2_1_5 = ((mappend_lh__d1_d3 t_1_8_8) ys_1_8_3) in
            (let rec h_1_8_3 = h_1_8_2 in
              (fun ys_1_8_4 -> 
                (`LH_C(h_1_8_3, ((mappend_lh__d1_d4 t_2_1_5) ys_1_8_4))))))))) in
      (let rec h_1_8_4 = ' ' in
        (fun ys_1_8_5 -> 
          (let rec t_2_1_6 = ((mappend_lh__d1_d3 t_1_8_7) ys_1_8_5) in
            (let rec h_1_8_5 = h_1_8_4 in
              (fun ys_1_8_6 -> 
                (`LH_C(h_1_8_5, ((mappend_lh__d1_d4 t_2_1_6) ys_1_8_6))))))))) in
      (let rec h_1_8_6 = 'e' in
        (fun ys_1_8_7 -> 
          (let rec t_2_1_7 = ((mappend_lh__d1_d3 t_1_8_6) ys_1_8_7) in
            (let rec h_1_8_7 = h_1_8_6 in
              (fun ys_1_8_8 -> 
                (`LH_C(h_1_8_7, ((mappend_lh__d1_d4 t_2_1_7) ys_1_8_8))))))))) in
      (let rec h_1_8_8 = 'v' in
        (fun ys_1_8_9 -> 
          (let rec t_2_1_8 = ((mappend_lh__d1_d3 t_1_8_5) ys_1_8_9) in
            (let rec h_1_8_9 = h_1_8_8 in
              (fun ys_1_9_0 -> 
                (`LH_C(h_1_8_9, ((mappend_lh__d1_d4 t_2_1_8) ys_1_9_0))))))))) in
      (let rec h_1_9_0 = 'i' in
        (fun ys_1_9_1 -> 
          (let rec t_2_1_9 = ((mappend_lh__d1_d3 t_1_8_4) ys_1_9_1) in
            (let rec h_1_9_1 = h_1_9_0 in
              (fun ys_1_9_2 -> 
                (`LH_C(h_1_9_1, ((mappend_lh__d1_d4 t_2_1_9) ys_1_9_2))))))))) in
      (let rec h_1_9_2 = 't' in
        (fun ys_1_9_3 -> 
          (let rec t_2_2_0 = ((mappend_lh__d1_d3 t_1_8_3) ys_1_9_3) in
            (let rec h_1_9_3 = h_1_9_2 in
              (fun ys_1_9_4 -> 
                (`LH_C(h_1_9_3, ((mappend_lh__d1_d4 t_2_2_0) ys_1_9_4))))))))) in
      (let rec h_1_9_4 = 'c' in
        (fun ys_1_9_5 -> 
          (let rec t_2_2_1 = ((mappend_lh__d1_d3 t_1_8_2) ys_1_9_5) in
            (let rec h_1_9_5 = h_1_9_4 in
              (fun ys_1_9_6 -> 
                (`LH_C(h_1_9_5, ((mappend_lh__d1_d4 t_2_2_1) ys_1_9_6))))))))) in
      (let rec h_1_9_6 = 'a' in
        (fun ys_1_9_7 -> 
          (let rec t_2_2_2 = ((mappend_lh__d1_d3 t_1_8_1) ys_1_9_7) in
            (let rec h_1_9_7 = h_1_9_6 in
              (fun ys_1_9_8 -> 
                (`LH_C(h_1_9_7, ((mappend_lh__d1_d4 t_2_2_2) ys_1_9_8))))))))) in
      (let rec h_1_9_8 = 'r' in
        (fun ys_1_9_9 -> 
          (let rec t_2_2_3 = ((mappend_lh__d1_d3 t_1_8_0) ys_1_9_9) in
            (let rec h_1_9_9 = h_1_9_8 in
              (fun ys_2_0_0 -> 
                (`LH_C(h_1_9_9, ((mappend_lh__d1_d4 t_2_2_3) ys_2_0_0))))))))) in
      (let rec h_2_0_0 = 'e' in
        (fun ys_2_0_1 -> 
          (let rec t_2_2_4 = ((mappend_lh__d1_d3 t_1_7_9) ys_2_0_1) in
            (let rec h_2_0_1 = h_2_0_0 in
              (fun ys_2_0_2 -> 
                (`LH_C(h_2_0_1, ((mappend_lh__d1_d4 t_2_2_4) ys_2_0_2))))))))) in
      (let rec h_2_0_2 = 't' in
        (fun ys_2_0_3 -> 
          (let rec t_2_2_5 = ((mappend_lh__d1_d3 t_1_7_8) ys_2_0_3) in
            (let rec h_2_0_3 = h_2_0_2 in
              (fun ys_2_0_4 -> 
                (`LH_C(h_2_0_3, ((mappend_lh__d1_d4 t_2_2_5) ys_2_0_4))))))))) in
      (let rec h_2_0_4 = 'n' in
        (fun ys_2_0_5 -> 
          (let rec t_2_2_6 = ((mappend_lh__d1_d3 t_1_7_7) ys_2_0_5) in
            (let rec h_2_0_5 = h_2_0_4 in
              (fun ys_2_0_6 -> 
                (`LH_C(h_2_0_5, ((mappend_lh__d1_d4 t_2_2_6) ys_2_0_6))))))))) in
      (let rec h_2_0_6 = 'i' in
        (fun ys_2_0_7 -> 
          (let rec t_2_2_7 = ((mappend_lh__d1_d3 t_1_7_6) ys_2_0_7) in
            (let rec h_2_0_7 = h_2_0_6 in
              (fun ys_2_0_8 -> 
                (`LH_C(h_2_0_7, ((mappend_lh__d1_d4 t_2_2_7) ys_2_0_8))))))))) in
      (let rec h_2_0_8 = ' ' in
        (fun ys_2_0_9 -> 
          (let rec t_2_2_8 = ((mappend_lh__d1_d3 t_1_7_5) ys_2_0_9) in
            (let rec h_2_0_9 = h_2_0_8 in
              (fun ys_2_1_0 -> 
                (`LH_C(h_2_0_9, ((mappend_lh__d1_d4 t_2_2_8) ys_2_1_0))))))))) in
      (let rec h_2_1_0 = 'd' in
        (fun ys_2_1_1 -> 
          (let rec t_2_2_9 = ((mappend_lh__d1_d3 t_1_7_4) ys_2_1_1) in
            (let rec h_2_1_1 = h_2_1_0 in
              (fun ys_2_1_2 -> 
                (`LH_C(h_2_1_1, ((mappend_lh__d1_d4 t_2_2_9) ys_2_1_2))))))))) in
      (let rec h_2_1_2 = 'e' in
        (fun ys_2_1_3 -> 
          (let rec t_2_3_0 = ((mappend_lh__d1_d3 t_1_7_3) ys_2_1_3) in
            (let rec h_2_1_3 = h_2_1_2 in
              (fun ys_2_1_4 -> 
                (`LH_C(h_2_1_3, ((mappend_lh__d1_d4 t_2_3_0) ys_2_1_4))))))))) in
      (let rec h_2_1_4 = 's' in
        (fun ys_2_1_5 -> 
          (let rec t_2_3_1 = ((mappend_lh__d1_d3 t_1_7_2) ys_2_1_5) in
            (let rec h_2_1_5 = h_2_1_4 in
              (fun ys_2_1_6 -> 
                (`LH_C(h_2_1_5, ((mappend_lh__d1_d4 t_2_3_1) ys_2_1_6))))))))) in
      (let rec h_2_1_6 = 'a' in
        (fun ys_2_1_7 -> 
          (let rec t_2_3_2 = ((mappend_lh__d1_d3 t_1_7_1) ys_2_1_7) in
            (let rec h_2_1_7 = h_2_1_6 in
              (fun ys_2_1_8 -> 
                (`LH_C(h_2_1_7, ((mappend_lh__d1_d4 t_2_3_2) ys_2_1_8))))))))) in
      (let rec h_2_1_8 = 'b' in
        (fun ys_2_1_9 -> 
          (let rec t_2_3_3 = ((mappend_lh__d1_d3 t_1_7_0) ys_2_1_9) in
            (let rec h_2_1_9 = h_2_1_8 in
              (fun ys_2_2_0 -> 
                (`LH_C(h_2_1_9, ((mappend_lh__d1_d4 t_2_3_3) ys_2_2_0))))))))) in
      (let rec h_2_2_0 = '-' in
        (fun ys_2_2_1 -> 
          (let rec t_2_3_4 = ((mappend_lh__d1_d3 t_1_6_9) ys_2_2_1) in
            (let rec h_2_2_1 = h_2_2_0 in
              (fun ys_2_2_2 -> 
                (`LH_C(h_2_2_1, ((mappend_lh__d1_d4 t_2_3_4) ys_2_2_2))))))))) in
      (let rec h_2_2_2 = 'n' in
        (fun ys_2_2_3 -> 
          (let rec t_2_3_5 = ((mappend_lh__d1_d3 t_1_6_8) ys_2_2_3) in
            (let rec h_2_2_3 = h_2_2_2 in
              (fun ys_2_2_4 -> 
                (`LH_C(h_2_2_3, ((mappend_lh__d1_d4 t_2_3_5) ys_2_2_4))))))))) in
      (let rec h_2_2_4 = 'e' in
        (fun ys_2_2_5 -> 
          (let rec t_2_3_6 = ((mappend_lh__d1_d3 t_1_6_7) ys_2_2_5) in
            (let rec h_2_2_5 = h_2_2_4 in
              (fun ys_2_2_6 -> 
                (`LH_C(h_2_2_5, ((mappend_lh__d1_d4 t_2_3_6) ys_2_2_6))))))))) in
      (let rec h_2_2_6 = 'e' in
        (fun ys_2_2_7 -> 
          (let rec t_2_3_7 = ((mappend_lh__d1_d3 t_1_6_6) ys_2_2_7) in
            (let rec h_2_2_7 = h_2_2_6 in
              (fun ys_2_2_8 -> 
                (`LH_C(h_2_2_7, ((mappend_lh__d1_d4 t_2_3_7) ys_2_2_8))))))))) in
      (let rec h_2_2_8 = 'r' in
        (fun ys_2_2_9 -> 
          (let rec t_2_3_8 = ((mappend_lh__d1_d3 t_1_6_5) ys_2_2_9) in
            (let rec h_2_2_9 = h_2_2_8 in
              (fun ys_2_3_0 -> 
                (`LH_C(h_2_2_9, ((mappend_lh__d1_d4 t_2_3_8) ys_2_3_0))))))))) in
      (let rec h_2_3_0 = 'c' in
        (fun ys_2_3_1 -> 
          (let rec t_2_3_9 = ((mappend_lh__d1_d3 t_1_6_4) ys_2_3_1) in
            (let rec h_2_3_1 = h_2_3_0 in
              (fun ys_2_3_2 -> 
                (`LH_C(h_2_3_1, ((mappend_lh__d1_d4 t_2_3_9) ys_2_3_2))))))))) in
      (let rec h_2_3_2 = 's' in
        (fun ys_2_3_3 -> 
          (let rec t_2_4_0 = ((mappend_lh__d1_d3 t_1_6_3) ys_2_3_3) in
            (let rec h_2_3_3 = h_2_3_2 in
              (fun ys_2_3_4 -> 
                (`LH_C(h_2_3_3, ((mappend_lh__d1_d4 t_2_4_0) ys_2_3_4))))))))) in
      (let rec h_2_3_4 = ' ' in
        (fun ys_2_3_5 -> 
          (let rec t_2_4_1 = ((mappend_lh__d1_d3 t_1_6_2) ys_2_3_5) in
            (let rec h_2_3_5 = h_2_3_4 in
              (fun ys_2_3_6 -> 
                (`LH_C(h_2_3_5, ((mappend_lh__d1_d4 t_2_4_1) ys_2_3_6))))))))) in
      (let rec h_2_3_6 = 'o' in
        (fun ys_2_3_7 -> 
          (let rec t_2_4_2 = ((mappend_lh__d1_d3 t_1_6_1) ys_2_3_7) in
            (let rec h_2_3_7 = h_2_3_6 in
              (fun ys_2_3_8 -> 
                (`LH_C(h_2_3_7, ((mappend_lh__d1_d4 t_2_4_2) ys_2_3_8))))))))) in
      (let rec h_2_3_8 = 't' in
        (fun ys_2_3_9 -> 
          (let rec t_2_4_3 = ((mappend_lh__d1_d3 t_1_6_0) ys_2_3_9) in
            (let rec h_2_3_9 = h_2_3_8 in
              (fun ys_2_4_0 -> 
                (`LH_C(h_2_3_9, ((mappend_lh__d1_d4 t_2_4_3) ys_2_4_0)))))))))) in
      (fun _lh_dummy_3 -> 
        ((mappend_lh__d1_d3 h_1_5_5) (concat_lh__d1 t_7))))) in
    (let rec h_2_4_0 = ((at_lh__d1 (let rec _lh_at_LH_P2_1_3 = 7 in
      (let rec _lh_at_LH_P2_0_3 = 17 in
        (fun _lh_at_arg2_4 -> 
          ((mappend_lh__d7 ((goto_lh__d2 _lh_at_LH_P2_0_3) _lh_at_LH_P2_1_3)) _lh_at_arg2_4))))) (let rec t_2_4_4 = (let rec t_2_4_5 = (let rec t_2_4_6 = (let rec t_2_4_7 = (let rec t_2_4_8 = (let rec t_2_4_9 = (let rec t_2_5_0 = (let rec t_2_5_1 = (let rec t_2_5_2 = (let rec t_2_5_3 = (let rec t_2_5_4 = (let rec t_2_5_5 = (let rec t_2_5_6 = (let rec t_2_5_7 = (let rec t_2_5_8 = (let rec t_2_5_9 = (let rec t_2_6_0 = (let rec t_2_6_1 = (let rec t_2_6_2 = (let rec t_2_6_3 = (let rec t_2_6_4 = (let rec t_2_6_5 = (let rec t_2_6_6 = (let rec t_2_6_7 = (let rec t_2_6_8 = (let rec t_2_6_9 = (let rec t_2_7_0 = (let rec t_2_7_1 = (let rec t_2_7_2 = (let rec t_2_7_3 = (let rec t_2_7_4 = (let rec t_2_7_5 = (let rec t_2_7_6 = (let rec t_2_7_7 = (let rec t_2_7_8 = (let rec t_2_7_9 = (let rec t_2_8_0 = (let rec t_2_8_1 = (let rec t_2_8_2 = (let rec t_2_8_3 = (let rec t_2_8_4 = (let rec t_2_8_5 = (fun ys_2_4_1 -> 
      ys_2_4_1) in
      (let rec h_2_4_1 = 'h' in
        (fun ys_2_4_2 -> 
          (let rec t_2_8_6 = ((mappend_lh__d1_d3 t_2_8_5) ys_2_4_2) in
            (let rec h_2_4_2 = h_2_4_1 in
              (fun ys_2_4_3 -> 
                (`LH_C(h_2_4_2, ((mappend_lh__d1_d4 t_2_8_6) ys_2_4_3))))))))) in
      (let rec h_2_4_3 = 'c' in
        (fun ys_2_4_4 -> 
          (let rec t_2_8_7 = ((mappend_lh__d1_d3 t_2_8_4) ys_2_4_4) in
            (let rec h_2_4_4 = h_2_4_3 in
              (fun ys_2_4_5 -> 
                (`LH_C(h_2_4_4, ((mappend_lh__d1_d4 t_2_8_7) ys_2_4_5))))))))) in
      (let rec h_2_4_5 = 'a' in
        (fun ys_2_4_6 -> 
          (let rec t_2_8_8 = ((mappend_lh__d1_d3 t_2_8_3) ys_2_4_6) in
            (let rec h_2_4_6 = h_2_4_5 in
              (fun ys_2_4_7 -> 
                (`LH_C(h_2_4_6, ((mappend_lh__d1_d4 t_2_8_8) ys_2_4_7))))))))) in
      (let rec h_2_4_7 = 'o' in
        (fun ys_2_4_8 -> 
          (let rec t_2_8_9 = ((mappend_lh__d1_d3 t_2_8_2) ys_2_4_8) in
            (let rec h_2_4_8 = h_2_4_7 in
              (fun ys_2_4_9 -> 
                (`LH_C(h_2_4_8, ((mappend_lh__d1_d4 t_2_8_9) ys_2_4_9))))))))) in
      (let rec h_2_4_9 = 'r' in
        (fun ys_2_5_0 -> 
          (let rec t_2_9_0 = ((mappend_lh__d1_d3 t_2_8_1) ys_2_5_0) in
            (let rec h_2_5_0 = h_2_4_9 in
              (fun ys_2_5_1 -> 
                (`LH_C(h_2_5_0, ((mappend_lh__d1_d4 t_2_9_0) ys_2_5_1))))))))) in
      (let rec h_2_5_1 = 'p' in
        (fun ys_2_5_2 -> 
          (let rec t_2_9_1 = ((mappend_lh__d1_d3 t_2_8_0) ys_2_5_2) in
            (let rec h_2_5_2 = h_2_5_1 in
              (fun ys_2_5_3 -> 
                (`LH_C(h_2_5_2, ((mappend_lh__d1_d4 t_2_9_1) ys_2_5_3))))))))) in
      (let rec h_2_5_3 = 'p' in
        (fun ys_2_5_4 -> 
          (let rec t_2_9_2 = ((mappend_lh__d1_d3 t_2_7_9) ys_2_5_4) in
            (let rec h_2_5_4 = h_2_5_3 in
              (fun ys_2_5_5 -> 
                (`LH_C(h_2_5_4, ((mappend_lh__d1_d4 t_2_9_2) ys_2_5_5))))))))) in
      (let rec h_2_5_5 = 'a' in
        (fun ys_2_5_6 -> 
          (let rec t_2_9_3 = ((mappend_lh__d1_d3 t_2_7_8) ys_2_5_6) in
            (let rec h_2_5_6 = h_2_5_5 in
              (fun ys_2_5_7 -> 
                (`LH_C(h_2_5_6, ((mappend_lh__d1_d4 t_2_9_3) ys_2_5_7))))))))) in
      (let rec h_2_5_7 = ' ' in
        (fun ys_2_5_8 -> 
          (let rec t_2_9_4 = ((mappend_lh__d1_d3 t_2_7_7) ys_2_5_8) in
            (let rec h_2_5_8 = h_2_5_7 in
              (fun ys_2_5_9 -> 
                (`LH_C(h_2_5_8, ((mappend_lh__d1_d4 t_2_9_4) ys_2_5_9))))))))) in
      (let rec h_2_5_9 = 'e' in
        (fun ys_2_6_0 -> 
          (let rec t_2_9_5 = ((mappend_lh__d1_d3 t_2_7_6) ys_2_6_0) in
            (let rec h_2_6_0 = h_2_5_9 in
              (fun ys_2_6_1 -> 
                (`LH_C(h_2_6_0, ((mappend_lh__d1_d4 t_2_9_5) ys_2_6_1))))))))) in
      (let rec h_2_6_1 = 'l' in
        (fun ys_2_6_2 -> 
          (let rec t_2_9_6 = ((mappend_lh__d1_d3 t_2_7_5) ys_2_6_2) in
            (let rec h_2_6_2 = h_2_6_1 in
              (fun ys_2_6_3 -> 
                (`LH_C(h_2_6_2, ((mappend_lh__d1_d4 t_2_9_6) ys_2_6_3))))))))) in
      (let rec h_2_6_3 = 'p' in
        (fun ys_2_6_4 -> 
          (let rec t_2_9_7 = ((mappend_lh__d1_d3 t_2_7_4) ys_2_6_4) in
            (let rec h_2_6_4 = h_2_6_3 in
              (fun ys_2_6_5 -> 
                (`LH_C(h_2_6_4, ((mappend_lh__d1_d4 t_2_9_7) ys_2_6_5))))))))) in
      (let rec h_2_6_5 = 'm' in
        (fun ys_2_6_6 -> 
          (let rec t_2_9_8 = ((mappend_lh__d1_d3 t_2_7_3) ys_2_6_6) in
            (let rec h_2_6_6 = h_2_6_5 in
              (fun ys_2_6_7 -> 
                (`LH_C(h_2_6_6, ((mappend_lh__d1_d4 t_2_9_8) ys_2_6_7))))))))) in
      (let rec h_2_6_7 = 'i' in
        (fun ys_2_6_8 -> 
          (let rec t_2_9_9 = ((mappend_lh__d1_d3 t_2_7_2) ys_2_6_8) in
            (let rec h_2_6_8 = h_2_6_7 in
              (fun ys_2_6_9 -> 
                (`LH_C(h_2_6_8, ((mappend_lh__d1_d4 t_2_9_9) ys_2_6_9))))))))) in
      (let rec h_2_6_9 = 's' in
        (fun ys_2_7_0 -> 
          (let rec t_3_0_0 = ((mappend_lh__d1_d3 t_2_7_1) ys_2_7_0) in
            (let rec h_2_7_0 = h_2_6_9 in
              (fun ys_2_7_1 -> 
                (`LH_C(h_2_7_0, ((mappend_lh__d1_d4 t_3_0_0) ys_2_7_1))))))))) in
      (let rec h_2_7_1 = ' ' in
        (fun ys_2_7_2 -> 
          (let rec t_3_0_1 = ((mappend_lh__d1_d3 t_2_7_0) ys_2_7_2) in
            (let rec h_2_7_2 = h_2_7_1 in
              (fun ys_2_7_3 -> 
                (`LH_C(h_2_7_2, ((mappend_lh__d1_d4 t_3_0_1) ys_2_7_3))))))))) in
      (let rec h_2_7_3 = 'a' in
        (fun ys_2_7_4 -> 
          (let rec t_3_0_2 = ((mappend_lh__d1_d3 t_2_6_9) ys_2_7_4) in
            (let rec h_2_7_4 = h_2_7_3 in
              (fun ys_2_7_5 -> 
                (`LH_C(h_2_7_4, ((mappend_lh__d1_d4 t_3_0_2) ys_2_7_5))))))))) in
      (let rec h_2_7_5 = ' ' in
        (fun ys_2_7_6 -> 
          (let rec t_3_0_3 = ((mappend_lh__d1_d3 t_2_6_8) ys_2_7_6) in
            (let rec h_2_7_6 = h_2_7_5 in
              (fun ys_2_7_7 -> 
                (`LH_C(h_2_7_6, ((mappend_lh__d1_d4 t_3_0_3) ys_2_7_7))))))))) in
      (let rec h_2_7_7 = 's' in
        (fun ys_2_7_8 -> 
          (let rec t_3_0_4 = ((mappend_lh__d1_d3 t_2_6_7) ys_2_7_8) in
            (let rec h_2_7_8 = h_2_7_7 in
              (fun ys_2_7_9 -> 
                (`LH_C(h_2_7_8, ((mappend_lh__d1_d4 t_3_0_4) ys_2_7_9))))))))) in
      (let rec h_2_7_9 = 'e' in
        (fun ys_2_8_0 -> 
          (let rec t_3_0_5 = ((mappend_lh__d1_d3 t_2_6_6) ys_2_8_0) in
            (let rec h_2_8_0 = h_2_7_9 in
              (fun ys_2_8_1 -> 
                (`LH_C(h_2_8_0, ((mappend_lh__d1_d4 t_3_0_5) ys_2_8_1))))))))) in
      (let rec h_2_8_1 = 't' in
        (fun ys_2_8_2 -> 
          (let rec t_3_0_6 = ((mappend_lh__d1_d3 t_2_6_5) ys_2_8_2) in
            (let rec h_2_8_2 = h_2_8_1 in
              (fun ys_2_8_3 -> 
                (`LH_C(h_2_8_2, ((mappend_lh__d1_d4 t_3_0_6) ys_2_8_3))))))))) in
      (let rec h_2_8_3 = 'a' in
        (fun ys_2_8_4 -> 
          (let rec t_3_0_7 = ((mappend_lh__d1_d3 t_2_6_4) ys_2_8_4) in
            (let rec h_2_8_4 = h_2_8_3 in
              (fun ys_2_8_5 -> 
                (`LH_C(h_2_8_4, ((mappend_lh__d1_d4 t_3_0_7) ys_2_8_5))))))))) in
      (let rec h_2_8_5 = 'r' in
        (fun ys_2_8_6 -> 
          (let rec t_3_0_8 = ((mappend_lh__d1_d3 t_2_6_3) ys_2_8_6) in
            (let rec h_2_8_6 = h_2_8_5 in
              (fun ys_2_8_7 -> 
                (`LH_C(h_2_8_6, ((mappend_lh__d1_d4 t_3_0_8) ys_2_8_7))))))))) in
      (let rec h_2_8_7 = 't' in
        (fun ys_2_8_8 -> 
          (let rec t_3_0_9 = ((mappend_lh__d1_d3 t_2_6_2) ys_2_8_8) in
            (let rec h_2_8_8 = h_2_8_7 in
              (fun ys_2_8_9 -> 
                (`LH_C(h_2_8_8, ((mappend_lh__d1_d4 t_3_0_9) ys_2_8_9))))))))) in
      (let rec h_2_8_9 = 's' in
        (fun ys_2_9_0 -> 
          (let rec t_3_1_0 = ((mappend_lh__d1_d3 t_2_6_1) ys_2_9_0) in
            (let rec h_2_9_0 = h_2_8_9 in
              (fun ys_2_9_1 -> 
                (`LH_C(h_2_9_0, ((mappend_lh__d1_d4 t_3_1_0) ys_2_9_1))))))))) in
      (let rec h_2_9_1 = 'u' in
        (fun ys_2_9_2 -> 
          (let rec t_3_1_1 = ((mappend_lh__d1_d3 t_2_6_0) ys_2_9_2) in
            (let rec h_2_9_2 = h_2_9_1 in
              (fun ys_2_9_3 -> 
                (`LH_C(h_2_9_2, ((mappend_lh__d1_d4 t_3_1_1) ys_2_9_3))))))))) in
      (let rec h_2_9_3 = 'l' in
        (fun ys_2_9_4 -> 
          (let rec t_3_1_2 = ((mappend_lh__d1_d3 t_2_5_9) ys_2_9_4) in
            (let rec h_2_9_4 = h_2_9_3 in
              (fun ys_2_9_5 -> 
                (`LH_C(h_2_9_4, ((mappend_lh__d1_d4 t_3_1_2) ys_2_9_5))))))))) in
      (let rec h_2_9_5 = 'l' in
        (fun ys_2_9_6 -> 
          (let rec t_3_1_3 = ((mappend_lh__d1_d3 t_2_5_8) ys_2_9_6) in
            (let rec h_2_9_6 = h_2_9_5 in
              (fun ys_2_9_7 -> 
                (`LH_C(h_2_9_6, ((mappend_lh__d1_d4 t_3_1_3) ys_2_9_7))))))))) in
      (let rec h_2_9_7 = 'i' in
        (fun ys_2_9_8 -> 
          (let rec t_3_1_4 = ((mappend_lh__d1_d3 t_2_5_7) ys_2_9_8) in
            (let rec h_2_9_8 = h_2_9_7 in
              (fun ys_2_9_9 -> 
                (`LH_C(h_2_9_8, ((mappend_lh__d1_d4 t_3_1_4) ys_2_9_9))))))))) in
      (let rec h_2_9_9 = ' ' in
        (fun ys_3_0_0 -> 
          (let rec t_3_1_5 = ((mappend_lh__d1_d3 t_2_5_6) ys_3_0_0) in
            (let rec h_3_0_0 = h_2_9_9 in
              (fun ys_3_0_1 -> 
                (`LH_C(h_3_0_0, ((mappend_lh__d1_d4 t_3_1_5) ys_3_0_1))))))))) in
      (let rec h_3_0_1 = 'm' in
        (fun ys_3_0_2 -> 
          (let rec t_3_1_6 = ((mappend_lh__d1_d3 t_2_5_5) ys_3_0_2) in
            (let rec h_3_0_2 = h_3_0_1 in
              (fun ys_3_0_3 -> 
                (`LH_C(h_3_0_2, ((mappend_lh__d1_d4 t_3_1_6) ys_3_0_3))))))))) in
      (let rec h_3_0_3 = 'a' in
        (fun ys_3_0_4 -> 
          (let rec t_3_1_7 = ((mappend_lh__d1_d3 t_2_5_4) ys_3_0_4) in
            (let rec h_3_0_4 = h_3_0_3 in
              (fun ys_3_0_5 -> 
                (`LH_C(h_3_0_4, ((mappend_lh__d1_d4 t_3_1_7) ys_3_0_5))))))))) in
      (let rec h_3_0_5 = 'r' in
        (fun ys_3_0_6 -> 
          (let rec t_3_1_8 = ((mappend_lh__d1_d3 t_2_5_3) ys_3_0_6) in
            (let rec h_3_0_6 = h_3_0_5 in
              (fun ys_3_0_7 -> 
                (`LH_C(h_3_0_6, ((mappend_lh__d1_d4 t_3_1_8) ys_3_0_7))))))))) in
      (let rec h_3_0_7 = 'g' in
        (fun ys_3_0_8 -> 
          (let rec t_3_1_9 = ((mappend_lh__d1_d3 t_2_5_2) ys_3_0_8) in
            (let rec h_3_0_8 = h_3_0_7 in
              (fun ys_3_0_9 -> 
                (`LH_C(h_3_0_8, ((mappend_lh__d1_d4 t_3_1_9) ys_3_0_9))))))))) in
      (let rec h_3_0_9 = 'o' in
        (fun ys_3_1_0 -> 
          (let rec t_3_2_0 = ((mappend_lh__d1_d3 t_2_5_1) ys_3_1_0) in
            (let rec h_3_1_0 = h_3_0_9 in
              (fun ys_3_1_1 -> 
                (`LH_C(h_3_1_0, ((mappend_lh__d1_d4 t_3_2_0) ys_3_1_1))))))))) in
      (let rec h_3_1_1 = 'r' in
        (fun ys_3_1_2 -> 
          (let rec t_3_2_1 = ((mappend_lh__d1_d3 t_2_5_0) ys_3_1_2) in
            (let rec h_3_1_2 = h_3_1_1 in
              (fun ys_3_1_3 -> 
                (`LH_C(h_3_1_2, ((mappend_lh__d1_d4 t_3_2_1) ys_3_1_3))))))))) in
      (let rec h_3_1_3 = 'p' in
        (fun ys_3_1_4 -> 
          (let rec t_3_2_2 = ((mappend_lh__d1_d3 t_2_4_9) ys_3_1_4) in
            (let rec h_3_1_4 = h_3_1_3 in
              (fun ys_3_1_5 -> 
                (`LH_C(h_3_1_4, ((mappend_lh__d1_d4 t_3_2_2) ys_3_1_5))))))))) in
      (let rec h_3_1_5 = ' ' in
        (fun ys_3_1_6 -> 
          (let rec t_3_2_3 = ((mappend_lh__d1_d3 t_2_4_8) ys_3_1_6) in
            (let rec h_3_1_6 = h_3_1_5 in
              (fun ys_3_1_7 -> 
                (`LH_C(h_3_1_6, ((mappend_lh__d1_d4 t_3_2_3) ys_3_1_7))))))))) in
      (let rec h_3_1_7 = 's' in
        (fun ys_3_1_8 -> 
          (let rec t_3_2_4 = ((mappend_lh__d1_d3 t_2_4_7) ys_3_1_8) in
            (let rec h_3_1_8 = h_3_1_7 in
              (fun ys_3_1_9 -> 
                (`LH_C(h_3_1_8, ((mappend_lh__d1_d4 t_3_2_4) ys_3_1_9))))))))) in
      (let rec h_3_1_9 = 'i' in
        (fun ys_3_2_0 -> 
          (let rec t_3_2_5 = ((mappend_lh__d1_d3 t_2_4_6) ys_3_2_0) in
            (let rec h_3_2_0 = h_3_1_9 in
              (fun ys_3_2_1 -> 
                (`LH_C(h_3_2_0, ((mappend_lh__d1_d4 t_3_2_5) ys_3_2_1))))))))) in
      (let rec h_3_2_1 = 'h' in
        (fun ys_3_2_2 -> 
          (let rec t_3_2_6 = ((mappend_lh__d1_d3 t_2_4_5) ys_3_2_2) in
            (let rec h_3_2_2 = h_3_2_1 in
              (fun ys_3_2_3 -> 
                (`LH_C(h_3_2_2, ((mappend_lh__d1_d4 t_3_2_6) ys_3_2_3))))))))) in
      (let rec h_3_2_3 = 'T' in
        (fun ys_3_2_4 -> 
          (let rec t_3_2_7 = ((mappend_lh__d1_d3 t_2_4_4) ys_3_2_4) in
            (let rec h_3_2_4 = h_3_2_3 in
              (fun ys_3_2_5 -> 
                (`LH_C(h_3_2_4, ((mappend_lh__d1_d4 t_3_2_7) ys_3_2_5)))))))))) in
      (fun _lh_dummy_4 -> 
        ((mappend_lh__d1_d3 h_2_4_0) (concat_lh__d1 t_6))))) in
    (let rec h_3_2_5 = ((at_lh__d4 (let rec _lh_at_LH_P2_1_4 = 5 in
      (let rec _lh_at_LH_P2_0_4 = 48 in
        (fun _lh_at_arg2_5 -> 
          ((mappend_lh__d1_d0 ((goto_lh__d5 _lh_at_LH_P2_0_4) _lh_at_LH_P2_1_4)) _lh_at_arg2_5))))) (let rec t_3_2_8 = (let rec t_3_2_9 = (let rec t_3_3_0 = (let rec t_3_3_1 = (let rec t_3_3_2 = (let rec t_3_3_3 = (let rec t_3_3_4 = (let rec t_3_3_5 = (let rec t_3_3_6 = (let rec t_3_3_7 = (let rec t_3_3_8 = (fun ys_3_2_6 -> 
      ys_3_2_6) in
      (let rec h_3_2_6 = '0' in
        (fun ys_3_2_7 -> 
          (let rec t_3_3_9 = ((mappend_lh__d1_d3 t_3_3_8) ys_3_2_7) in
            (let rec h_3_2_7 = h_3_2_6 in
              (fun ys_3_2_8 -> 
                (`LH_C(h_3_2_7, ((mappend_lh__d1_d4 t_3_3_9) ys_3_2_8))))))))) in
      (let rec h_3_2_8 = '.' in
        (fun ys_3_2_9 -> 
          (let rec t_3_4_0 = ((mappend_lh__d1_d3 t_3_3_7) ys_3_2_9) in
            (let rec h_3_2_9 = h_3_2_8 in
              (fun ys_3_3_0 -> 
                (`LH_C(h_3_2_9, ((mappend_lh__d1_d4 t_3_4_0) ys_3_3_0))))))))) in
      (let rec h_3_3_0 = '1' in
        (fun ys_3_3_1 -> 
          (let rec t_3_4_1 = ((mappend_lh__d1_d3 t_3_3_6) ys_3_3_1) in
            (let rec h_3_3_1 = h_3_3_0 in
              (fun ys_3_3_2 -> 
                (`LH_C(h_3_3_1, ((mappend_lh__d1_d4 t_3_4_1) ys_3_3_2))))))))) in
      (let rec h_3_3_2 = ' ' in
        (fun ys_3_3_3 -> 
          (let rec t_3_4_2 = ((mappend_lh__d1_d3 t_3_3_5) ys_3_3_3) in
            (let rec h_3_3_3 = h_3_3_2 in
              (fun ys_3_3_4 -> 
                (`LH_C(h_3_3_3, ((mappend_lh__d1_d4 t_3_4_2) ys_3_3_4))))))))) in
      (let rec h_3_3_4 = 'n' in
        (fun ys_3_3_5 -> 
          (let rec t_3_4_3 = ((mappend_lh__d1_d3 t_3_3_4) ys_3_3_5) in
            (let rec h_3_3_5 = h_3_3_4 in
              (fun ys_3_3_6 -> 
                (`LH_C(h_3_3_5, ((mappend_lh__d1_d4 t_3_4_3) ys_3_3_6))))))))) in
      (let rec h_3_3_6 = 'o' in
        (fun ys_3_3_7 -> 
          (let rec t_3_4_4 = ((mappend_lh__d1_d3 t_3_3_3) ys_3_3_7) in
            (let rec h_3_3_7 = h_3_3_6 in
              (fun ys_3_3_8 -> 
                (`LH_C(h_3_3_7, ((mappend_lh__d1_d4 t_3_4_4) ys_3_3_8))))))))) in
      (let rec h_3_3_8 = 'i' in
        (fun ys_3_3_9 -> 
          (let rec t_3_4_5 = ((mappend_lh__d1_d3 t_3_3_2) ys_3_3_9) in
            (let rec h_3_3_9 = h_3_3_8 in
              (fun ys_3_4_0 -> 
                (`LH_C(h_3_3_9, ((mappend_lh__d1_d4 t_3_4_5) ys_3_4_0))))))))) in
      (let rec h_3_4_0 = 's' in
        (fun ys_3_4_1 -> 
          (let rec t_3_4_6 = ((mappend_lh__d1_d3 t_3_3_1) ys_3_4_1) in
            (let rec h_3_4_1 = h_3_4_0 in
              (fun ys_3_4_2 -> 
                (`LH_C(h_3_4_1, ((mappend_lh__d1_d4 t_3_4_6) ys_3_4_2))))))))) in
      (let rec h_3_4_2 = 'r' in
        (fun ys_3_4_3 -> 
          (let rec t_3_4_7 = ((mappend_lh__d1_d3 t_3_3_0) ys_3_4_3) in
            (let rec h_3_4_3 = h_3_4_2 in
              (fun ys_3_4_4 -> 
                (`LH_C(h_3_4_3, ((mappend_lh__d1_d4 t_3_4_7) ys_3_4_4))))))))) in
      (let rec h_3_4_4 = 'e' in
        (fun ys_3_4_5 -> 
          (let rec t_3_4_8 = ((mappend_lh__d1_d3 t_3_2_9) ys_3_4_5) in
            (let rec h_3_4_5 = h_3_4_4 in
              (fun ys_3_4_6 -> 
                (`LH_C(h_3_4_5, ((mappend_lh__d1_d4 t_3_4_8) ys_3_4_6))))))))) in
      (let rec h_3_4_6 = 'V' in
        (fun ys_3_4_7 -> 
          (let rec t_3_4_9 = ((mappend_lh__d1_d3 t_3_2_8) ys_3_4_7) in
            (let rec h_3_4_7 = h_3_4_6 in
              (fun ys_3_4_8 -> 
                (`LH_C(h_3_4_7, ((mappend_lh__d1_d4 t_3_4_9) ys_3_4_8)))))))))) in
      (fun _lh_dummy_5 -> 
        ((mappend_lh__d1_d3 h_3_2_5) (concat_lh__d1 t_5))))) in
    (let rec h_3_4_8 = ((at_lh__d3 (let rec _lh_at_LH_P2_1_5 = 5 in
      (let rec _lh_at_LH_P2_0_5 = 17 in
        (fun _lh_at_arg2_6 -> 
          ((mappend_lh__d9 ((goto_lh__d4 _lh_at_LH_P2_0_5) _lh_at_LH_P2_1_5)) _lh_at_arg2_6))))) (highlight_lh__d1 (let rec t_3_5_0 = (let rec t_3_5_1 = (let rec t_3_5_2 = (let rec t_3_5_3 = (let rec t_3_5_4 = (let rec t_3_5_5 = (let rec t_3_5_6 = (let rec t_3_5_7 = (let rec t_3_5_8 = (let rec t_3_5_9 = (let rec t_3_6_0 = (let rec t_3_6_1 = (let rec t_3_6_2 = (let rec t_3_6_3 = (let rec t_3_6_4 = (let rec t_3_6_5 = (let rec t_3_6_6 = (let rec t_3_6_7 = (let rec t_3_6_8 = (let rec t_3_6_9 = (let rec t_3_7_0 = (fun ys_3_4_9 -> 
      ys_3_4_9) in
      (let rec h_3_4_9 = 'm' in
        (fun ys_3_5_0 -> 
          (let rec t_3_7_1 = ((mappend_lh__d4 t_3_7_0) ys_3_5_0) in
            (let rec h_3_5_0 = h_3_4_9 in
              (fun ys_3_5_1 -> 
                (let rec t_3_7_2 = ((mappend_lh__d1_d3 t_3_7_1) ys_3_5_1) in
                  (let rec h_3_5_1 = h_3_5_0 in
                    (fun ys_3_5_2 -> 
                      (`LH_C(h_3_5_1, ((mappend_lh__d1_d4 t_3_7_2) ys_3_5_2)))))))))))) in
      (let rec h_3_5_2 = 'a' in
        (fun ys_3_5_3 -> 
          (let rec t_3_7_3 = ((mappend_lh__d4 t_3_6_9) ys_3_5_3) in
            (let rec h_3_5_3 = h_3_5_2 in
              (fun ys_3_5_4 -> 
                (let rec t_3_7_4 = ((mappend_lh__d1_d3 t_3_7_3) ys_3_5_4) in
                  (let rec h_3_5_4 = h_3_5_3 in
                    (fun ys_3_5_5 -> 
                      (`LH_C(h_3_5_4, ((mappend_lh__d1_d4 t_3_7_4) ys_3_5_5)))))))))))) in
      (let rec h_3_5_5 = 'r' in
        (fun ys_3_5_6 -> 
          (let rec t_3_7_5 = ((mappend_lh__d4 t_3_6_8) ys_3_5_6) in
            (let rec h_3_5_6 = h_3_5_5 in
              (fun ys_3_5_7 -> 
                (let rec t_3_7_6 = ((mappend_lh__d1_d3 t_3_7_5) ys_3_5_7) in
                  (let rec h_3_5_7 = h_3_5_6 in
                    (fun ys_3_5_8 -> 
                      (`LH_C(h_3_5_7, ((mappend_lh__d1_d4 t_3_7_6) ys_3_5_8)))))))))))) in
      (let rec h_3_5_8 = 'g' in
        (fun ys_3_5_9 -> 
          (let rec t_3_7_7 = ((mappend_lh__d4 t_3_6_7) ys_3_5_9) in
            (let rec h_3_5_9 = h_3_5_8 in
              (fun ys_3_6_0 -> 
                (let rec t_3_7_8 = ((mappend_lh__d1_d3 t_3_7_7) ys_3_6_0) in
                  (let rec h_3_6_0 = h_3_5_9 in
                    (fun ys_3_6_1 -> 
                      (`LH_C(h_3_6_0, ((mappend_lh__d1_d4 t_3_7_8) ys_3_6_1)))))))))))) in
      (let rec h_3_6_1 = 'o' in
        (fun ys_3_6_2 -> 
          (let rec t_3_7_9 = ((mappend_lh__d4 t_3_6_6) ys_3_6_2) in
            (let rec h_3_6_2 = h_3_6_1 in
              (fun ys_3_6_3 -> 
                (let rec t_3_8_0 = ((mappend_lh__d1_d3 t_3_7_9) ys_3_6_3) in
                  (let rec h_3_6_3 = h_3_6_2 in
                    (fun ys_3_6_4 -> 
                      (`LH_C(h_3_6_3, ((mappend_lh__d1_d4 t_3_8_0) ys_3_6_4)))))))))))) in
      (let rec h_3_6_4 = 'r' in
        (fun ys_3_6_5 -> 
          (let rec t_3_8_1 = ((mappend_lh__d4 t_3_6_5) ys_3_6_5) in
            (let rec h_3_6_5 = h_3_6_4 in
              (fun ys_3_6_6 -> 
                (let rec t_3_8_2 = ((mappend_lh__d1_d3 t_3_8_1) ys_3_6_6) in
                  (let rec h_3_6_6 = h_3_6_5 in
                    (fun ys_3_6_7 -> 
                      (`LH_C(h_3_6_6, ((mappend_lh__d1_d4 t_3_8_2) ys_3_6_7)))))))))))) in
      (let rec h_3_6_7 = 'p' in
        (fun ys_3_6_8 -> 
          (let rec t_3_8_3 = ((mappend_lh__d4 t_3_6_4) ys_3_6_8) in
            (let rec h_3_6_8 = h_3_6_7 in
              (fun ys_3_6_9 -> 
                (let rec t_3_8_4 = ((mappend_lh__d1_d3 t_3_8_3) ys_3_6_9) in
                  (let rec h_3_6_9 = h_3_6_8 in
                    (fun ys_3_7_0 -> 
                      (`LH_C(h_3_6_9, ((mappend_lh__d1_d4 t_3_8_4) ys_3_7_0)))))))))))) in
      (let rec h_3_7_0 = ' ' in
        (fun ys_3_7_1 -> 
          (let rec t_3_8_5 = ((mappend_lh__d4 t_3_6_3) ys_3_7_1) in
            (let rec h_3_7_1 = h_3_7_0 in
              (fun ys_3_7_2 -> 
                (let rec t_3_8_6 = ((mappend_lh__d1_d3 t_3_8_5) ys_3_7_2) in
                  (let rec h_3_7_2 = h_3_7_1 in
                    (fun ys_3_7_3 -> 
                      (`LH_C(h_3_7_2, ((mappend_lh__d1_d4 t_3_8_6) ys_3_7_3)))))))))))) in
      (let rec h_3_7_3 = 'n' in
        (fun ys_3_7_4 -> 
          (let rec t_3_8_7 = ((mappend_lh__d4 t_3_6_2) ys_3_7_4) in
            (let rec h_3_7_4 = h_3_7_3 in
              (fun ys_3_7_5 -> 
                (let rec t_3_8_8 = ((mappend_lh__d1_d3 t_3_8_7) ys_3_7_5) in
                  (let rec h_3_7_5 = h_3_7_4 in
                    (fun ys_3_7_6 -> 
                      (`LH_C(h_3_7_5, ((mappend_lh__d1_d4 t_3_8_8) ys_3_7_6)))))))))))) in
      (let rec h_3_7_6 = 'o' in
        (fun ys_3_7_7 -> 
          (let rec t_3_8_9 = ((mappend_lh__d4 t_3_6_1) ys_3_7_7) in
            (let rec h_3_7_7 = h_3_7_6 in
              (fun ys_3_7_8 -> 
                (let rec t_3_9_0 = ((mappend_lh__d1_d3 t_3_8_9) ys_3_7_8) in
                  (let rec h_3_7_8 = h_3_7_7 in
                    (fun ys_3_7_9 -> 
                      (`LH_C(h_3_7_8, ((mappend_lh__d1_d4 t_3_9_0) ys_3_7_9)))))))))))) in
      (let rec h_3_7_9 = 'i' in
        (fun ys_3_8_0 -> 
          (let rec t_3_9_1 = ((mappend_lh__d4 t_3_6_0) ys_3_8_0) in
            (let rec h_3_8_0 = h_3_7_9 in
              (fun ys_3_8_1 -> 
                (let rec t_3_9_2 = ((mappend_lh__d1_d3 t_3_9_1) ys_3_8_1) in
                  (let rec h_3_8_1 = h_3_8_0 in
                    (fun ys_3_8_2 -> 
                      (`LH_C(h_3_8_1, ((mappend_lh__d1_d4 t_3_9_2) ys_3_8_2)))))))))))) in
      (let rec h_3_8_2 = 't' in
        (fun ys_3_8_3 -> 
          (let rec t_3_9_3 = ((mappend_lh__d4 t_3_5_9) ys_3_8_3) in
            (let rec h_3_8_3 = h_3_8_2 in
              (fun ys_3_8_4 -> 
                (let rec t_3_9_4 = ((mappend_lh__d1_d3 t_3_9_3) ys_3_8_4) in
                  (let rec h_3_8_4 = h_3_8_3 in
                    (fun ys_3_8_5 -> 
                      (`LH_C(h_3_8_4, ((mappend_lh__d1_d4 t_3_9_4) ys_3_8_5)))))))))))) in
      (let rec h_3_8_5 = 'a' in
        (fun ys_3_8_6 -> 
          (let rec t_3_9_5 = ((mappend_lh__d4 t_3_5_8) ys_3_8_6) in
            (let rec h_3_8_6 = h_3_8_5 in
              (fun ys_3_8_7 -> 
                (let rec t_3_9_6 = ((mappend_lh__d1_d3 t_3_9_5) ys_3_8_7) in
                  (let rec h_3_8_7 = h_3_8_6 in
                    (fun ys_3_8_8 -> 
                      (`LH_C(h_3_8_7, ((mappend_lh__d1_d4 t_3_9_6) ys_3_8_8)))))))))))) in
      (let rec h_3_8_8 = 'r' in
        (fun ys_3_8_9 -> 
          (let rec t_3_9_7 = ((mappend_lh__d4 t_3_5_7) ys_3_8_9) in
            (let rec h_3_8_9 = h_3_8_8 in
              (fun ys_3_9_0 -> 
                (let rec t_3_9_8 = ((mappend_lh__d1_d3 t_3_9_7) ys_3_9_0) in
                  (let rec h_3_9_0 = h_3_8_9 in
                    (fun ys_3_9_1 -> 
                      (`LH_C(h_3_9_0, ((mappend_lh__d1_d4 t_3_9_8) ys_3_9_1)))))))))))) in
      (let rec h_3_9_1 = 't' in
        (fun ys_3_9_2 -> 
          (let rec t_3_9_9 = ((mappend_lh__d4 t_3_5_6) ys_3_9_2) in
            (let rec h_3_9_2 = h_3_9_1 in
              (fun ys_3_9_3 -> 
                (let rec t_4_0_0 = ((mappend_lh__d1_d3 t_3_9_9) ys_3_9_3) in
                  (let rec h_3_9_3 = h_3_9_2 in
                    (fun ys_3_9_4 -> 
                      (`LH_C(h_3_9_3, ((mappend_lh__d1_d4 t_4_0_0) ys_3_9_4)))))))))))) in
      (let rec h_3_9_4 = 's' in
        (fun ys_3_9_5 -> 
          (let rec t_4_0_1 = ((mappend_lh__d4 t_3_5_5) ys_3_9_5) in
            (let rec h_3_9_5 = h_3_9_4 in
              (fun ys_3_9_6 -> 
                (let rec t_4_0_2 = ((mappend_lh__d1_d3 t_4_0_1) ys_3_9_6) in
                  (let rec h_3_9_6 = h_3_9_5 in
                    (fun ys_3_9_7 -> 
                      (`LH_C(h_3_9_6, ((mappend_lh__d1_d4 t_4_0_2) ys_3_9_7)))))))))))) in
      (let rec h_3_9_7 = 'n' in
        (fun ys_3_9_8 -> 
          (let rec t_4_0_3 = ((mappend_lh__d4 t_3_5_4) ys_3_9_8) in
            (let rec h_3_9_8 = h_3_9_7 in
              (fun ys_3_9_9 -> 
                (let rec t_4_0_4 = ((mappend_lh__d1_d3 t_4_0_3) ys_3_9_9) in
                  (let rec h_3_9_9 = h_3_9_8 in
                    (fun ys_4_0_0 -> 
                      (`LH_C(h_3_9_9, ((mappend_lh__d1_d4 t_4_0_4) ys_4_0_0)))))))))))) in
      (let rec h_4_0_0 = 'o' in
        (fun ys_4_0_1 -> 
          (let rec t_4_0_5 = ((mappend_lh__d4 t_3_5_3) ys_4_0_1) in
            (let rec h_4_0_1 = h_4_0_0 in
              (fun ys_4_0_2 -> 
                (let rec t_4_0_6 = ((mappend_lh__d1_d3 t_4_0_5) ys_4_0_2) in
                  (let rec h_4_0_2 = h_4_0_1 in
                    (fun ys_4_0_3 -> 
                      (`LH_C(h_4_0_2, ((mappend_lh__d1_d4 t_4_0_6) ys_4_0_3)))))))))))) in
      (let rec h_4_0_3 = 'm' in
        (fun ys_4_0_4 -> 
          (let rec t_4_0_7 = ((mappend_lh__d4 t_3_5_2) ys_4_0_4) in
            (let rec h_4_0_4 = h_4_0_3 in
              (fun ys_4_0_5 -> 
                (let rec t_4_0_8 = ((mappend_lh__d1_d3 t_4_0_7) ys_4_0_5) in
                  (let rec h_4_0_5 = h_4_0_4 in
                    (fun ys_4_0_6 -> 
                      (`LH_C(h_4_0_5, ((mappend_lh__d1_d4 t_4_0_8) ys_4_0_6)))))))))))) in
      (let rec h_4_0_6 = 'e' in
        (fun ys_4_0_7 -> 
          (let rec t_4_0_9 = ((mappend_lh__d4 t_3_5_1) ys_4_0_7) in
            (let rec h_4_0_7 = h_4_0_6 in
              (fun ys_4_0_8 -> 
                (let rec t_4_1_0 = ((mappend_lh__d1_d3 t_4_0_9) ys_4_0_8) in
                  (let rec h_4_0_8 = h_4_0_7 in
                    (fun ys_4_0_9 -> 
                      (`LH_C(h_4_0_8, ((mappend_lh__d1_d4 t_4_1_0) ys_4_0_9)))))))))))) in
      (let rec h_4_0_9 = 'D' in
        (fun ys_4_1_0 -> 
          (let rec t_4_1_1 = ((mappend_lh__d4 t_3_5_0) ys_4_1_0) in
            (let rec h_4_1_0 = h_4_0_9 in
              (fun ys_4_1_1 -> 
                (let rec t_4_1_2 = ((mappend_lh__d1_d3 t_4_1_1) ys_4_1_1) in
                  (let rec h_4_1_1 = h_4_1_0 in
                    (fun ys_4_1_2 -> 
                      (`LH_C(h_4_1_1, ((mappend_lh__d1_d4 t_4_1_2) ys_4_1_2)))))))))))))) in
      (fun _lh_dummy_6 -> 
        ((mappend_lh__d1_d3 h_3_4_8) (concat_lh__d1 t_4))))) in
    (let rec h_4_1_2 = cls_lh__d1 in
      (fun _lh_dummy_7 -> 
        ((mappend_lh__d1_d3 h_4_1_2) (concat_lh__d1 t_3)))))) (pressAnyKey_lh__d1 ((((promptReadAt_lh__d1 (let rec _lh_promptReadAt_LH_P2_1_0 = 15 in
    (let rec _lh_promptReadAt_LH_P2_0_0 = 17 in
      (fun _lh_promptReadAt_arg2_0 _lh_promptReadAt_arg3_0 _lh_promptReadAt_arg4_0 -> 
        (((writeAt_lh__d2 (let rec _lh_writeAt_LH_P2_1_0 = _lh_promptReadAt_LH_P2_1_0 in
          (let rec _lh_writeAt_LH_P2_0_0 = _lh_promptReadAt_LH_P2_0_0 in
            (fun _lh_writeAt_arg2_0 -> 
              (writeString_lh__d5 ((mappend_lh__d1_d5 ((goto_lh__d8 _lh_writeAt_LH_P2_0_0) _lh_writeAt_LH_P2_1_0)) _lh_writeAt_arg2_0)))))) _lh_promptReadAt_arg3_0) (((readAt_lh__d1 (let rec _lh_readAt_LH_P2_1_0 = _lh_promptReadAt_LH_P2_1_0 in
          (let rec _lh_readAt_LH_P2_0_0 = (_lh_promptReadAt_LH_P2_0_0 + (length_lh__d2 _lh_promptReadAt_arg3_0)) in
            (fun _lh_readAt_arg2_0 _lh_readAt_arg3_0 -> 
              (((writeAt_lh__d3 (let rec _lh_writeAt_LH_P2_1_1 = _lh_readAt_LH_P2_1_0 in
                (let rec _lh_writeAt_LH_P2_0_1 = _lh_readAt_LH_P2_0_0 in
                  (fun _lh_writeAt_arg2_1 -> 
                    (writeString_lh__d5 ((mappend_lh__d1_d5 ((goto_lh__d8 _lh_writeAt_LH_P2_0_1) _lh_writeAt_LH_P2_1_1)) _lh_writeAt_arg2_1)))))) ((copy_lh__d2 _lh_readAt_arg2_0) '_')) ((moveTo_lh__d2 (let rec _lh_moveTo_LH_P2_1_0 = _lh_readAt_LH_P2_1_0 in
                (let rec _lh_moveTo_LH_P2_0_0 = _lh_readAt_LH_P2_0_0 in
                  (fun _lh_dummy_8 -> 
                    (writeString_lh__d5 ((goto_lh__d8 _lh_moveTo_LH_P2_0_0) _lh_moveTo_LH_P2_1_0)))))) ((((loop_lh__d1 0) (`LH_N)) _lh_readAt_arg2_0) _lh_readAt_arg3_0))))))) _lh_promptReadAt_arg2_0) _lh_promptReadAt_arg4_0)))))) 18) (`LH_C('P', (`LH_C('l', (`LH_C('e', (`LH_C('a', (`LH_C('s', (`LH_C('e', (`LH_C(' ', (`LH_C('e', (`LH_C('n', (`LH_C('t', (`LH_C('e', (`LH_C('r', (`LH_C(' ', (`LH_C('y', (`LH_C('o', (`LH_C('u', (`LH_C('r', (`LH_C(' ', (`LH_C('n', (`LH_C('a', (`LH_C('m', (`LH_C('e', (`LH_C(':', (`LH_C(' ', (`LH_N)))))))))))))))))))))))))))))))))))))))))))))))))) (fun name_0 -> 
    (let rec reply_0 = ((mappend_lh__d1 (let rec t_4_1_3 = (let rec t_4_1_4 = (let rec t_4_1_5 = (let rec t_4_1_6 = (let rec t_4_1_7 = (let rec t_4_1_8 = (fun ys_4_1_3 -> 
      ys_4_1_3) in
      (let rec h_4_1_3 = ' ' in
        (fun ys_4_1_4 -> 
          (`LH_C(h_4_1_3, ((mappend_lh__d1 t_4_1_8) ys_4_1_4)))))) in
      (let rec h_4_1_4 = 'o' in
        (fun ys_4_1_5 -> 
          (`LH_C(h_4_1_4, ((mappend_lh__d1 t_4_1_7) ys_4_1_5)))))) in
      (let rec h_4_1_5 = 'l' in
        (fun ys_4_1_6 -> 
          (`LH_C(h_4_1_5, ((mappend_lh__d1 t_4_1_6) ys_4_1_6)))))) in
      (let rec h_4_1_6 = 'l' in
        (fun ys_4_1_7 -> 
          (`LH_C(h_4_1_6, ((mappend_lh__d1 t_4_1_5) ys_4_1_7)))))) in
      (let rec h_4_1_7 = 'e' in
        (fun ys_4_1_8 -> 
          (`LH_C(h_4_1_7, ((mappend_lh__d1 t_4_1_4) ys_4_1_8)))))) in
      (let rec h_4_1_8 = 'H' in
        (fun ys_4_1_9 -> 
          (`LH_C(h_4_1_8, ((mappend_lh__d1 t_4_1_3) ys_4_1_9))))))) ((mappend_lh__d2 name_0) (`LH_C('!', (`LH_N))))) in
      (((writeAt_lh__d1 (let rec _lh_writeAt_LH_P2_1_2 = 18 in
        (let rec _lh_writeAt_LH_P2_0_2 = (40 - ((length_lh__d1 reply_0) / 2)) in
          (fun _lh_writeAt_arg2_2 -> 
            (writeString_lh__d3 ((mappend_lh__d6 ((goto_lh__d1 _lh_writeAt_LH_P2_0_2) _lh_writeAt_LH_P2_1_2)) _lh_writeAt_arg2_2)))))) reply_0) ((moveTo_lh__d1 (let rec _lh_moveTo_LH_P2_1_1 = 23 in
        (let rec _lh_moveTo_LH_P2_0_1 = 1 in
          (fun _lh_dummy_9 -> 
            (writeString_lh__d4 ((goto_lh__d8 _lh_moveTo_LH_P2_0_1) _lh_moveTo_LH_P2_1_1)))))) ((writeString_lh__d1 (let rec t_4_1_9 = (let rec t_4_2_0 = (let rec t_4_2_1 = (let rec t_4_2_2 = (let rec t_4_2_3 = (let rec t_4_2_4 = (let rec t_4_2_5 = (let rec t_4_2_6 = (let rec t_4_2_7 = (let rec t_4_2_8 = (let rec t_4_2_9 = (let rec t_4_3_0 = (let rec t_4_3_1 = (let rec t_4_3_2 = (fun ys_4_2_0 -> 
        ys_4_2_0) in
        (let rec h_4_1_9 = '`' in
          (fun ys_4_2_1 -> 
            (`LH_C(h_4_1_9, ((mappend_lh__d5 t_4_3_2) ys_4_2_1)))))) in
        (let rec h_4_2_0 = '.' in
          (fun ys_4_2_2 -> 
            (`LH_C(h_4_2_0, ((mappend_lh__d5 t_4_3_1) ys_4_2_2)))))) in
        (let rec h_4_2_1 = '.' in
          (fun ys_4_2_3 -> 
            (`LH_C(h_4_2_1, ((mappend_lh__d5 t_4_3_0) ys_4_2_3)))))) in
        (let rec h_4_2_2 = '.' in
          (fun ys_4_2_4 -> 
            (`LH_C(h_4_2_2, ((mappend_lh__d5 t_4_2_9) ys_4_2_4)))))) in
        (let rec h_4_2_3 = 'g' in
          (fun ys_4_2_5 -> 
            (`LH_C(h_4_2_3, ((mappend_lh__d5 t_4_2_8) ys_4_2_5)))))) in
        (let rec h_4_2_4 = 'n' in
          (fun ys_4_2_6 -> 
            (`LH_C(h_4_2_4, ((mappend_lh__d5 t_4_2_7) ys_4_2_6)))))) in
        (let rec h_4_2_5 = 'i' in
          (fun ys_4_2_7 -> 
            (`LH_C(h_4_2_5, ((mappend_lh__d5 t_4_2_6) ys_4_2_7)))))) in
        (let rec h_4_2_6 = 't' in
          (fun ys_4_2_8 -> 
            (`LH_C(h_4_2_6, ((mappend_lh__d5 t_4_2_5) ys_4_2_8)))))) in
        (let rec h_4_2_7 = 'i' in
          (fun ys_4_2_9 -> 
            (`LH_C(h_4_2_7, ((mappend_lh__d5 t_4_2_4) ys_4_2_9)))))) in
        (let rec h_4_2_8 = 'a' in
          (fun ys_4_3_0 -> 
            (`LH_C(h_4_2_8, ((mappend_lh__d5 t_4_2_3) ys_4_3_0)))))) in
        (let rec h_4_2_9 = 'w' in
          (fun ys_4_3_1 -> 
            (`LH_C(h_4_2_9, ((mappend_lh__d5 t_4_2_2) ys_4_3_1)))))) in
        (let rec h_4_3_0 = ' ' in
          (fun ys_4_3_2 -> 
            (`LH_C(h_4_3_0, ((mappend_lh__d5 t_4_2_1) ys_4_3_2)))))) in
        (let rec h_4_3_1 = 'm' in
          (fun ys_4_3_3 -> 
            (`LH_C(h_4_3_1, ((mappend_lh__d5 t_4_2_0) ys_4_3_3)))))) in
        (let rec h_4_3_2 = 'I' in
          (fun ys_4_3_4 -> 
            (`LH_C(h_4_3_2, ((mappend_lh__d5 t_4_1_9) ys_4_3_4))))))) (pressAnyKey_lh__d2 end_lh__d1))))))))) _lh_program_arg1_0);;
let rec testAnsi_nofib_lh__d1 _lh_testAnsi_nofib_arg1_0 =
  ((((foldr_lh__d1 (fun f_0 g_0 _lh_funcomp_x_0 -> 
    (f_0 (g_0 _lh_funcomp_x_0)))) (fun x_0 -> 
    x_0)) ((copy_lh__d1 _lh_testAnsi_nofib_arg1_0) program_lh__d1)) (`LH_C('t', (`LH_C('e', (`LH_C('s', (`LH_C('t', (`LH_C('t', (`LH_C('e', (`LH_C('s', (`LH_C('t', (`LH_C('t', (`LH_C('e', (`LH_C('s', (`LH_C('t', (`LH_N))))))))))))))))))))))))));;
let run () = 1 + (Obj.magic ((testAnsi_nofib_lh__d1 8)));
end;;

