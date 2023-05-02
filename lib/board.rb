require './lib/piece'
class Board
  attr_accessor :board, :piece

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @piece = {}
  end

  def select_piece(row, column)
    piece[:row] = row
    piece[:column] = column
    piece[:object] = board.dig(row, column)
    piece[:moves] = piece[:object] ? piece[:object].get_moves(row, column, board) : []
  end

  def move_piece(row, column)
    return unless piece[:moves].include?([row, column])

    board[row][column] = piece[:object]
    board[piece[:row]][piece[:column]] = nil
  end

  def starting_board
    place_pawns('white', 6)
    place_row('white')
    place_pawns('black', 1)
    place_row('black')
    board
  end

  def place_pawns(color, row)
    board[row].map!.with_index {|piece, column| piece = Piece.new(color)}
  end

  def place_row(color)
    color == 'white' ? board[7] = initial_row : board[0] = initial_row
  end

  def initial_row
    ['r', 'k', 'b', 'Q', 'K', 'b', 'k', 'r' ]
  end

  def show_board
    board.each_with_index do |row, index|
      print index
      row.each {|item| !item.nil? ? (print "|#{item} |") : (print '| _ |') }
      puts ''
    end
    print ' '
    8.times{|num| print "  #{num}  "}
  end
end

board = Board.new
board.board[0][0] = Piece.new('white')
board.board[7][7] = Piece.new('black')
board.select_piece(0, 1)
