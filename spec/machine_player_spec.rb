require 'machine_player'
require 'board'

describe MachinePlayer do
  let(:machine_player) { described_class.new('O') }
  let(:board){ Board.new(9) }
  it "makes move for an initial board X--------" do
    board.squares = 'X--------'

    expect(machine_player.move(board).squares).to eql 'X---O----'
  end
end
