class Rulebook
  MIN_PLAYERS = 2
  MAX_PLAYERS = 2

  def check_board(args)
    raise 'An actual board is needed to start a game' unless args.fetch(:board).is_a?(Board)
    args.fetch(:board)
  end
end
