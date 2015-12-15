#!/usr/bin/env ruby

f = File.read 'input.txt'

total = 0

f.each_line do |line|
  sides = line.split('x').map(&:to_i).sort
  total += sides[0]*2 + sides[1]*2
  total += sides[0] * sides[1] * sides[2]
end

puts total.to_s
