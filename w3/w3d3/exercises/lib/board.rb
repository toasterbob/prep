class Board

  attr_reader :grid

  def self.default_grid
    Array.new(10) { Array.new(10) }
  end

  def initialize(grid = self.class.default_grid)
    @grid = grid
  end

  def count
    grid.flatten.count(:s)
  end

  def empty?(pos = nil)
    if pos
      self[pos].nil?
    else
      self.count == 0
    end
  end

  def full?
    grid.flatten.each do |pos|
      return false if pos.nil?
    end
    true
  end

  def place_random_ship
    size = grid.length
    raise "board is full" if full?
    pos = [rand(size), rand(size)]
    until empty?(pos)
      pos = [rand(size), rand(size)]
    end
    self[pos] = :s
  end

  def won?
    self.count == 0
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end 



end
