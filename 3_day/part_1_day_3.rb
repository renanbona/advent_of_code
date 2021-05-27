require 'pry'

puzzle_input = File.readlines('puzzle_input.txt').map(&:chop)

def way_to_the_bottom(x_steps, y_steps, puzzle_input)
  x_index = 0
  y_index = 0
  number_of_trees = 0
  max_x_index = puzzle_input.first.size

  loop do
    x_index += x_steps
    x_index -= max_x_index if x_index >= max_x_index

    y_index += y_steps

    break if y_index >= puzzle_input.size

    # puts "x = #{x_index} y = #{y_index} #{puzzle_input[x_index][y_index]}"
    number_of_trees += 1 if puzzle_input[y_index][x_index] == '#'
  end

  puts number_of_trees
  number_of_trees
end

part2_day_3 = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
]

r = part2_day_3.reduce(1) { |acc, x| way_to_the_bottom(x[0], x[1], puzzle_input) * acc }

puts r
puts 'haha'
