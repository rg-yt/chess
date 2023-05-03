class Piece
  attr_reader :character, :color

  def initialize(color)
    @color = color
    @character = 'x' << color[0]
  end

  def moveset
    [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
  end

  def valid_moves(row, column, board)
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

  def to_s
    character
  end
end