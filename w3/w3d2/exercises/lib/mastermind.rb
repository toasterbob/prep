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

  def exact_matches(code)
    number_matches = 0
    4.times do |i|
      number_matches += 1 if code[i].downcase == @pegs[i].downcase
    end
    number_matches
  end

  def near_matches(code)
    number_matches = 0
    code.pegs.uniq.each do |color|
      number_matches += [code.pegs.count(color), @pegs.count(color)].min
    end
    number_matches - exact_matches(code)
  end

  def [](num)
    @pegs[num]
  end

  def ==(code)
    return false if code.class != Code
    4.times do |i|
      return false if code[i].downcase != @pegs[i].downcase
    end
    true
  end

end

class Game
  attr_reader :secret_code
  def initialize(secret_code)
    @secret_code = secret_code
  end
end
