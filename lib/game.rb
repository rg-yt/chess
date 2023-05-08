require './lib/board'

class Game
  attr_accessor :board, :current_player
  def initialize
    @board = Board.new
    @current_player = 'white'
  end

  def play
    board.starting_board
    loop do
      select_piece
      options
      switch_player

    end
  end 

  def switch_player
    @current_player == 'white' ? @current_player = 'black' : @current_player = 'white'
  end

  def select_piece
    board.show_board
    board.select_piece(current_player)
  end

  def move_piece
    board.show_board
    board.move_piece
  end

  def options
    board.show_board
    print "#{board.piece[:object]} is selected\n"
    print 'Would you like to move piece or change piece?'
    answer = gets.chomp.upcase[0]
    case answer
    when 'M'
      options unless move_piece
    when 'C'
      select_piece
      options
    else 
      answer = gets.chomp.upper[0]
    end
  end
  
end 

game = Game.new 
game.play