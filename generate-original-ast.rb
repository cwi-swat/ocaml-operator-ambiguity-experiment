#! /usr/bin/ruby

files = Array.new
file_names = Array.new
dirs = Array.new

File.foreach('files.txt') do |line|
  f = line.chomp
  files << f
  dirs << f[0..f.rindex('/')]
  file_names << f[f.rindex('/') + 1..f.size]
end

for i in 0..files.size
  result =  File.new("#{dirs[i]}#{file_names[i]}.ocaml", 'w')  
  puts "cat #{files[i]} | xargs -0 /Users/ali/ocaml/src/4.00/parsing/imp > #{result.path}"
  `cat #{files[i]} | xargs -0 modified-ocaml-astprinter/parsing/imp > #{result.path}`
end

abort()