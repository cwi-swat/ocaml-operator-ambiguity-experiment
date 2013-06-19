Safe Specification of Operator Precedence Rules
===================================

This repository reports on the experiment we did on validating the grammar transformation
for implementing operator priority and associativity rules. 

Directory structure:

modified-ocaml-astprinter: the modified printast.ml (printbrackets.ml) which prints the bracketed form the 
AST. Build instructions can be found in run.sh.

ocaml.4.00.1: contains the source files in the OCaml test suite. 

For this study, we only considered .ml files:

```
> find . -iname "*.ml" | wc -l
387
```

The generated bracketed AST for each .ml file is placed in the same directory. The generated AST from rascal
has the .rascal extension whereas the generated AST from the modified OCaml parser has .ml files.

Because diff is a line based utility, we remove the empty lines from the .ocaml and .rascal AST files, producing
.ocaml.stripped and .rascal.stripped files:

```
grep -v '^\\s*$  file.ml.ocaml > file.ml.ocaml.stripped
```

The resulting stripped files were compared using the diff utility, ignoring the whitespace:
```
diff -w file.ml.ocaml.stripped file.ml.rascal.stripped > file.ml.diff
```

If the size of the diff output is zero, it means that the ASTs were the same.





