# require 'pry'
require 'benchmark'

start = Time.now

numbers = File.readlines("puzzle_input.txt").map(&:to_i)

combination_of_three_numbers = numbers.combination(3).to_a

combination_of_three_numbers.each do |array|
  if array.sum == 2020
    puts array
    puts array.reduce(:*)
    break
  end
end

finish = Time.now

puts finish - start