require './lib/piece'
describe Piece do
  subject(:piece) { described_class.new('white') }
  describe '#initialize' do
    it 'white piece has a character of xw' do
      result = piece.character
      expect(result).to eq('xw')
    end
  end
end