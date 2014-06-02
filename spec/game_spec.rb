require 'game'

describe Game do
  context "when new game created" do
    let(:game){ described_class.new }
    it "has a board" do
      expect(game.board).not_to be_nil
    end
    it "has a human player" do
      expect(game.human_player).not_to be_nil
    end
    it "has a machine player" do
      expect(game.machine_player).not_to be_nil
    end
  end
  context "while game is ongoing" do
    let(:game){ described_class.new }
    it "runs the game" do
      expect(game).to receive(:run)

      game.run
    end
    it "asks human player for move one time" do
      expect(game).to receive(:ask_human_for_move)

      game.ask_human_for_move
    end
    it "asks machine player for move one time" do
      expect(game).to receive(:ask_machine_for_move)

      game.ask_machine_for_move
    end
    it "shows current board formatted" do
      expect(game).to receive(:show_board)

      game.show_board
    end
  end
end
