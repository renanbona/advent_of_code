require_relative 'day_8_p1'

RSpec.describe GameInstructions do
  let(:input_data) { File.read('puzzle_input.txt').split("\n") }

  subject { GameInstructions.call(input_data) }

  it 'returns the accumulator from the rules' do
    expect(subject).to eq(1451)
  end
end
