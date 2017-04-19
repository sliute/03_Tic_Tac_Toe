require_relative 'board'
require_relative 'player'

class Rulebook
  MIN_PLAYERS = 2
  MAX_PLAYERS = 2
  NO_OF_FIELDS = 9
  EMPTY_FIELD = ""

  def check_board(args)
    raise 'An actual board is needed to start a game' unless args.fetch(:board).is_a?(Board)
    args.fetch(:board)
  end

  def check_players(args)
    @players = []
    collect_and_rotate_to_starting(args)
    check_type_and_number(args)
    @players
  end

  def check_player_type(args)
    raise 'You can only play as either human (h/H) or computer (c/C)' unless args.fetch(:type) =~ /[cChH]/
    args.fetch(:type)
  end

  def check_player_sign(args)
    raise 'You must provide a single-character sign' if args.fetch(:sign) == "" || args.fetch(:sign).nil?
    raise 'Your sign should be just 1 character long' if args.fetch(:sign).length > 1
    args.fetch(:sign)
  end

  def tic_tac_toe_grid
    Array.new(NO_OF_FIELDS) { EMPTY_FIELD }
  end

  private

  def collect_and_rotate_to_starting(args)
    args.each_key { |key| @players.push(args.fetch(key)) if key.to_s.include?('player_') }
    starting_player = @players[args.fetch(:starting_player) - 1]
    @players.rotate!(@players.index(starting_player))
  end

  def check_type_and_number(args)
    @players.each { |player| raise 'Actual players are needed to start a game' unless player.is_a?(Player) }
    raise 'Exactly two players can play Tic Tac Toe' if @players.length < Rulebook::MIN_PLAYERS || @players.length > Rulebook::MAX_PLAYERS
  end
end
