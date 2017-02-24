class RPNCalculator
  attr_accessor :stack

  def initialize
    @stack = []
    @value = nil
  end

  def value
    @stack.last
  end

  def push(num)
    @stack.push(num)
  end

  def plus
    raise "calculator is empty" if @stack.empty?
    @stack << @stack.pop + @stack.pop
  end

  def minus
    raise "calculator is empty" if @stack.empty?
    @stack << -@stack.pop + @stack.pop
  end

  def divide
    raise "calculator is empty" if @stack.empty?
    one, two = @stack.pop, @stack.pop
    @stack << two.to_f/one.to_f
  end

  def times
    raise "calculator is empty" if @stack.empty?
    @stack << @stack.pop * @stack.pop
  end

  def tokens(string)
    result = string.split(" ")
    result.map { |char| operator?(char) ? char.to_sym : char.to_i }
  end

  def evaluate(string)
    @value = nil
    @stack = []
    tokenize_string = tokens(string)
    tokenize_string.each do |el|
      if el == :+
        self.plus
      elsif el == :-
        self.minus
      elsif el == :*
        self.times
      elsif el == :/
        self.divide
      else
        self.push(el)
      end
    end
    self.value
  end

  private

  def operator?(char)
    return true if char == "*" || char == "/" || char == "+" || char == "-"
    false
  end


end
