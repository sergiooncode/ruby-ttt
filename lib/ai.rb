require 'board'
require 'game_rules'

class Ai
  def minimax(board, current_depth, maximizing_player)
    start_diagonal = 6
    squares = board.squares
    
    if squares[start_diagonal - 2] == squares[start_diagonal - 4]
      return start_diagonal
    end
  end
end
