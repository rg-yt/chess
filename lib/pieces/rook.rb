require './lib/pieces/piece'
class Rook < Piece
  def initialize(color)
    super(color)
    @character = 'r' << color[0]
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
    if board[row][column] && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_up(row - 1, column, board, array)
  end

  def slide_down(row, column, board, array = [])
    array << [row, column]
    return array[1..] if row == board.length
    if board[row][column] && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_down(row + 1, column, board, array)
  end

  def slide_left(row, column, board, array = [])
    array << [row, column]
    return array[1..] if column.zero?
    if board[row][column] && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_left(row, column - 1, board, array)
  end

  def slide_right(row, column, board, array = [])
    array << [row, column]
    return array[1..] if column == board.length
    if board[row][column] && board[row][column] != self
      return board[row][column].color == color ? array[1...-1] : array[1..]
    end

    slide_right(row, column + 1, board, array)
  end
end
