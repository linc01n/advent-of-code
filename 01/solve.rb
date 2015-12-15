#!/usr/bin/env ruby

f = File.read 'input.txt'
level = 0
counter = 1

f.each_line do |l|
  l.each_char do |char|
    if char == '('
      level += 1
    else
      level -= 1
    end
    puts counter if level == -1
    counter += 1
  end
end
