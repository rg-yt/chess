require './lib/pieces/piece'

class Bishop < Piece
  def initialize(color)
    super(color)
    @character = 'b' << color[0]
  end

  def get_moves(row, column, board)
    slide_right_up(row, column, board) +
      slide_right_down(row, column, board) +
      slide_left_up(row, column, board) +
      slide_left_down(row, column, board)
  end

  def slide_right_up(row, column, board, array = [])
    array << [row, column]
    return array[1..] if row.zero? || column == 7
    if board.dig(row, column) && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_right_up(row - 1, column + 1, board, array)
  end

  def slide_right_down(row, column, board, array = [])
    array << [row, column]
    return array[1..] if row == 7 || column == 7
    if board.dig(row, column) && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_right_down(row + 1, column + 1, board, array)
  end

  def slide_left_up(row, column, board, array = [])
    array << [row, column]
    return array[1..] if row.zero? || column.zero?
    if board.dig(row, column) && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_left_up(row - 1, column - 1, board, array)
  end

  def slide_left_down(row, column, board, array = [])
    array << [row, column]
    return array[1..] if row == 7 || column.zero?
    if board.dig(row, column) && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_left_down(row + 1, column - 1, board, array)
  end

end

