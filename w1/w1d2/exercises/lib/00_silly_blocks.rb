def reverser(&prc)
  words = prc.call
  words.split(" ").map { |word| word.reverse }.join(" ")
end

def adder(add_num = 1, &prc)
  number = prc.call
  number + add_num
end

def repeater(num_times = 1, &prc)
  num_times.times { prc.call }

end
