require './lib/pieces/piece'
class Pawn < Piece
  def initialize(color)
    super(color)
    @character = 'p' << color[0]
  end
  def get_moves(row, column, board)
  end
end