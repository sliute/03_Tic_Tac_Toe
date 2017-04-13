class Board
  EMPTY_FIELD = ""
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { EMPTY_FIELD }
  end
end
