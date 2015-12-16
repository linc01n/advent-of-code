#!/usr/bin/env ruby

def rule1(s)
  (s.gsub(/([^aeiou])/,'').length) >= 3
end

def rule2(s)
  (s =~ /([a-z])\1/) != nil
end

def rule3(s)
  (s =~ /(ab|cd|pq|xy)/) == nil
end

f = File.read 'input.txt'

good = 0

f.each_line do |line|
  if rule1(line) && rule2(line) && rule3(line)
    good += 1
  end
end

puts good
