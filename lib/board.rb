require_relative 'rulebook'

class Board
  EMPTY_FIELD = ""
  attr_reader :grid, :rulebook

  def initialize(args)
    check_rulebook(args)
    @grid = @rulebook.tic_tac_toe_grid
  end

  def check_rulebook(args)
    raise 'An actual rulebook is needed to start a game' unless args.fetch(:rulebook).is_a?(Rulebook)
    @rulebook = args.fetch(:rulebook)
  end

  def set_field(args)
    @grid[args.fetch(:index)] = args.fetch(:value)
  end

  def get_field(args)
    @grid[args.fetch(:index)]
  end
end
