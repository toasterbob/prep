class Fixnum

  ONES = %w(zero one two three four five six seven eight nine)
  TEENS = %w(ten eleven twelve thirteen fourteen fifteen sixteen
            seventeen eighteen nineteen)
  TENS = %w(zero ten twenty thirty forty fifty sixty seventy eighty ninety)
  POWERS = %w(hundred thousand million billion trillion quadrillion)

  def in_words
    
    if self < 10
      ONES[self]
    elsif self < 20
      place = self - 10
      TEENS[place]
    elsif self < 100
      if self % 10 == 0
        TENS[self / 10]
      else
        "#{TENS[self / 10]} #{ONES[self % 10]}"
      end
    else
      big_nums(self)
    end

  end

  def big_nums(num)
    if num < 1000
      ones = num / 100
      left = num % 100
      if left == 0
        "#{ones.in_words} #{POWERS[0]}"
      else
        "#{ones.in_words} #{POWERS[0]} #{left.in_words}"
      end
    else
      i = 3
      i += 3 until num < 10**i #find the one above and then go lower
      ones = num / 10**(i - 3)
      left = num % 10**(i - 3)
      if left == 0
        "#{ones.in_words} #{POWERS[(i - 3) / 3]}"
      else
        "#{ones.in_words} #{POWERS[(i - 3) / 3]} #{left.in_words}"
      end
    end
  end
end
