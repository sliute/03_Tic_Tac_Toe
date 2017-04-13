require 'spec_helper'
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
end
