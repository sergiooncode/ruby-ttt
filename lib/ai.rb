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
      return INFINITY
    end
  end
end
