require './lib/pieces/piece'

class King < Piece
  attr_reader :color
  def initialize(color)
    super(color)
    @character = 'K' << color[0]
  end
  
  def moveset
    [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
  end

  def get_moves(row, column, board)
    moves = []
    moveset.each do |move|
      moves << [row, column].zip(move).map { |n| n.reduce(&:+) }
    end
    inbounds_moves(moves, board)
  end

  def inbounds_moves(moves, board)
    moves.select! do |move|
      move.all? { |num| num.between?(0, 7) }
    end
    team_check(moves, board)
  end

  def team_check(moves, board)
    moves.select! do |move|
      board[move.first][move.last].nil? || board[move.first][move.last].color != color
    end
    moves
  end
end
