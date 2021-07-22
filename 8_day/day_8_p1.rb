input_data = File.read('puzzle_input.txt').split("\n")

class GameInstructions
  attr_accessor :acc, :instructions_list
  attr_reader :input_data

  def initialize(input_data = [])
    @acc = 0
    @instructions_list = []
    @input_data = input_data
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    instructions_queue
    @acc
  end

  private

  def instructions_queue(instruction_index = 0)
    return if instructions_list.include?(instruction_index)

    instructions_list << instruction_index

    instruction_command, instruction_value = input_data[instruction_index].split

    instructions_queue(instruction_index += 1) if instruction_command == 'nop'

    if instruction_command == 'acc'
      @acc += instruction_value.to_i
      instructions_queue(instruction_index += 1)
    end

    instructions_queue(instruction_index + instruction_value.to_i) if instruction_command == 'jmp'
  end
end

# GameInstructions.call(input_data)
