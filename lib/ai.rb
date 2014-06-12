require 'board'
require 'game_rules'

class Ai
  INFINITY = 1000000
  
  attr_accessor :game_rules, :smart_move
  
  def initialize
    @game_rules = GameRules.new 
    @smart_move = -1
  end

  def heuristic(board)
    if !game_rules.tie?(board)
      if game_rules.who_is_winner == 'X'
        score = -INFINITY
      else
        score = INFINITY
      end
    else
      score = 0
    end
    score
  end
  
  def possible_moves(board)
       (0..board.size - 1).select{ |move| board.empty?(move) }
  end

  def board_with_new_move(old_board, move, token)
    board = Board.new(9)
    board.squares = old_board.squares.dup
    board.squares[move] = token 
    board
  end

  def maximizing_branch(next_board, depth)
    moves = possible_moves(next_board)
    best_score = -INFINITY
    best_move = -1
    moves.each do |move|
      score = minimax(board_with_new_move(next_board, move, 'O'), depth + 1, false)
      if score > best_score
        best_move = move
      end
      best_score = [score, best_score].max
    end
    @smart_move = best_move
    best_score
  end

  def minimizing_branch(next_board, depth)
    moves = possible_moves(next_board)
    best_score = INFINITY
    best_move = -1
    moves.each do |move|
      score = minimax(board_with_new_move(next_board, move, 'X'), depth + 1, true)
      if score < best_score
        best_move = move
      end
      best_score = [score, best_score].min
    end
    best_score
  end

  def minimax(next_board, depth, maximizing_player)
    if game_rules.gameover?(next_board) || depth == 9
      score = heuristic(next_board)
      return score
    end
    if maximizing_player
      maximizing_branch(next_board, depth)
    else
      minimizing_branch(next_board, depth)
    end
  end
end
