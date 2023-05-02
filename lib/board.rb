require './lib/piece'
class Board
  attr_accessor :board, :selected_piece
  def initialize
    @board = Array.new(8) { Array.new(8) }
    @selected_piece = nil
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

  def show_board
    board.each do |row|
      row.each {|item| !item.nil? ? (print "|#{item} |") : (print '| _ |') }
      puts ''
    end
  end
end
