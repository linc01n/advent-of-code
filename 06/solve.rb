#!/usr/bin/env ruby
require 'pry'
f = File.read 'input.txt'

grid = Array.new(1000){ Array.new(1000) { 0 } }

def parse(s)
  re = /(turn\son\s|turn\soff\s|toggle\s)(\d+),(\d+)(\sthrough\s)(\d+),(\d+)/
  result = s.match(re)
end

def light(top_left, bottom_right, action, grid)
  x1, y1 = top_left.map! { |e| e.to_i }
  x2, y2 = bottom_right.map! { |e| e.to_i }

  value = -1

  if action == 'turn on '
    value = 1
  elsif action == 'turn off '
    value = 0
  elsif action == 'toggle '
    value = -1
  end

  (x1..x2).each do |x|
    (y1..y2).each do |y|
      if value == -1
        grid[x][y] = 1 - grid[x][y]
      else
        grid[x][y] = value
      end
    end
  end
end


f.each_line do |line|
  r = parse(line)
  light([r[2], r[3]], [r[5], r[6]], r[1], grid)
end

puts grid.flatten.count(1)
