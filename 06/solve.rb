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
    value = -1
  elsif action == 'toggle '
    value = 2
  end

  (x1..x2).each do |x|
    (y1..y2).each do |y|
      grid[x][y] += value
      if grid[x][y] < 0
        grid[x][y] = 0
      end
    end
  end
end


f.each_line do |line|
  r = parse(line)
  light([r[2], r[3]], [r[5], r[6]], r[1], grid)
end

puts grid.flatten.reduce(&:+)
