#!/usr/bin/env ruby

f = File.open('input.txt')

esc_char = 0

f.each_line do |line|
  org = line.size - 1
  str = ""
  eval("str = #{line}")
  esc = str.size
  esc_char += org - esc
end

puts esc_char
