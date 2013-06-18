files = Array.new
home = ""


File.foreach('toplevels.txt') do |line|
  f = line.chomp
  files << f
end

for i in 0..files.size  
  puts "grep -v '^\\s*$' #{home}#{files[i]}.rascal > #{home}#{files[i]}.rascal.stripped"
  puts "grep -v '^\\s*$' #{home}#{files[i]}.ocaml > #{home}#{files[i]}.ocaml.stripped"

  `grep -v '^\\s*$' #{home}#{files[i]}.rascal > #{home}#{files[i]}.rascal.stripped`
  `grep -v '^\\s*$' #{home}#{files[i]}.ocaml > #{home}#{files[i]}.ocaml.stripped`

  puts "diff -w #{home}#{files[i]}.rascal.stripped #{home}#{files[i]}.ocaml.stripped"
  `diff -w #{home}#{files[i]}.rascal.stripped #{home}#{files[i]}.ocaml.stripped > #{home}#{files[i]}.diff`
end