require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board, :current_player

  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1
    @player2 = player2

    #set marks
    @player1.mark = :X
    @player1.other_mark = :O
    @player2.mark = :O
    @player2.other_mark = :X

    #give board
    @player1.board = board
    @player2.board = board

    #set current_player
    self.current_player = @player1

  end

  def switch_players!
    self.current_player = self.current_player == @player1 ? @player2 : @player1
  end

  def play_turn
    move = self.current_player.get_move
    @board.place_mark(move, current_player.mark)
    switch_players!
  end

  def play
    until board.winner
      play_turn
    end
    @player1.display(board)
    puts "#{board.winner} wins!"
  end

end

if $PROGRAM_NAME == __FILE__

  print "Enter your name: "
  name = gets.chomp
  human = HumanPlayer.new(name)
  garry = ComputerPlayer.new('Dumb Computer')

  new_game = Game.new(human, garry)
  new_game.play
end
