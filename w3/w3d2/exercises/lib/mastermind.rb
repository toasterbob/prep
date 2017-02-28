class Code
  PEGS = {"R" => "Red", "G" => "Green", "B" => "Blue", "Y" => "Yellow",
          "O" => "Orange", "P" => "Purple"}

  attr_reader :pegs

  def initialize(pegs)
    @pegs = pegs
  end

  def self.parse(input)
    
  end

  def self.random
    colors = %w(R G B Y O P)
    results = []
    4.times do
      results << colors.sample
    end
    Code.new(results)
  end

end

class Game
  attr_reader :secret_code
end
