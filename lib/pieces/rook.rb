require './lib/pieces/piece'
class Rook < Piece
  def initialize(color)
    super(color)
    @character = 'r' << color[0]
  end
end