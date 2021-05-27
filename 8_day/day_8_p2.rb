input_data = File.read('puzzle_input.txt').split("\n")
# result 11600

# input_data = File.read('test_input.txt').split("\n")
# result 8

class GameInstructions
  attr_accessor :acc, :instructions_list, :orginal_input_data

  def initialize(orginal_input_data = [])
    @acc = 0
    @instructions_list = []
    @jmp_nop_instructions_index = []
    @orginal_input_data = orginal_input_data
    @new_input_data = @orginal_input_data.clone
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    # return @acc if instructions_queue(0, @orginal_input_data)

    find_jmp_nop_instructions_index
    find_correct_instructions
  end

  private

  def find_jmp_nop_instructions_index
    @orginal_input_data.each_with_index do |instruction, index|
      @jmp_nop_instructions_index << index unless instruction.match(/acc/)
    end
  end

  def find_correct_instructions
    @jmp_nop_instructions_index.each do |instruction_index|
      reset_game_instructions
      fix_corrupted(instruction_index)

      return @acc if instructions_queue(0, @new_input_data)
    end
  end

  def instructions_queue(instruction_index = 0, input_data)
    instruction_command, instruction_value = input_data[instruction_index].split
    next_instruction_index = 0

    return false if instructions_list.include?(instruction_index)

    instructions_list << instruction_index

    next_instruction_index = instruction_index + 1 if instruction_command == 'nop'

    if instruction_command == 'acc'
      @acc += instruction_value.to_i
      next_instruction_index = instruction_index + 1
    end

    next_instruction_index = instruction_index + instruction_value.to_i if instruction_command == 'jmp'

    return true if instruction_index == (input_data.size - 1)

    instructions_queue(next_instruction_index, input_data)
  end

  def reset_game_instructions
    @acc = 0
    @instructions_list = []
    @new_input_data = @orginal_input_data.clone
  end

  def fix_corrupted(instruction_index)
    @new_input_data[instruction_index] = if @new_input_data[instruction_index].match(/nop/)
                                           @new_input_data[instruction_index].gsub(/nop/, 'jmp')
                                         else
                                           @new_input_data[instruction_index].gsub(/jmp/, 'nop')
                                         end
  end
end

puts GameInstructions.call(input_data)
