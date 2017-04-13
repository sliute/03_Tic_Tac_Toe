require 'console_interface'

describe ConsoleInterface do
  context "#initialize" do
    it 'starts with a Board object (an empty new one by default)' do
      console_interface = ConsoleInterface.new
      expect(console_interface.board).to be_instance_of(Board)
    end
  end

  context "#show_board" do
    it 'displays the board via the console' do
      console_interface = ConsoleInterface.new
      empty_board = "  |  |  \n===+===+===\n  |  |  \n===+===+===\n  |  |  \n"
      expect(console_interface.show_board).to eq empty_board
    end
  end
end
