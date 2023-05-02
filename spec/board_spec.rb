require './lib/board'
describe Board do
  subject(:board) { described_class.new() }
  describe '#initialize' do
    it 'retuns a board length of 8' do
      result = board.board.length
      expect(result).to eq(8)
    end

    it 'each row has a length of 8' do
      result = board.board.all?{ |row| row.length == 8}
      expect(result).to be true
    end
  end

  describe '#starting_board' do
    it 'changes the board' do
      expect{board.starting_board}.to change{board.board}
    end
  
  end
end