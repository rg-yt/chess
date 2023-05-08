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
      move_piece
      switch_player
    end
  end 

  def switch_player
    @current_player == 'white' ? @current_player = 'black' : @current_player = 'white'
  end

  def select_piece
    board.show_board
    board.select_piece(current_player)
    options
  end

  def move_piece
    loop do
      board.show_board
      break if board.move_piece
    end
  end

  def options
    print "#{board.piece[:object]} is selected\n"
    print "Would you like to move piece or change \n"
  end
  
  # def move_or_change
  #   answer = gets.chomp
  #   loop do
  #     answer = answer.slice(0)
  #     break if answer.match(/^[a-zA-Z]/)
  #     answer = gets.chomp
  #   end
  #   answer[0].upcase == 'M' ? move_piece : select_piece
  # end
end 

game = Game.new 
game.play