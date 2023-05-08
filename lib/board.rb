require './lib/pieces'

class Board
  attr_accessor :board, :piece, :players

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @piece = {}
  end

  def select_piece(color, row = select_row, column = select_column)
    @piece[:object] = board.dig(row, column)
    @piece[:row] = row
    @piece[:column] = column

    select_piece(color) until @piece[:object] && @piece[:object].color == color
  end

  def move_piece(row = select_row, column = select_column)
    return false unless include_moves(row, column)

    board[row][column] = piece[:object]
    board[piece[:row]][piece[:column]] = nil
    undo_move(row, column) if in_check?
    true
  end

  def undo_move(row, column)
    board[row][column] = nil
    board[piece[:row]][piece[:column]] = piece[:object]
  end

  def starting_board
    place_pawns('white', 6)
    place_row('white', 7)
    place_pawns('black', 1)
    place_row('black', 0)
    board
  end

  def place_pawns(color, row)
    board[row].map! { Pawn.new(color) }
  end

  def place_row(color, row)
    board[row] =
      [Rook.new(color),
       Knight.new(color),
       Bishop.new(color),
       Queen.new(color),
       King.new(color),
       Bishop.new(color),
       Knight.new(color),
       Rook.new(color)]
  end

  def show_board
    board.each_with_index do |row, index|
      print index
      row.each { |item| !item.nil? ? (print "|#{item} |") : (print '| _ |') }
      puts ''
    end
    print ' '
    8.times { |num| print "  #{num}  " }
    puts ''
  end

  def include_moves(row, column)
    piece[:object].get_moves(piece[:row], piece[:column], board).include?([row, column])
  end

  def in_check?
    coordintes = find_king
    board.each_with_index do |rows, row|
      rows.each_with_index do |char, column|
        next if char.nil? || char.color == piece[:object].color
        return true if char.get_moves(row, column, board).include?(coordintes)
      end
    end
    false
  end

  def find_king
    board.each_with_index do |rows, row|
      rows.each_with_index do |char, column|
        return [row, column] if char.is_a?(King) && char.color == piece[:object].color
      end
    end
  end

  def select_row
    loop do
      print 'Select row:'
      value = gets.chomp.to_i
      return value if value.between?(0, 7)
    end
  end

  def select_column
    loop do
      print 'Select column:'
      value = gets.chomp.to_i
      return value if value.between?(0, 7)
    end
  end
end
