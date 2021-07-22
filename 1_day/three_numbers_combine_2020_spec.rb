require_relative '1_day_second_part'

RSpec.describe ThreeNumbersCombine2020 do
  let(:input_data) { File.readlines('puzzle_input.txt').map(&:to_i) }

  subject { ThreeNumbersCombine2020.call(input_data) }

  it 'returns the accumulator from the rules' do
    expect(subject).to eq(257778836)
  end
end
