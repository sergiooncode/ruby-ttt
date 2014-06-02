class GameRules
  attr_reader :who_is_winner

  def initialize
    @who_is_winner = nil
  end
  def check_on_rows(board)
    squares = board.squares
    start_row = 0
    winner = nil
    while start_row < 7
      if !board.empty?(start_row) && squares[start_row] == squares[start_row + 1] && squares[start_row] == squares[start_row + 2] 
        winner = squares[start_row]
      end
      start_row += 3
    end
    winner
  end
  def check_on_columns(board)
    squares = board.squares
    start_column = 0
    while start_column < 3
      if !board.empty?(start_column) && squares[start_column] == squares[start_column + 3] && squares[start_column] == squares[start_column + 6]
        winner = squares[start_column]
      end
      start_column += 1
    end
    winner
  end
  def check_on_diagonals(board)
    squares = board.squares
    start_diagonal = 0
    if !board.empty?(start_diagonal) && squares[start_diagonal] == squares[start_diagonal + 4] && squares[start_diagonal] == squares[start_diagonal + 8]
      winner = squares[start_diagonal]
    end
    start_diagonal += 6
    if !board.empty?(start_diagonal) && squares[start_diagonal] == squares[start_diagonal - 2] && squares[start_diagonal] == squares[start_diagonal - 4]
      winner = squares[start_diagonal]
    end
    winner
  end
  def winner?(board)
    if check_on_rows(board) != nil
      @who_is_winner = check_on_rows(board)
      return true
    end
    if check_on_columns(board) != nil 
      @who_is_winner = check_on_columns(board)
      return true
    end
    if check_on_diagonals(board) != nil
      @who_is_winner = check_on_diagonals(board)
      return true
    end
    false
  end
  def tie?(board)
    tie = false
    if board.filled? && !winner?(board)
      tie = true
    end
    tie
  end
  def gameover?(board)
    winner?(board) || tie?(board)
  end
end
