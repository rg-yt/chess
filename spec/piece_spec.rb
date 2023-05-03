require './lib/pieces/piece'
describe Piece do
  subject(:piece) { described_class.new('white') }
  describe '#initialize' do
    it 'white piece has a character of xw' do
      result = piece.character
      expect(result).to eq('xw')
    end
  end

  describe '#get_moves' do
    let(:board) { Array.new(8) { Array.new(8) } }
    it 'returns an array of all valid moves' do
      board[2][2] = Piece.new('white')
      array = [[2, 3], [2, 4], [3, 2], [3, 4], [4, 2], [4, 3], [4, 4]]
      result = piece.get_moves(3, 3, board)
      expect(result).to eq(array)
    end
  end
end