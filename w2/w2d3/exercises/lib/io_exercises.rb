# I/O Exercises
#
# * Write a `guessing_game` method. The computer should choose a number between
#   1 and 100. Prompt the user to `guess a number`. Each time through a play loop,
#   get a guess from the user. Print the number guessed and whether it was `too
#   high` or `too low`. Track the number of guesses the player takes. When the
#   player guesses the number, print out what the number was and how many guesses
#   the player needed.
# * Write a program that prompts the user for a file name, reads that file,
#   shuffles the lines, and saves it to the file "{input_name}-shuffled.txt". You
#   could create a random number using the Random class, or you could use the
#   `shuffle` method in array.
def guessing_game
  num = rand(100) + 1
  guesses = 0
  guess = 0

  while guess != num
    puts "Guess a number between 1 and 100"
    guess = gets.chomp.to_i
    guesses += 1
    if guess > num
      puts "#{guess} is too high"
    elsif guess < num
      puts "#{guess} is too low"
    end
  end
  puts "#{guess} is correct!"
  puts "You guessed #{guesses} times!"
end

def shuffle_file(file_name)

  base = File.basename(file_name, ".*")
  extension = File.extname(file_name)

  contents = File.readlines(file_name)
  contents.shuffle!

  File.open("#{base}-shuffled#{extension}", "w") do |f|
    contents.each do |line|
      f.puts line
    end
    f.close
  end

end

if __FILE__ == $PROGRAM_NAME
  if ARGV.length == 1
    shuffle_file(ARGV.shift)
  else
    puts "ENTER FILENAME TO SHUFFLE:"
    filename = gets.chomp
    shuffle_file(filename)
  end
end







#
