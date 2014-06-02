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
  end
end
