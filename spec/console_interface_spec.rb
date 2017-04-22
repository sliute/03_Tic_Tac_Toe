require 'console_interface'

describe ConsoleInterface do
  # let(:rulebook) { Rulebook.new }
  # let(:board) { Board.new({rulebook: rulebook}) }
  # let(:player_01) { Player.new({rulebook: rulebook, type: 'h', sign: '0', name: 'Batman'}) }
  # let(:player_02) { Player.new({rulebook: rulebook, sign: 'X', type: 'h', name: 'Superman'}) }
  # let(:game) { Game.new({board: board, rulebook: rulebook, player_01: player_01, player_02: player_02, starting_player: 2}) }
  subject(:console_interface) { described_class.new({rulebook: Rulebook.new}) }

  # context "#initialize" do
  #   it 'starts with a Board object' do
  #     expect(console_interface.board).to be_instance_of(Board)
  #   end
  # end
  #
  # context "#print_board" do
  #   it 'prints the board in the console' do
  #     empty_board = "  |  |  \n===+===+===\n  |  |  \n===+===+===\n  |  |  \n"
  #     expect(console_interface.print_board).to eq empty_board
  #   end
  # end

  context "interactive menu components" do
    it '#print_menu prints welcome message' do
      message = "Welcome to Z Company's Tic Tac Toe!\n\nTo play in the console, press p\nTo exit, press q\n\n"
      expect { console_interface.print_menu }.to output(message).to_stdout
    end

    xit '#process initiates a new game when pressing "p"' do

    end

    it '#process exits the interface when pressing "q"' do
      expect { console_interface.process('q') }.to raise_error SystemExit
    end
  end
end
