# frozen_string_literal: true

require 'pry'

class PuzzleParser
  def self.call
    File.readlines('puzzle_input.txt').map(&:chomp)
    # File.readlines('puzzle_test_input.txt').map(&:chomp)
  end
end

bags_containing_shiny_gold = []
rules = PuzzleParser.call

bags = {}

rules.each do |rule|
  parsed_rule = rule.gsub(/\s+bags?|\./, '').split(/\s+contain \d+\s+|, \d+\s+/)
  bag_name = parsed_rule.shift
  bags[bag_name] = parsed_rule
end

bags_containing_shiny_gold = []

def recursion(childrens, bags)
  flag = false

  return false if childrens.nil?
  return true if childrens.include?('shiny gold')

  childrens.each do |bag|
    flag = recursion(bags[bag], bags)
    return flag if flag
  end

  flag
end

bags.each do |key, value|
  bags_containing_shiny_gold << key if recursion(value, bags)
end

puts bags_containing_shiny_gold.count
