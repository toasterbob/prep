class ComputerPlayer

  attr_reader :name
  attr_accessor :mark, :board, :other_mark

  def initialize(name = "computer")
    @name = name

  end

  def display(board)

    @board = board 

  end

  def get_move
    moves = []
    #get all possible moves
    (0..2).each do |i|
      (0..2).each do |j|
        moves << [i, j] if @board.grid[i][j].nil?
      end
    end
    move = wins?(moves, @board)
    move ? move : moves.sample
  end

  def wins?(moves, board)
    moves.each do |move|
      i, j = move
      board.grid[i][j] = mark
      return move if board.winner
      board.grid[i][j] = nil
    end
    nil
  end

end
