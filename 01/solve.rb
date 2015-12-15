#!/usr/bin/env ruby

f = File.read 'input.txt'
up = down = 0

f.each_line do |l|
  up += l.count '('
  down += l.count ')'
end

puts (up - down).to_s
