class Timer
  attr_accessor :seconds

  def initialize
    @seconds = 0
  end

  def time_string
    left = @seconds

    secs = left % 60
    left = (left - secs) / 60

    mins = left % 60
    left = (left - mins) / 60

    hours = left % 60

    "#{padded(hours)}:#{padded(mins)}:#{padded(secs)}"
  end

  def padded(num)
    num < 10 ? "0#{num}" : num.to_s
  end

end
