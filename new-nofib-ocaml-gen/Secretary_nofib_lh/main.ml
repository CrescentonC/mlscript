(*
ocamlfind ocamlopt -rectypes -thread -O3 -w -A ./Lumherhack_Common.ml ./Lumberhack_LargeStr.ml ./Module_original_________________.ml ./Module_lumberhack_only_expanded_.ml ./Module_lumberhack_______________.ml ./Module_lumberhack_pop_out_______.ml ./Module_lumberhack_inlined_______.ml ./Module_lumberhack_flo_out_______.ml ./main.ml -o Secretary_nofib_lh.out -linkpkg -package "core_unix.command_unix" -linkpkg -package "core_bench" && ./Secretary_nofib_lh.out +time
*)
open Core_bench;;
Command_unix.run (Bench.make_command [
  Bench.Test.create ~name:"original_Secretary_nofib_lh" (fun () -> ignore (let open Module_original_________________.Module_original_________________ in ((testSecretary_nofib_lh 0))));
  Bench.Test.create ~name:"lumberhack_only_expanded_Secretary_nofib_lh" (fun () -> ignore (let open Module_lumberhack_only_expanded_.Module_lumberhack_only_expanded_ in ((testSecretary_nofib_lh__d1 0))));
  Bench.Test.create ~name:"lumberhack_Secretary_nofib_lh" (fun () -> ignore (let open Module_lumberhack_______________.Module_lumberhack_______________ in ((testSecretary_nofib_lh__d1 0))));
  Bench.Test.create ~name:"lumberhack_pop_out_Secretary_nofib_lh" (fun () -> ignore (let open Module_lumberhack_pop_out_______.Module_lumberhack_pop_out_______ in ((testSecretary_nofib_lh__d1 0))));
  Bench.Test.create ~name:"lumberhack_inlined_Secretary_nofib_lh" (fun () -> ignore (let open Module_lumberhack_inlined_______.Module_lumberhack_inlined_______ in ((let rec _lh_listcomp_fun_0 = (fun _lh_listcomp_fun_para_0 -> 
  (_lh_listcomp_fun_para_0 _lh_listcomp_fun_0)) in
  (_lh_listcomp_fun_0 ((enumFromTo_lh__d1 35) 39))))));
  Bench.Test.create ~name:"lumberhack_flo_out_Secretary_nofib_lh" (fun () -> ignore (let open Module_lumberhack_flo_out_______.Module_lumberhack_flo_out_______ in ((let rec _lh_listcomp_fun_0 = (fun _lh_listcomp_fun_para_0 -> 
  (_lh_listcomp_fun_para_0 _lh_listcomp_fun_0)) in
  (_lh_listcomp_fun_0 ((enumFromTo_lh__d1 35) 39))))));
])