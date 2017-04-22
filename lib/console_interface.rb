require_relative 'game'

class ConsoleInterface
  attr_reader :rulebook, :game

  def initialize(args)
    check_rulebook(args)
  end

  def check_rulebook(args)
    raise 'An actual rulebook is needed to use this interface' unless args.fetch(:rulebook).is_a?(Rulebook)
    @rulebook = args.fetch(:rulebook)
  end

  # def print_board
  #   grid = @board.grid
  #   " #{grid[0]} | #{grid[1]} | #{grid[2]} \n===+===+===\n #{grid[3]} | #{grid[4]} | #{grid[5]} \n===+===+===\n #{grid[6]} | #{grid[7]} | #{grid[8]} \n"
  # end

  def start_game
    game_params = {rulebook: @rulebook, board: Board.new({rulebook: @rulebook})}
    for i in 1..Rulebook::MAX_PLAYERS do
      puts "What is player no. #{i}'s name?"
      player_name = STDIN.gets.chomp
      input_type
      input_sign(i)
      player_handle = ("player_0" + i.to_s).to_sym
      game_params[player_handle] = Player.new({rulebook: @rulebook, name: player_name, type: player_type, sign: player_sign})
    end
    puts "Which player starts the game? [1..last]"
    game_params[:starting_player] = STDIN.gets.chomp.to_i
    @game = Game.new(game_params)
    # TO CONTINUE WITH GAMEPLAY
  end

  def input_type
    status = false
    while !status do
      begin
        puts "Are they human (h/H) or computer (c/C)?"
        input = STDIN.gets.chomp
        player_type = @rulebook.check_player_type({type: input})
        status = true
      rescue
        puts "You can only play as either human (h/H) or computer (c/C)"
        retry
      end
    end
  end

  def input_sign(i)
    status = false
    while !status do
      begin
        puts "What is player no. #{i}'s one-character sign?"
        input = STDIN.gets.chomp
        player_sign = @rulebook.check_player_sign({sign: input})
        status = true
      rescue
        puts "You must provide a single-character sign"
        retry
      end
    end
  end

  def print_menu
    puts "Welcome to Z Company's Tic Tac Toe!"
    puts
    puts "To play in the console, press p"
    puts "To exit, press q"
    puts
  end

  def process(input)
    case input
      when "p"
        start_game
      when "q"
        exit
      else
        puts
        puts "I don't know what you mean, please try again."
        puts
    end
  end

  def interactive_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
  end
end
