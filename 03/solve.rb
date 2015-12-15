#!/usr/bin/env ruby

f = File.read 'input.txt'

step = 0
cord = [[0, 0], [0, 0]]
visited = Hash.new(0)

f.each_line do |line|
  line.each_char do |char|
    case char
    when '^'
      cord[step % 2][1] += 1
    when 'v'
      cord[step % 2][1] -= 1
    when '<'
      cord[step % 2][0] -= 1
    when '>'
      cord[step % 2][0] += 1
    end

    visited["#{cord[step % 2][0]} #{cord[step % 2][1]}"] += 1
    step += 1
  end
end

puts visited.keys.count
