(*
ocamlfind ocamlopt -rectypes -thread -O3 -w -A ./Lumherhack_Common.ml ./Lumberhack_LargeStr.ml ./Module_original_________________.ml ./Module_lumberhack_only_expanded_.ml ./Module_lumberhack_______________.ml ./Module_lumberhack_pop_out_______.ml ./Module_lumberhack_inlined_______.ml ./Module_lumberhack_flo_out_______.ml ./main.ml -o Rewrite_nofib_lh.out -linkpkg -package "core_unix.command_unix" -linkpkg -package "core_bench" && ./Rewrite_nofib_lh.out +time
*)
open Core_bench;;
Command_unix.run (Bench.make_command [
  Bench.Test.create ~name:"original_Rewrite_nofib_lh" (fun () -> ignore (let open Module_original_________________.Module_original_________________ in ((testRewrite_nofib_lh 50))));
  Bench.Test.create ~name:"lumberhack_only_expanded_Rewrite_nofib_lh" (fun () -> ignore (let open Module_lumberhack_only_expanded_.Module_lumberhack_only_expanded_ in ((testRewrite_nofib_lh__d1 50))));
  Bench.Test.create ~name:"lumberhack_Rewrite_nofib_lh" (fun () -> ignore (let open Module_lumberhack_______________.Module_lumberhack_______________ in ((testRewrite_nofib_lh__d1 50))));
  Bench.Test.create ~name:"lumberhack_pop_out_Rewrite_nofib_lh" (fun () -> ignore (let open Module_lumberhack_pop_out_______.Module_lumberhack_pop_out_______ in ((testRewrite_nofib_lh__d1 50))));
  Bench.Test.create ~name:"lumberhack_inlined_Rewrite_nofib_lh" (fun () -> ignore (let open Module_lumberhack_inlined_______.Module_lumberhack_inlined_______ in ((testRewrite_nofib_lh__d1 50))));
  Bench.Test.create ~name:"lumberhack_flo_out_Rewrite_nofib_lh" (fun () -> ignore (let open Module_lumberhack_flo_out_______.Module_lumberhack_flo_out_______ in ((testRewrite_nofib_lh__d1 50))));
])