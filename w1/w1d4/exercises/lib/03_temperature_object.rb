class Temperature
  attr_accessor :fahrenheit, :celsius

  def initialize(options)
    if options[:f]
      self.fahrenheit = options[:f]
      self.celsius = (self.fahrenheit - 32) * 5/9.0
    else
      self.celsius = options[:c]
      self.fahrenheit = (self.celsius * 9/5.0) + 32
    end
  end

  def in_fahrenheit
    self.fahrenheit
  end

  def in_celsius
    self.celsius
  end

  def self.from_celsius(num)
    Temperature.new(:c => num)
  end

  def self.from_fahrenheit(num)
    Temperature.new(:f => num)
  end

end

class Celsius < Temperature
  def initialize(temp)
    self.celsius = temp
    self.fahrenheit = (temp * 9/5.0) + 32
  end
end

class Fahrenheit < Temperature
  def initialize(temp)
    self.fahrenheit = temp
    self.celsius = (temp - 32) * 5/9.0
  end
end
