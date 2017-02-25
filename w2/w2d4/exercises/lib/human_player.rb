class HumanPlayer

  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name)
    @name = name

  end

  def display(board)
    @board = board
    p @board
  end

  def get_move
    puts "Where would you like to move?  i.e. 0,0"
    move = gets.chomp
    move.split(",").map(&:to_i)
  end

end
