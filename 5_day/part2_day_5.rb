require 'pry'

puzzle_input = File.readlines('puzzle_input.txt').map(&:chomp)

seats = []

puzzle_input.each do |pass|
  pass.gsub!('B', '1')
  pass.gsub!('F', '0')
  pass.gsub!('R', '1')
  pass.gsub!('L', '0')

  seats << pass.to_i(2)
end

sorted_seats = seats.sort
last_seat = sorted_seats.first - 1

sorted_seats.each do |seat|
  puts seat - 1 if seat - last_seat == 2

  last_seat = seat
end

# puts sorted_seats
