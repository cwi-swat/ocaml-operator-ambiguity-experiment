Safe Specification of Operator Precedence Rules
===================================

This repository reports on the experiment we did on validating the grammar transformation
for implementing operator priority and associativity rules. 

### Directory structure:

1. modified-ocaml-astprinter: the modified printast.ml (printbrackets.ml) which prints OCaml ASTs as bracketed forms. Build instructions to compile this file can be found in run.sh.
2. ocaml.4.00.1: contains the source files in the OCaml test suite. 
3. ocaml-rascal: the rascal grammar used for parsing OCaml. Note that the current release of the Rascal parser does not support the rewriting technieque we used in this study. The rewriting functionality is implemented in the branch rascal-jigll of rascal. The new parser will be gradually integrated into Rascal.

### Method
For this study, we only considered the .ml files:

```
> find . -iname "*.ml" | wc -l
387
```
(The commands should be executed in the ocaml.4.00.1 folder, i.e., . = ocaml.4.00.1)

We have not considered the files in the tool-ocaml folder of the test suite, as they only contain only source code comments that document expected output (assembler code) of the compiler. Therefore, for this study we only considered 229 files.

The generated bracketed AST for each .ml file is placed in the same directory. The generated ASTs from rascal
have the .rascal extension whereas the generated ASTs from the modified OCaml parser have the .ocaml extension.

Because diff is a line based utility, we remove empty lines from the .ocaml and .rascal AST files, producing
.ocaml.stripped and .rascal.stripped files:

```
grep -v '^\\s*$  file.ml.ocaml > file.ml.ocaml.stripped
```

The resulting stripped files were compared using the diff utility, ignoring the whitespace:
```
diff -w file.ml.ocaml.stripped file.ml.rascal.stripped > file.ml.diff
```
If the size of the diff output is zero, it means that the ASTs were the same.

#Running the experiment
The OCaml grammar, as described in the reference manual, appears to support two different kinds of OCaml inputs.
One supports optional expressions separated by ;; while in the other one, ;; is not allowed. For this study, we could not completely figure it out how to unify these two modes in an unambiguous grammar. Therefore, we provide two start symbols, TopLevel and Implementation (see OCaml.rsc in the ocaml-rascal/OCaml.rsc directory)

Still, we are not able to parse all the 229 files. The main reason is that some TopLevel files were failing due to a missing ";;" meaning that we could not correctly deduct the rules for semicolon. In the future, we will fix this problem by looking at the Yacc grammar of OCaml. 

The files.txt file contains all the files we considered. The successfully parsed Toplevel files are in toplevels.txt and the successfully parsed Implementation files are in imp.txt. To run all files, successful implementations, and successful toplevels, use the runAll(), runImplementions() and runTopLevels() methods, on ocaml-rascal/src/Tests.rsc, respectively. 






