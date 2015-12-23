#!/usr/bin/env ruby

f = File.open('input.txt')

esc_char = 0

f.each_line do |line|
  org = line.size - 1
  str = ""
  str = line.dump
  esc = str.size - 2
  esc_char += esc - org
end

puts esc_char
