class Board
  attr_accessor :board
  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def starting_board
    place_pawns('white')
    place_row('white')
    place_pawns('black')
    place_row('black')
    board
  end
  
  def place_pawns(color)
    color == 'white' ? board[6].map!{ |piece| piece = 'P_W'} : board[1].map!{ |piece| piece = 'P_W'}
  end

  def place_row(color)
    color == 'white' ? board[7] = initial_row : board[0] = initial_row
  end
  
  def initial_row
    ['r', 'k', 'b', 'Q', 'K', 'b', 'k', 'r' ]
  end
end