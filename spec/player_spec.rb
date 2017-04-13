require 'player'

describe Player do
  context '#initialize' do
    it 'starts with a name, a sign and a type' do
      player = Player.new({name: "John", sign: "Z", type: "h"})
      expect(player.name).to eq "John"
      expect(player.sign).to eq "Z"
      expect(player.type).to eq "h"
    end

    it 'defaults the name to "Anon" if no name is provided' do
      player_01 = Player.new({name: "", sign: "X", type: "c"})
      player_02 = Player.new({name: nil, sign: "O", type: "h"})
      expect(player_01.name).to eq "Anon"
      expect(player_02.name).to eq "Anon"
    end

    it 'raises an error if no sign is provided' do
      expect { Player.new({name: "Abel", sign: "", type: "h"}) }.to raise_error 'You must provide a single-character sign'
      expect { Player.new({name: "Babel", sign: nil, type: "c"}) }.to raise_error 'You must provide a single-character sign'
    end

    it 'raises an error if sign is longer than 1 character' do
      expect { Player.new({name: "Abel", sign: "XY", type: "h"}) }.to raise_error 'Your sign should be just 1 character long'
    end

    it 'raises an error if type is neither "h"/"H" nor "c"/"C"' do
      expect { Player.new({name: "Abel", sign: "E", type: "?"}) }.to raise_error 'You can only play as either human (h/H) or computer (c/C)'
    end
  end
end
