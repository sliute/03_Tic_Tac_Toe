require_relative 'rulebook'

class Game
  attr_reader :players, :board, :rulebook

  def initialize(args)
    check_rulebook(args)
    @board = @rulebook.check_board(args)
    @players = @rulebook.check_players(args)
  end

  def check_rulebook(args)
    raise 'An actual rulebook is needed to start a game' unless args.fetch(:rulebook).is_a?(Rulebook)
    @rulebook = args.fetch(:rulebook)
  end
end
