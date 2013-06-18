#! /bin/bash

echo -n "Compiling..."
ocamlc -c toplevel.ml
ocamlc -c imp.ml
ocamlc -c printbrackets.ml
echo "done."

echo -n "Building binary files... "
ocamlc -o toplevel ../utils/warnings.cmo ../utils/misc.cmo ../utils/config.cmo ../utils/clflags.cmo location.cmo lexer.cmo syntaxerr.cmo longident.cmo  parser.cmo printbrackets.cmo  toplevel.cmo
ocamlc -o imp ../utils/warnings.cmo ../utils/misc.cmo ../utils/config.cmo ../utils/clflags.cmo location.cmo lexer.cmo syntaxerr.cmo longident.cmo  parser.cmo printbrackets.cmo  imp.cmo
echo "done."