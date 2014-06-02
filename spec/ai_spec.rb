require 'ai'
require 'board'

describe Ai do
  let(:ai){ described_class.new } 
  let(:board){ Board.new(9) }
  it "computer can win in one move and returns winning move" do
    board.squares[0] = 'X'
    board.squares[1] = 'X'
    board.squares[2] = 'O'
    board.squares[4] = 'O'
    board.squares[8] = 'X'
    depth = 0
    maximizing_player = true
    
    expect(ai.minimax(board, depth, maximizing_player)).to eql(6)
  end
end
