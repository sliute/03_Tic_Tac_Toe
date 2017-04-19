require 'rulebook'

describe Rulebook do
  context 'checks for:' do
    subject(:rulebook) { described_class.new }
    let(:player_01) { Player.new({rulebook: rulebook, type: 'h', sign: '0', name: 'Batman'}) }
    let(:player_02) { Player.new({rulebook: rulebook, sign: 'X', type: 'h', name: 'Superman'}) }
    let(:player_03) { Player.new({rulebook: rulebook, sign: 'R', type: 'h', name: 'Caveman'}) }

    it 'a board that is a Board object' do
      expect { rulebook.check_board({board: nil}) }.to raise_error 'An actual board is needed to start a game'
    end

    it 'players that are Player objects' do
      expect { rulebook.check_players({player_01: 'A non-player', player_02: player_02, starting_player: 2}) }.to raise_error 'Actual players are needed to start a game'
    end

    it 'the required number of players (3 are too many)' do
      expect { rulebook.check_players({player_03: player_03, player_01: player_01, player_02: player_02, starting_player: 3}) }.to raise_error 'Exactly two players can play Tic Tac Toe'
    end

    it 'the required number of players (1 are too few)' do
      expect { rulebook.check_players({player_01: player_01, starting_player: 1}) }.to raise_error 'Exactly two players can play Tic Tac Toe'
    end

    it 'player signs that are at least one character long' do
      expect { rulebook.check_player_sign({sign: ""}) }.to raise_error 'You must provide a single-character sign'
      expect { rulebook.check_player_sign({sign: nil}) }.to raise_error 'You must provide a single-character sign'
    end

    it 'player signs that are at most one character long' do
      expect { rulebook.check_player_sign({sign: "XY"}) }.to raise_error 'Your sign should be just 1 character long'
    end

    it 'player types that are either "h"/"H" or "c"/"C"' do
      expect { rulebook.check_player_type({type: "?"}) }.to raise_error 'You can only play as either human (h/H) or computer (c/C)'
    end
  end
end
