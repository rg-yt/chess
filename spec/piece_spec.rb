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
    it 'returns and array of valid moves' do
      array = [[1, 0], [1, 1], [0, 1]].sort
      result = piece.get_moves(0, 0, board).sort
      expect(result).to eq(array)
    end
  end
end