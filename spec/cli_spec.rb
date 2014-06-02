require 'cli'

describe Cli do
  let(:cli){ described_class.new }
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

    cli.announce_players_tokens
  end
end
