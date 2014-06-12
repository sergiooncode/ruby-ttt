require 'ai'

class MachinePlayer 
  attr_accessor :token, :ai

  def initialize(token)
    @token = token
    @ai = Ai.new
  end
  def move(board)
    ai.minimax(board, 1, true)
    index = ai.smart_move
    board.squares[index] = token
    board
  end
end
