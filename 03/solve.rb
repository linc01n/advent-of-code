#!/usr/bin/env ruby

f = File.read 'input.txt'

total = 1
cord = [0, 0]

visited = Hash.new(0)

f.each_line do |line|
  line.each_char do |char|
    case char
    when '^'
      cord[1] += 1
    when 'v'
      cord[1] -= 1
    when '<'
      cord[0] -= 1
    when '>'
      cord[0] += 1
    end
    visited["#{cord[0]} #{cord[1]}"] += 1
  end
end

puts visited.keys.count + 1
