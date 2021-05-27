require 'pry'

puzzle_input = File.readlines('puzzle_input.txt').map(&:chomp)

valid_passports = 0

def validate_key_rule(key, formatted_passport)
  valid_eye_color = %w[amb blu brn gry grn hzl oth]

  case key
  when 'byr'
    formatted_passport[key].to_i >= 1920 && formatted_passport[key].to_i <= 2002
  when 'iyr'
    formatted_passport[key].to_i >= 2010 && formatted_passport[key].to_i <= 2020
  when 'eyr'
    formatted_passport[key].to_i >= 2020 && formatted_passport[key].to_i <= 2030
  when 'hgt'
    if formatted_passport[key].include?('cm')
      return formatted_passport[key].to_i >= 150 && formatted_passport[key].to_i <= 193
    end

    if formatted_passport[key].include?('in')
      return formatted_passport[key].to_i >= 59 && formatted_passport[key].to_i <= 76
    end

    false
  when 'hcl'
    # puts formatted_passport[key] if /^#([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$/.match(formatted_passport[key])
    /^#([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$/.match(formatted_passport[key])
  when 'ecl'
    # print formatted_passport[key]
    # puts " é #{valid_eye_color.include?(formatted_passport[key])}"
    valid_eye_color.include?(formatted_passport[key])
  when 'pid'
    # print formatted_passport[key]
    # puts " is #{formatted_passport[key].size == 9}"
    true if formatted_passport[key].size == 9
  end
end

required_keys = %w[
  ecl
  pid
  eyr
  hcl
  byr
  iyr
  hgt
]

# rules = [
#   byr: >= 1920 && <= 2002
#   iyr: >= 2010 && <= 2020
#   eyr: >= 2020 && <= 2030
#   hgt: 150 - 193 cm || 59-76 in
#   hcl: # 6 characters (0-9 or a-f)
#   ecl: amb blu brn gry grn hzl oth (one of this)
#   pid: a nine-digit number, including leading zeroes.
# ]

passport = []

puzzle_input.map do |line|
  if line.empty?
    validation_flag = true
    full_passport = passport.join(' ')
    formatted_passport = full_passport.split(' ').map { |item| item.split(':') }.to_h

    required_keys.each do |key|
      unless full_passport.include?(key)
        validation_flag = false
        break
      end

      unless validate_key_rule(key, formatted_passport)
        validation_flag = false
        break
      end
    end

    passport = []
    # puts formatted_passport.sort.to_h if validation_flag
    valid_passports += 1 if validation_flag
  else
    passport << line.split(' ')
  end
end

# testing the last passport
validation_flag = true
full_passport = passport.join(' ')
formatted_passport = full_passport.split(' ').map { |item| item.split(':') }.to_h
validation_flag = true

required_keys.each do |key|
  next unless full_passport.include?(key)

  unless validate_key_rule(key, formatted_passport)
    validation_flag = false
    break
  end
end

valid_passports += 1 if validation_flag

puts valid_passports
puts 'hoho'
