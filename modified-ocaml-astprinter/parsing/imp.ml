open Format;;

let _ =
            let lexbuf = Lexing.from_string Sys.argv.(1) in
              let result = Parser.implementation Lexer.token lexbuf in
                Printbrackets.implementation  std_formatter result; print_newline(); flush stdout


(** 
Execution command:

ocamlc -o main ../utils/warnings.cmo ../utils/misc.cmo ../utils/config.cmo ../utils/clflags.cmo location.cmo lexer.cmo syntaxerr.cmo longident.cmo  parser.cmo printbrackets.cmo  main.cmo
**)


(* cat /Users/ali/Desktop/ocaml-4.00.1/testsuite/tests/misc/bdd.ml | xargs ./main *)