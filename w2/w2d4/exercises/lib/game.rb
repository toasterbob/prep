require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_accessor :board

  def initialize(player1, player2)
    @board = Board.new
    @player1 = player1
    @player2 = player2

    #set marks
    @player1.mark = :X
    @player2.mark = :O

  end


  def current_player
    
  end

  def switch_players!

  end

  def play_turn

  end

  def play

  end

end
