require 'board'

class ConsoleInterface
  attr_reader :board

  def initialize(args = {board: Board.new})
    @board = args.fetch(:board)
  end

  def show_board
    grid = @board.grid
    " #{grid[0]} | #{grid[1]} | #{grid[2]} \n===+===+===\n #{grid[3]} | #{grid[4]} | #{grid[5]} \n===+===+===\n #{grid[6]} | #{grid[7]} | #{grid[8]} \n"
  end
end
