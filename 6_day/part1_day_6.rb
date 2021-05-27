require 'pry'

puzzle_input = File.readlines('puzzle_input.txt').map(&:chomp)
groups = []
group = ''

puzzle_input.each do |line|
  if line.empty?
    groups << group.chars.uniq.size
    group = ''
  else
    group += line
  end
end

groups << group.chars.uniq.size

res = groups.reduce { |acc, num| acc + num }

puts groups
puts res
