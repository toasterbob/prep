require_relative "board"
require_relative "player"

class BattleshipGame

  attr_reader :board, :player

  def random_board
    random_b = Board.new
    random_b.randomize
    random_b
  end

  def initialize(player = HumanPlayer.new("Mark"), board = random_board)
    @board = board
    @player = player
    @hit = false
  end

  def attack(pos)
    if board[pos] == :s
      @hit = true
      board[pos] = :h
    else
      @hit = false
      board[pos] = :x
    end

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

  def declare_winner
    puts "Congratulations. You win!"
  end

  def display_status
    system("clear")
    board.display
    puts "It's a hit!" if hit?
    puts "There are #{count} ships remaining."
  end

  def hit?
    @hit

  end

  def play
    play_turn until board.won?
    declare_winner
  end

  def play_turn
    pos = nil

    until valid_play?(pos)
      pos = player.get_play
    end

    attack(pos)
    display_status
  end

  def valid_play?(pos)
    pos.is_a?(Array) && board.in_range?(pos) && board[pos] != :h  && board[pos] != :x
  end

end

if __FILE__ == $PROGRAM_NAME
  BattleshipGame.new.play
end
