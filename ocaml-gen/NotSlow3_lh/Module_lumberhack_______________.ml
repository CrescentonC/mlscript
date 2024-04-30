

(* lumberhack *)
open Lumherhack_Common.Lumherhack_Common;;
open Lumberhack_LargeStr.Lumberhack_LargeStr;;
module Module_lumberhack_______________(LH_Dum: sig end): sig val run: unit -> int end = struct
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
    (let rec _lh_listcomp_fun_ls_t_0 = ((enumFromTo_lh__d1 (a_0 + 1)) b_0) in
      (let rec _lh_listcomp_fun_ls_h_0 = a_0 in
        (fun _lh_listcomp_fun_0 tmp_0 -> 
          (let rec t_1 = (_lh_listcomp_fun_0 _lh_listcomp_fun_ls_t_0) in
            (let rec h_1 = tmp_0 in
              (fun _lh_dummy_0 -> 
                ((mappend_lh__d1 h_1) (concat_lh__d1 t_1))))))))
  else
    (fun _lh_listcomp_fun_1 tmp_1 _lh_dummy_1 -> 
      (`LH_N)));;
let rec testNotSlow3_lh__d1 _lh_testNotSlow3_arg1_0 =
  (if (_lh_testNotSlow3_arg1_0 < 0) then
    (`LH_N)
  else
    (let rec tmp_2 = (testNotSlow3_lh__d1 (_lh_testNotSlow3_arg1_0 - 1)) in
      (concat_lh__d1 (let rec _lh_listcomp_fun_2 = (fun _lh_listcomp_fun_para_0 -> 
        ((_lh_listcomp_fun_para_0 _lh_listcomp_fun_2) tmp_2)) in
        (_lh_listcomp_fun_2 ((enumFromTo_lh__d1 1) _lh_testNotSlow3_arg1_0))))));;
let run () = 1 + (Obj.magic ((testNotSlow3_lh__d1 10)));
end;;

