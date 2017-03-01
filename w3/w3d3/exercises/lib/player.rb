class HumanPlayer

  def initialize(name = "Bob")
    @name = name
  end

  def take_turn
    puts "Please enter a coordinate.  i.e. 3,5"
    gets.chomp.split(",").map(&:to_i)
  end

end
