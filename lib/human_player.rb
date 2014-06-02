class HumanPlayer 
  attr_accessor :token

  VALID_MOVES = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  def initialize(token)
    @token = token
  end
  def invalid?(position)
    if VALID_MOVES.include?(position)
      return false
    end
    true
  end
  def move(board)
    position = gets
    index = position.delete!("\n").to_i
    while invalid?(index) || !board.empty?(index - 1)
      puts "Please enter a valid position:"
      position = gets
      index = position.delete!("\n").to_i
    end
    board.squares[index - 1] = @token 
    board
  end
end
