require './lib/pieces/piece'
class Queen < Piece
  def initialize(color)
    super(color)
    @character = 'Q' << color[0]
  end
end