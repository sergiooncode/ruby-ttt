require 'ai'
require 'board'
require 'game_rules'

describe Ai do
  let(:board){ Board.new(9) }
  let(:ai){ described_class.new } 
  it "machine is current player and it won" do
    board.squares[0] = 'X'
    board.squares[1] = 'O'
    board.squares[2] = 'X'
    board.squares[3] = 'X'
    board.squares[4] = 'O'
    board.squares[5] = '-'
    board.squares[6] = '-'
    board.squares[7] = 'O'
    board.squares[8] = '-'
    depth = 6
    maximizing_player = true

    expect(ai.minimax(board, depth, maximizing_player)).to eql(1000000)
  end
end
