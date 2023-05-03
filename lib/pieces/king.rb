require './lib/pieces/piece'

class King < Piece
  def initialize(color)
    super(color)
    @character = 'K' << color[0]
  end
  
  def get_moves(row, column, board)
  end
end