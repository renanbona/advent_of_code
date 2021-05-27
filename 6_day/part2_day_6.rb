require 'pry'

puzzle_input = File.readlines('puzzle_input.txt').map(&:chomp)
groups = []
group = nil

puzzle_input.each do |line|
  if line.empty?
    groups << group.size
    group = nil
  else
    group = if group.nil?
              line.chars.uniq
            else
              group & line.chars.uniq
            end
  end
end

groups << group.size

res = groups.reduce { |acc, num| acc + num }

# puts groups
puts res
