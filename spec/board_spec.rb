require 'board'

describe Board do
  context '#initialize' do
    it 'starts as a 9-element array with empty fields for elements' do
      board = Board.new
      expect(board.grid).to be_instance_of(Array)
      expect(board.grid.length).to eq 9
      board.grid.each do |element|
        expect(element).to eq ""
      end
    end
  end

  context '#set_field' do
    it 'can set the value of a field by index' do
      board = Board.new
      board.set_field({index: 4, value: "R"})
      expect(board.grid).to eq ["", "", "", "", "R", "", "", "", ""]
    end
  end

  context '#get_field' do
    it 'can get the value of a field by index' do
      board = Board.new
      board.set_field({index: 4, value: "R"})
      expect(board.get_field({index: 4})).to eq "R"
    end
  end
end
