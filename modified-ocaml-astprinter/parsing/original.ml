open Format;;

let _ =
            let lexbuf = Lexing.from_channel stdin in
              let result = Parser.toplevel_phrase Lexer.token lexbuf in
                Printast.top_phrase  std_formatter result; print_newline(); flush stdout


(** 
Execution command:

ocamlc -o main ../utils/warnings.cmo ../utils/misc.cmo ../utils/config.cmo ../utils/clflags.cmo location.cmo lexer.cmo syntaxerr.cmo longident.cmo  parser.cmo printbrackets.cmo  main.cmo
**)