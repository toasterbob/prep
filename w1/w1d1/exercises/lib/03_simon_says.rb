
def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, x = 2)
  # answer = ""
  # x.times { answer << "#{word} "}
  # answer.chop!
  answer = Array.new(x, word)
  answer.join(" ")
end

def start_of_word(word, x = 1)
  word[0, x]
end

def titleize(words)
  words.capitalize!
  little_words = ["a", "the", "an", "of", "and", "over"]
  answer = words.split(" ").map { |word| little_words.include?(word) ? word : word.capitalize}
  answer.join(" ")
end

def first_word(words)
  words = words.split(" ")
  words.first
end
