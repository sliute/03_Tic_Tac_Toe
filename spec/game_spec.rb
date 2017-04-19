require 'game'

describe Game do
  context '#initialize' do
    let(:rulebook) { Rulebook.new }
    let(:board) { Board.new({rulebook: rulebook}) }
    let(:player_01) { Player.new({rulebook: rulebook, type: 'h', sign: '0', name: 'Batman'}) }
    let(:player_02) { Player.new({rulebook: rulebook, sign: 'X', type: 'h', name: 'Superman'}) }
    subject(:game) { described_class.new({board: board, rulebook: rulebook, player_01: player_01, player_02: player_02, starting_player: 2}) }

    it 'starts with a rulebook, a board and players' do
      expect(game.rulebook).to eq rulebook
      expect(game.board).to eq board
      expect(game.players).to eq [player_02, player_01]
    end

    it 'requires a Rulebook object for the rulebook' do
      expect { described_class.new({player_01: player_01, player_02: player_02, board: board, rulebook: "", starting_player: 2}) }.to raise_error 'An actual rulebook is needed to start a game'
    end
  end
end
