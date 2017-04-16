require_relative 'board'
require_relative 'player'
require_relative 'rulebook'

class Game
  attr_reader :players, :starting_player, :board, :rulebook

  def initialize(args)
    check_rulebook(args)
    @board = @rulebook.check_board(args)
    
    check_players(args)
  end

  def check_rulebook(args)
    raise 'An actual rulebook is needed to start a game' unless args.fetch(:rulebook).is_a?(Rulebook)
    @rulebook = args.fetch(:rulebook)
  end

  def check_players(args)
    @players = []
    args.each_key { |key| @players.push(args.fetch(key)) if key.to_s.include?('player_') }
    @starting_player = @players[args.fetch(:starting_player) - 1]
    @players.rotate!(@players.index(@starting_player))
    @players.each { |player| raise 'Actual players are needed to start a game' unless player.is_a?(Player) }
    raise 'Exactly two players can play Tic Tac Toe' if @players.length < Rulebook::MIN_PLAYERS || @players.length > Rulebook::MAX_PLAYERS
  end
end
