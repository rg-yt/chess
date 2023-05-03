require './lib/pieces/piece'
class Knight < Piece
  def initialize(color)
    super(color)
    @character = 'k' << color[0]
  end
  def get_moves(*args)
    []
  end
end