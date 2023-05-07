require './lib/pieces/piece'

class Rook < Piece
  def initialize(color)
    super(color)
    @character = 'r' << color[0]
  end

  def moves
    [[1, 0], [0, -1], [0, 1], [-1, 0]]
  end

  def get_moves(row, column, board)
    slide_up(row, column, board) +
      slide_down(row, column, board) +
      slide_left(row, column, board) +
      slide_right(row, column, board)
  end

  def slide_up(row, column, board, array = [])
    array << [row, column]
    return array[1..] if row.zero?
    if board.dig(row, column) && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_up(row - 1, column, board, array)
  end

  def slide_down(row, column, board, array = [])
    array << [row, column]
    return array[1..] if row == 7
    if board.dig(row, column) && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_down(row + 1, column, board, array)
  end

  def slide_left(row, column, board, array = [])
    array << [row, column]
    return array[1..] if column.zero?
    if board.dig(row, column) && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_left(row, column - 1, board, array)
  end

  def slide_right(row, column, board, array = [])
    array << [row, column]
    return array[1..] if column == 7
    if board.dig(row, column) && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_right(row, column + 1, board, array)
  end

  def to_s
    character
  end
end
