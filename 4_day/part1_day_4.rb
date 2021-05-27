require 'pry'

puzzle_input = File.readlines('puzzle_input.txt').map(&:chomp)

valid_passports = 0

required_keys = %w[
  ecl:
  pid:
  eyr:
  hcl:
  byr:
  iyr:
  hgt:
]

passport = []

puzzle_input.map do |line|
  if line.empty?
    validation_flag = true
    full_passport = passport.join(' ')

    required_keys.each do |key|
      next if full_passport.include?(key)

      validation_flag = false
      break
    end

    passport = []
    valid_passports += 1 if validation_flag
  else
    passport << line.split(' ')
  end
end

# last password because the trigger for validation was an empty line
validation_flag = true
full_passport = passport.join(' ')

required_keys.each do |key|
  next if full_passport.include?(key)

  validation_flag = false
  break
end
valid_passports += 1 if validation_flag

puts valid_passports
puts 'hoho'
