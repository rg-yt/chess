require './lib/pieces/piece'

class Bishop < Piece
  def initialize(color)
    super(color)
    @character = 'b' << color[0]
  end
end