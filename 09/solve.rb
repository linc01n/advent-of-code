#!/usr/bin/env ruby

f = File.open('input.txt')

graph = []
weights = {}
f.each_line do |line|
  locations, distance = line.split(' = ')
  distance = distance.to_i
  from, to = locations.split(' to ')
  graph << [from, to]
  weights[[from, to]] = distance
  weights[[to, from]] = distance
end

locations = graph.flatten.uniq

search_cost = []

locations.permutation(locations.length).to_a.each do |path|
  cost = 0

  path.each_with_index do |el, n|
    if n + 1 < path.length
      cost += weights[[el, path[n+1]]]
    end
  end

  search_cost << cost
end

puts search_cost.max
