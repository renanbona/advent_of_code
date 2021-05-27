require 'pry'

puzzle_input = File.readlines('puzzle_input.txt').map(&:chomp)

max = 0

puzzle_input.each do |pass|
  pass.gsub!('B', '1')
  pass.gsub!('F', '0')
  pass.gsub!('R', '1')
  pass.gsub!('L', '0')

  max = pass.to_i(2) > max ? pass.to_i(2) : max
end

puts max
