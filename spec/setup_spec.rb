require 'setup'

describe Setup do
  it "asks human player to choose the token to play with" do
    setup = Setup.new
    
    # STDOUT.should_receive(:puts).with("human move")
    # player.stub(:gets).and_return("")
    # player.move_human("X")
  end
end
