require_relative "board"
require_relative "player"

class BattleshipGame

  attr_reader :board, :player

  def initialize(player = HumanPlayer.new("Mark"), board = Board.new)
    @board = board
    @player = player
    @hit = false
  end

  def attack(pos)
    if board[pos] == :s
      @hit = true
    else
      @hit = false
    end

    board[pos] = :x
  end

  def count
    board.count
  end

  def game_over?
    board.won?
  end

  def play_turn
    move = player.get_play
    self.attack(move)
  end

end
