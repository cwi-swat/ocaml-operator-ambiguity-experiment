# Common rules

.SUFFIXES:
.SUFFIXES: .ml .mli .cmo

.ml.cmo:
	ocamlc -c $<

.mli.cmi:
	ocamlc -c $<

depend:
	ocamldep *.mli *.ml > .depend

include .depend