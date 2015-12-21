#!/usr/bin/env ruby

f = File.open('input.txt')
script = "require 'memoizable'\n"
script += "class A7\n"
script += "\tinclude Memoizable\n"

f.each_line do |line|
  line = line.split(' -> ')
  line[1] = line[1].chop
  line[0] = line[0].gsub(/AND/, "&")
  line[0] = line[0].gsub(/OR/, "|")
  line[0] = line[0].gsub(/LSHIFT/, "<<")
  line[0] = line[0].gsub(/RSHIFT/, ">>")
  line[0] = line[0].gsub(/NOT /, "~")
  line[0] = line[0].gsub(/do/, "dooooooo")
  line[1] = line[1].gsub(/do/, "dooooooo")
  line[0] = line[0].gsub(/if/, "ifffffff")
  line[1] = line[1].gsub(/if/, "ifffffff")
  line[0] = line[0].gsub(/in/, "innnnnnnn")
  line[1] = line[1].gsub(/in/, "innnnnnnn")

  line[0] = line[0].gsub(/([a-z]+)/, '\1()')
  script += "\tdef #{line[1]}; return (#{line[0]}); end\n"
  script += "\tmemoize :#{line[1]}\n"
end
script += "end\n"
script += "puts A7.new.a()\n"

eval script
