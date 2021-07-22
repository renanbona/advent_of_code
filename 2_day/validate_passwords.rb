class ValidatePasswords
  def initialize(input_data)
    @input_data = input_data
    @valid_passwords = 0
    @parsed_input = []
  end

  def self.call(input_data)
    new(input_data).call
  end

  def call
    parse_input
    part_1

    puts "The answer of the part_1 is: #{@valid_passwords}"
  end

  def part_1
    @parsed_input.each do |test|
      rule_1 = test[:range].split('-').map(&:to_i)
      lettler_count = test[:password].scan(/#{test[:lettler]}/).count
      @valid_passwords += 1 if lettler_count >= rule_1.first && lettler_count <= rule_1.last
    end

    @valid_passwords
  end

  private

  def parse_input
    @input_data.map do |line|
      range = line.first
      lettler = line[1][0]
      password = line.last

      @parsed_input << { range: range, lettler: lettler, password: password }
    end
  end
end

puzzle_input = File.readlines('puzzle_input.txt').map { |line| line.split(' ') }
puts ValidatePasswords.call(puzzle_input)
