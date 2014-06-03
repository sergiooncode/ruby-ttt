require 'board'
require 'game_rules'

class Ai
  INFINITY = 1000000
  
  attr_accessor :game_rules

  def initialize
    self.game_rules = GameRules.new 
  end

  def minimax(board, depth, maximizing_player)
    if @game_rules.gameover?(board)
      if !@game_rules.tie?(board)
        if maximizing_player
          if @game_rules.who_is_winner == 'X'
            score = -INFINITY
          else
            score = INFINITY
          end
        else
          if @game_rules.who_is_winner == 'X'
            score = INFINITY
          else
            score = -INFINITY
          end
        end
      else
        score = 0
      end
      score
    end
  end
end
