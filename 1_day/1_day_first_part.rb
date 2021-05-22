# require 'pry'

numbers = File.readlines("puzzle_input.txt").map(&:to_i)

while numbers.any?
  n = numbers.shift

  complementery_number = 2020 - n

  if numbers.include?(complementery_number)
    puts "#{n} and #{complementery_number} and the answer is: #{n * complementery_number}"
  end
end

# binding.pry

puts "in this numbers file there is no numbers that together we get 2020"