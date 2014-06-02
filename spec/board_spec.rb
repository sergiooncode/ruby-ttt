require 'board'

describe Board do
  before :each do
    @board = Board.new(9)
  end

  it "gets empty squares" do
    expect(@board.squares).to eql('---------')
  end
  it "sets 2nd square to X" do
    @board.squares[1] = 'X'

    expect(@board.squares).to eql('-X-------')
  end
  it "checks if an square is empty and it is" do 
    expect(@board.empty?(3)).to be_true 
  end
  it "checks if an square is empty and it is not" do
    @board.squares[2] = 'O'

    expect(@board.empty?(2)).to be_false
  end
  it "gets the token in one square" do
    @board.squares[8] = 'X'

    expect(@board.squares).to eql('--------X')
  end
  it "checks if board is filled and it is not" do
    expect(@board.filled?).to be_false
  end
  it "checks if board is filled and it is" do
    @board.squares[0] = 'X'
    @board.squares[1] = 'O'
    @board.squares[2] = 'X'
    @board.squares[3] = 'O'
    @board.squares[4] = 'X'
    @board.squares[5] = 'X'
    @board.squares[6] = 'O'
    @board.squares[7] = 'X'
    @board.squares[8] = 'O'

    expect(@board.filled?).to be_true
  end
end
