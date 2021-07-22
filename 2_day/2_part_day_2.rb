puzzle_input = File.readlines('puzzle_input.txt').map { |line| line.split(' ') }

valid_passwords = 0

puzzle_input.map do |input|
  # min = input[0][0].to_i
  # max = input[0][2].to_i
  lettler = input[1][0]
  password = input.last

  first_index, second_index = *input.first.split('-').map(&:to_i)
  next if password.chars[first_index - 1] == lettler && password.chars[second_index - 1] == lettler
  next unless password.chars[first_index - 1] == lettler || password.chars[second_index - 1] == lettler

  valid_passwords += 1
end

puts valid_passwords
# 530