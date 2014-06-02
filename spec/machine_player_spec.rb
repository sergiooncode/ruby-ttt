require 'machine_player'

describe MachinePlayer do
  let(:machine_player) { described_class.new('O') }

  it "makes next move" do
    expect(machine_player).to receive(:move)

    machine_player.move
  end
end
