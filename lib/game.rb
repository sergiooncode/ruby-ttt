require 'board'
require 'human_player'
require 'game_rules'
require 'machine_player'

class Game
  attr_accessor :cli, :board, :human_player, :machine_player, :game_rules

  def initialize(cli)
    @board = Board.new(9)
    @human_player = HumanPlayer.new('X')
    @machine_player = MachinePlayer.new('O')
    @game_rules = GameRules.new
    @cli = cli
  end
  def start
    cli.welcome
    cli.announce_players_tokens
  end
  def ask_human_for_move
    cli.ask_human
    human_player.move(board)
  end
  def ask_machine_for_move
    cli.display_machine_thinking
    machine_player.move(board)
  end 
  def run
    while !game_rules.gameover?(board)
      board = ask_human_for_move
      cli.display(board)
      if game_rules.gameover?(board)
        break 
      end
      board = ask_machine_for_move
      cli.display(board)
    end
    cli.display(board)
  end
  def finish
    if game_rules.winner?(board)
      cli.announce(game_rules.who_is_winner)
    else
      cli.announce_tie
    end
  end
end
