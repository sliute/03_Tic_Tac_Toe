require 'board'

describe Board do
  let(:rulebook) { Rulebook.new }
  subject(:board) { described_class.new({rulebook: rulebook}) }

  context '#initialize' do
    it 'starts with an Array object for a grid' do
      expect(board.grid).to be_instance_of(Array)
    end
  end

  context '#set_field' do
    it 'can set the value of a field by index' do
      board.set_field({index: 4, value: "R"})
      expect(board.grid).to eq ["", "", "", "", "R", "", "", "", ""]
    end
  end

  context '#get_field' do
    it 'can get the value of a field by index' do
      board.set_field({index: 4, value: "R"})
      expect(board.get_field({index: 4})).to eq "R"
    end
  end
end
