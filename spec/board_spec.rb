describe Board do
  subject(:board) { described_class.new() }
  describe '#initialize' do
    result = board.board.length
    expect(result).to eq(8)
  end
end