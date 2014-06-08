class Cli
  def welcome
    puts "Welcome to TTT game in Ruby!"
  end
  def announce_human_token
    puts "Human plays with X"
  end
  def announce_machine_token
    puts "Machine plays with O"
  end
  def announce_players_tokens
    announce_human_token
    announce_machine_token
    puts
  end
  def ask_human
    puts "Please human enter next move:"
  end
  def display_machine_thinking
    puts "Machine is thinking next move..."
  end
  def announce(winner)
    puts "Player #{winner} won."
  end
  def announce_tie
    puts "It was a tie."
  end
  def display(board)
    puts
    (0..2).each do |i|
      (0..2).each do |k|
        print "#{board.squares[k + 3*i]} "
      end
      puts
    end
    puts
  end
end
