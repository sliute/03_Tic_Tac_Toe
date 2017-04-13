class Board
  EMPTY_FIELD = ""
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { EMPTY_FIELD }
  end

  def set_field(args)
    @grid[args.fetch(:index)] = args.fetch(:value)
  end

  def get_field(args)
    @grid[args.fetch(:index)]
  end
end
