#! /usr/bin/ruby  

home = "ocaml-4.00.1/testsuite/tests/"
file = ARGV[0]
 
puts "grep -v '^\\s*$' #{home}#{file}.rascal > #{home}#{file}.rascal.stripped"

`grep -v '^\\s*$' #{home}#{file}.rascal > #{home}#{file}.rascal.stripped`
`grep -v '^\\s*$' #{home}#{file}.ocaml > #{home}#{file}.ocaml.stripped`

puts "diff -w #{home}#{file}.rascal.stripped #{home}#{file}.ocaml.stripped"
`diff -w #{home}#{file}.rascal.stripped #{home}#{file}.ocaml.stripped > #{home}#{file}.diff`

puts `cat #{home}#{file}.diff`
