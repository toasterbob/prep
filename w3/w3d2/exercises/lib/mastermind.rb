class Code
  PEGS = {"R" => "Red", "G" => "Green", "B" => "Blue", "Y" => "Yellow",
          "O" => "Orange", "P" => "Purple"}

  attr_reader :pegs

  def initialize(pegs)
    @pegs = pegs
  end

  def self.parse(input)
    arr = []
    input.chars do |ch|
      raise "not a color" unless PEGS.keys.include?(ch.upcase)
      arr << ch.upcase
    end
    Code.new(arr)
  end

  def self.random
    colors = %w(R G B Y O P)
    results = []
    4.times do
      results << colors.sample
    end
    Code.new(results)
  end

  def exact_matches

  end

  def [](num)
    @pegs[num]
  end

end

class Game
  attr_reader :secret_code
end
