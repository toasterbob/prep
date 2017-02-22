VOWELS = ["a", "e", "i", "o", "u"]

def translate(words)
  answer = []
  words.split(" ").each do |word|
    answer << pig_latin(word)
  end
  answer.join(" ")
end

def pig_latin(word)
  if VOWELS.include?(word[0])
    "#{word}ay"
  else
    beginning = 0
    until VOWELS.include?(word[beginning])
      beginning += 1
    end
    beginning += 1 if word[beginning - 1] == "q"
    "#{word[beginning..-1]}#{word[0...beginning]}ay"
  end
end

# def first(word)
#   threes = ["sch", "shr", "thr", "squ"]
#   twos = ["qu"]
#   first_letter = word[0]
#   two_letter = word[0, 2]
#   three_letter = word[0, 3]
#   if VOWELS.include?(first_letter)
#     [first_letter, word]
#   elsif threes.include?(three_letter)
#     [three_letter, word[3..-1]]
#   elsif twos.include?(two_letter)
#     [two_letter, word[2..-1]]
#   elsif word[1] == "r" || word[1] == "h"
#     [two_letter, word[2..-1]]
#   else
#     [first_letter, word[1..-1]]
#   end
# end
#
# def pig_latin(word)
#
#   first_letter, new_word = first(word)
#   if VOWELS.include?(first_letter)
#     "#{new_word}ay"
#   else
#     "#{new_word}#{first_letter}ay"
#   end
#
# end
