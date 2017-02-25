class HumanPlayer

  attr_reader :name
  attr_accessor :mark, :board, :other_mark

  def initialize(name)
    @name = name

  end

  def display(board)
    system('clear')
    row0 = "0 |"
    (0..2).each do |col|
      row0 << (board.empty?([0, col]) ? "   |" : " " + board.grid[0][col].to_s + " |")
    end
    row1 = "1 |"
    (0..2).each do |col|
      row1 << (board.empty?([1, col]) ? "   |" : " " + board.grid[1][col].to_s + " |")
    end
    row2 = "2 |"
    (0..2).each do |col|
      row2 << (board.empty?([2, col]) ? "   |" : " " + board.grid[2][col].to_s + " |")
    end

    puts "    0   1   2  "
    puts "  |-----------|"
    puts row0
    puts "  |-----------|"
    puts row1
    puts "  |-----------|"
    puts row2
    puts "  |-----------|"
  end

  def get_move
    self.display(board)
    puts "Where would you like to move?  i.e. 0,0"
    move = gets.chomp
    move = move.split(",").map(&:to_i)
    if board.empty?(move)
      move
    else
      puts "invalid move"
      sleep 2
      self.get_move
    end
  end

end
