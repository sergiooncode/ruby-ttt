require 'ai'
require 'board'
require 'game_rules'

describe Ai do
  context "when current player wins" do
    let(:board){ Board.new(9) }
    let(:ai){ described_class.new } 
    it "returns score when machine is current player and it won" do
      board.squares = "XOXXO--O-"
      depth = 6
      maximizing_player = true

      expect(ai.minimax(board, depth, maximizing_player)).to eql 1000000
    end
    it "returns score when human is current player and it won" do
      board.squares = "XO-X-OX--"
      depth = 5
      maximizing_player = false

      expect(ai.minimax(board, depth, maximizing_player)).to eql -1000000 
    end
  end
  context "when it is tie" do
    let(:board){ Board.new(9) }
    let(:ai){ described_class.new }
    it "returns score when machine is current player and it is a tie" do
      board.squares = "XOXOXXOXO"
      depth = 9
      maximizing_player = true

      expect(ai.minimax(board, depth, maximizing_player)).to eql 0
    end
  end
  context "when current player loses" do
    let(:board){ Board.new(9) }
    let(:ai){ described_class.new }
    it "returns score when machine is current player and it lost" do
      board.squares = "XO-X-OX--"
      depth = 5
      maximizing_player = true

      expect(ai.minimax(board, depth, maximizing_player)).to eql -1000000
    end
    it "returns score when human is current player and it lost" do
      board.squares = "XOXXO--O-"
      depth = 6
      maximizing_player = false
      
      expect(ai.minimax(board, depth, maximizing_player)).to eql 1000000
    end
  end
  context "when board is not in a terminal case" do
    let(:board){ Board.new(9) }
    let(:ai){ described_class.new }
    it "generates array of possible moves when board is empty" do
      expect(ai.possible_moves(board)).to eql [0, 1, 2, 3, 4, 5, 6, 7, 8]
    end
    it "generates array of possible moves when board has only position board.squares[3] empty" do
      board.squares = "XOX-OXOXO" 
      
      expect(ai.possible_moves(board)).to eql [3]
    end
    it "returns score for initial board XOXOO-X-X" do
      board.squares = "XOXOO-X-X"
      depth = 7
      maximizing_player = true

      expect(ai.minimax(board, depth, maximizing_player)).to eql 1000000
    end
    it "returns score for initial board XOX-OX---" do
      board.squares = "XOX-OX---"
      depth = 5
      maximizing_player = true

      expect(ai.minimax(board, depth, maximizing_player)).to eql 1000000
    end
    it "returns score for initial board XO-X-----" do
      board.squares = "XO-X-----"
      depth = 3
      maximizing_player = true

      expect(ai.minimax(board, depth, maximizing_player)).to eql -1000000
    end
    it "returns score for initial board X--------" do
      board.squares = "X--------"
      depth = 1
      maximizing_player = true

      expect(ai.minimax(board, depth, maximizing_player)).to eql 0
    end
    it "gets smart_move for initial board XOX--OX--" do
      board.squares = "XOX--OX--"
      depth = 5
      maximizing_player = true
      ai.minimax(board, depth, maximizing_player)

      expect(ai.smart_move).to eql -1
    end
    it "gets smart_move for initial board --X------" do
      depth = 1
      maximizing_player = true
      ai.minimax(board, depth, maximizing_player)

      expect(ai.smart_move).to eql 3
    end
  end
end
