(*
ocamlfind ocamlopt -rectypes -thread -O3 -w -A ./Lumherhack_Common.ml ./Lumberhack_LargeStr.ml ./Module_original.ml ./Module_lumberhack.ml ./Module_lumberhack_pop_out.ml ./main.ml -o Integrate_nofib.out -linkpkg -package "core_unix.command_unix" -linkpkg -package "core_bench" && ./Integrate_nofib.out +time
*)
open Core_bench;;
Command_unix.run (Bench.make_command [
  Bench.Test.create ~name:"original_Integrate_nofib" (fun () -> ignore (let open Module_original.Module_original in ((testIntegrate_nofib__d0 100))));
  Bench.Test.create ~name:"lumberhack_Integrate_nofib" (fun () -> ignore (let open Module_lumberhack.Module_lumberhack in ((testIntegrate_nofib__d0 100))));
  Bench.Test.create ~name:"lumberhack_pop_out_Integrate_nofib" (fun () -> ignore (let open Module_lumberhack_pop_out.Module_lumberhack_pop_out in ((testIntegrate_nofib__d0 100))));
])