require './lib/pieces'

class Board
  attr_accessor :board, :piece, :players
  def initialize
    @board = Array.new(8) { Array.new(8) }
    @piece = {}
    @players = %w(white black)
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
    place_row('white', 7)
    place_pawns('black', 1)
    place_row('black', 0)
    board
  end

  def place_pawns(color, row)
    board[row].map!{ |piece| piece = Pawn.new(color) }
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

  def find_colors_king(color)
    board.each do |row|
      row.find do |piece|
        next unless piece
        piece.color == 'white' 
      end
    end
  end
  
  def current_player
    players[0]
  end

  def switch_player!
    players.rotate!(1)
  end

  def in_check?
    array = []
    board.each_with_index do |line, row|
      line.each_with_index do |piece, column|
        next if piece.nil?

        piece.get_moves(row, column, board).each do |move|
          next if piece 
          piece = board.dig(move.first, move.last) 
          array << piece.is_a?(King) && piece.color != current_player
        end
      end
    end
    array.any? {|value| value == true}
  end
end

