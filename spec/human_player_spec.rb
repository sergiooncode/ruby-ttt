require 'human_player'
require 'board'

describe HumanPlayer do
  let(:human_player) { described_class.new('X') }

  it "makes next move" do
    expect(human_player).to receive(:move)

    human_player.move
  end
  it "checks if position is valid and it is not" do
    expect(human_player.invalid?(10)).to be_true
  end
  it "checks if position is valid and it is" do
    expect(human_player.invalid?(1)).to be_false
  end
end
