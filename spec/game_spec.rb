require 'game'

describe Game do
  context '#initialize' do
    let(:player_01) { Player.new({type: 'h', sign: '0', name: 'Batman'}) }
    let(:player_02) { Player.new({sign: 'X', type: 'h', name: 'Superman'}) }
    let(:board) { Board.new }
    let(:rulebook) { Rulebook.new }
    subject(:game) { described_class.new({board: board, rulebook: rulebook, player_01: player_01, player_02: player_02, starting_player: 2}) }

    it 'starts with two players, a board and a rulebook' do
      expect(game.starting_player).to eq player_02
      expect(game.players).to eq [player_02, player_01]
      expect(game.board).to eq board
      expect(game.rulebook).to eq rulebook
    end

    it 'requires two Player objects for players' do
      expect { described_class.new({player_01: 'A non-player', player_02: player_02, board: board, rulebook: rulebook}) }.to raise_error 'Actual players are needed to start a game'
    end

    it 'requires a Board object for the board' do
      expect { described_class.new({player_01: player_01, rulebook: rulebook, player_02: player_02, board: nil}) }.to raise_error 'An actual board is needed to start a game'
    end

    it 'requires a Rulebook object for the rulebook' do
      expect { described_class.new({player_01: player_01, player_02: player_02, board: board, rulebook: ""}) }.to raise_error 'An actual rulebook is needed to start a game'
    end
  end
end
