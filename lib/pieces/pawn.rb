require './lib/pieces/piece'

class Pawn < Piece
  attr_accessor :moved

  def initialize(color)
    super(color)
    @character = 'p' << color[0]
    @moved = false
  end

  def get_moves(row, column, board)
    slide_moves(row, column, board) + attack_moves(row, column, board)
  end

  def slide_moves(row, column, board)
    array = []
    moves.each do |move|
      array << (color == 'white' ? [row - move, column] : [row + move, column])
    end
    array.each_with_index do |pair, index|
      array = array[0...index] if board.dig(pair[0], pair[1])
    end
    array
  end

  def attack_moves(row, column, board)
    array = []
    movement = (color == 'white' ? [[-1, -1], [-1, 1]] : [[1, -1], [1, -1]])
    movement.each do |pair|
      add_row = pair[0] + row
      add_column = pair[1] + column
      next unless add_row.between?(0, 7) && add_column.between?(0, 7)

      array << [add_row, add_column] if board.dig(add_row, add_column) && board.dig(add_row, add_column).color != color
    end
    array
  end

  def moves
    moved ? [1] : [1, 2]
  end
end
