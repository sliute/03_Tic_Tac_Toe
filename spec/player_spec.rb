require 'player'

describe Player do
  context '#initialize' do
    let(:rulebook) { Rulebook.new }

    it 'starts with a rulebook, a name, a sign and a type' do
      player = Player.new({rulebook: rulebook, name: "John", sign: "Z", type: "h"})
      expect(player.rulebook).to eq rulebook
      expect(player.name).to eq "John"
      expect(player.sign).to eq "Z"
      expect(player.type).to eq "h"
    end

    it 'requires a Rulebook object for the rulebook' do
      expect { described_class.new({name: "John", sign: "Z", type: "h", rulebook: "nada"}) }.to raise_error 'An actual rulebook is needed to start a game'
    end

    it 'defaults the name to "Anon" if no name is provided' do
      player_01 = Player.new({rulebook: rulebook, name: "", sign: "X", type: "c"})
      player_02 = Player.new({rulebook: rulebook, name: nil, sign: "O", type: "h"})
      expect(player_01.name).to eq "Anon"
      expect(player_02.name).to eq "Anon"
    end
  end
end
