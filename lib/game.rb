require_relative 'board'
require_relative 'player'
require_relative 'rulebook'

class Game
  attr_reader :players, :starting_player, :board, :rulebook

  def initialize(args)
    raise 'Actual players are needed to start a game' unless args.fetch(:player_01).is_a?(Player) && args.fetch(:player_02).is_a?(Player)
    raise 'An actual board is needed to start a game' unless args.fetch(:board).is_a?(Board)
    raise 'An actual rulebook is needed to start a game' unless args.fetch(:rulebook).is_a?(Rulebook)
    @players = []
    args.each_key { |key| @players.push(args.fetch(key)) if key.to_s.include?('player_') }
    @starting_player = @players[args.fetch(:starting_player) - 1]
    @players.rotate!(@players.index(@starting_player))
    @board = args.fetch(:board)
    @rulebook = args.fetch(:rulebook)
  end
end
