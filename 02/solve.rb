#!/usr/bin/env ruby

f = File.read 'input.txt'

total = 0

f.each_line do |line|
  sides = line.split('x').map(&:to_i).sort
  total += sides[0] * sides[1]
  sides.combination(2).to_a.each do |pair|
    total += 2 * pair[0] * pair[1]
  end
end

puts total.to_s
