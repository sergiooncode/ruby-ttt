require 'cli'
require 'board'

describe Cli do
  let(:cli){ described_class.new }
  let(:board){ Board.new(9) }
  it "sends messages of welcome" do
    expect(STDOUT).to receive(:puts).with('Welcome to TTT game in Ruby!')
    
    cli.welcome
  end
  it "announces token of human player" do
    expect(STDOUT).to receive(:puts).with('Human plays with X')
  
    cli.announce_human_token
  end
  it "announces token of machine player" do
    expect(STDOUT).to receive(:puts).with('Machine plays with O')
  
    cli.announce_machine_token
  end
  it "announce players tokens" do
    expect(cli).to receive(:announce_human_token)
    expect(cli).to receive(:announce_machine_token)
    expect(STDOUT).to receive(:puts)

    cli.announce_players_tokens
  end
  it "displays message asking human player for next move" do
    expect(STDOUT).to receive(:puts).with('Please human enter next move:')

    cli.ask_human
  end
  it "displays message that machine is thinking next move" do
    expect(STDOUT).to receive(:puts).with('Machine is thinking next move...')

    cli.display_machine_thinking
  end
  it "announces the winner" do
    expect(STDOUT).to receive(:puts).with('Player O won.')

    cli.announce('O')
  end
  it "announces the game ended in a tie" do
    expect(STDOUT).to receive(:puts).with('It was a tie.')

    cli.announce_tie
  end
end
