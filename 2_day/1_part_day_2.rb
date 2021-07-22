puzzle_input = File.readlines('puzzle_input.txt').map { |line| line.split(' ') }
valid_passwords = 0

puzzle_input.map do |input|
  range = input.first
  # min = input[0][0].to_i
  # max = input[0][2].to_i
  lettler = input[1][0]
  password = input.last

  rule_1 = range.split('-').map(&:to_i)
  lettler_count = password.scan(/#{lettler}/).count
  valid_passwords += 1 if lettler_count >= rule_1.first && lettler_count <= rule_1.last
end

puts valid_passwords
