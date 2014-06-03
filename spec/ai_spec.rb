require 'ai'
require 'board'
require 'game_rules'

describe Ai do
  context "when current player wins" do
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
    it "human is current player and it won" do
      board.squares[0] = 'X'
      board.squares[1] = 'O'
      board.squares[3] = 'X'
      board.squares[5] = 'O'
      board.squares[6] = 'X'
      depth = 5
      maximizing_player = false

      expect(ai.minimax(board, depth, maximizing_player)).to eql(1000000)
    end
  end
  context "when it is tie" do
    let(:board){ Board.new(9) }
    let(:ai){ described_class.new }
    it "machine is current player and it is a tie" do
      board.squares[0] = 'X'
      board.squares[1] = 'O'
      board.squares[2] = 'X'
      board.squares[3] = 'O'
      board.squares[4] = 'X'
      board.squares[5] = 'X'
      board.squares[6] = 'O'
      board.squares[7] = 'X'
      board.squares[8] = 'O'
      depth = 9
      maximizing_player = true

      expect(ai.minimax(board, depth, maximizing_player)).to eql(0)
    end
  end
  context "when current player loses" do
    let(:board){ Board.new(9) }
    let(:ai){ described_class.new }
    it "machine is current player and it lost" do
      board.squares[0] = 'X'
      board.squares[1] = 'O'
      board.squares[3] = 'X'
      board.squares[5] = 'O'
      board.squares[6] = 'X'
      depth = 5
      maximizing_player = true

      expect(ai.minimax(board, depth, maximizing_player)).to eql(-1000000)
    end
    it "human is current player and it lost" do
      board.squares[0] = 'X'
      board.squares[1] = 'O'
      board.squares[2] = 'X'
      board.squares[3] = 'X'
      board.squares[4] = 'O'
      board.squares[7] = 'O'
      depth = 6
      maximizing_player = false
      
      expect(ai.minimax(board, depth, maximizing_player)).to eql(-1000000)
    end
  end
end
