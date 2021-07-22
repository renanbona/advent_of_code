numbers = File.readlines('puzzle_input.txt').map(&:to_i)

class ThreeNumbersCombine2020
  attr_reader :input_data

  def initialize(input_data = [])
    @input_data = input_data
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    find_sum_equals_2020.reduce(:*)
  end

  private

  def combination_of_three_numbers
    @combination_of_three_numbers ||= input_data.combination(3).to_a
  end

  def find_sum_equals_2020
    combination_of_three_numbers.each do |array|
      return array if array.sum == 2020
    end
  end
end

# puts ThreeNumbersCombine2020.call(numbers)