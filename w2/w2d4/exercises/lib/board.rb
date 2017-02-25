class Board
  attr_reader :grid

  def initialize(grid = Array.new(3) {Array.new(3)})
    @grid = grid
  end

  def place_mark(pos, mark)
    # raise "Spot already taken" unless self.empty?(pos)
    x, y = pos
    self.grid[x][y] = mark
  end

  def empty?(pos)
    x, y = pos
    @grid[x][y].nil?
  end

  def winner
    (0..2).each do |i|
      return @grid[i][0] if @grid[i][0] && [@grid[i][0], @grid[i][1], @grid[i][2]].uniq.length == 1
      return @grid[0][i] if @grid[0][i] && [@grid[0][i], @grid[1][i], @grid[2][i]].uniq.length == 1
    end
    return @grid[0][0] if @grid[0][0] && [@grid[0][0], @grid[1][1], @grid[2][2]].uniq.length == 1
    return @grid[0][2] if @grid[0][2] && [@grid[0][2], @grid[1][1], @grid[2][0]].uniq.length == 1
    nil
  end
 
  def over?
    @grid.flatten.none? { |pos| pos.nil? } || winner
  end




end
