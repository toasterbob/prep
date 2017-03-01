class Hangman
  attr_reader :guesser, :referee, :board, :word

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
    @num_remaining_guesses = 8
  end

  def setup
    length = @referee.pick_secret_word
    @guesser.register_secret_length(length)
    @board = Array.new(length)
  end

  def take_turn
    guess = @guesser.guess(board)
    indices = @referee.check_guess(guess)
    self.update_board(indices, guess)
    @num_remaining_guesses -= 1 if indices.empty?
    @guesser.handle_response(guess, indices)
  end

  def update_board(indices, guess)
    indices.each do |index|
      @board[index] = guess
    end
  end

  def play
    setup

    while @num_remaining_guesses > 0
      display
      take_turn

      if won?
        p @board
        puts "Guesser wins!"
        return
      end
    end

    puts "Word was: #{@referee.require_secret}"
    puts "Guesser loses!"

    nil
  end

  def display
    result = ""
    @board.each do |letter|
      if letter.nil?
        result << "__ "
      else
        result << " #{letter} "
      end
    end
    puts result
  end

  def won?
    @board.all?
  end

end

class HumanPlayer
  attr_reader :secret_word, :length

  def initialize(name = "Jimbob")
    @name = name
  end

  def pick_secret_word
    puts "Pick the secret word: "
    @secret_word = gets.chomp
    @length = @secret_word.length
  end

  def register_secret_length(length)

  end

  def guess(board)
    puts "please enter your guess: "
    guess = gets.chomp
  end

  def check_guess(guess)

  end

  def handle_response(guess, indices)
    puts "the letter '#{guess}' appears #{indices.length} time(s)"
    puts
  end
end

class ComputerPlayer
  attr_reader :secret_word, :length

  def self.player_with_dict_file(dict_file_name)
    ComputerPlayer.new(File.readlines(dict_file_name).map(&:chomp))
  end


  def initialize(dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    secret_word.length
  end

  def register_secret_length(length)
    @length = length
    @dictionary.select! { |word| word.length == @length }
  end

  def guess(board)

    most_common = self.letter_frequency(board)
    most_common = most_common.sort_by { |letter, frequency| frequency }

    most_common.last[0]
  end

  def letter_frequency(board)
    letter_hash = {}
    @dictionary.each do |word|
      word.chars do |ch|
        next unless ("a".."z").include?(ch.downcase)
        next if board.include?(ch.downcase)
        if letter_hash[ch]
          letter_hash[ch] += 1
        else
          letter_hash[ch] = 1
        end
      end
    end
    letter_hash
  end

  def check_guess(letter)
    indices = []
    secret_word.each_char.with_index do |char, i|
      indices << i if char == letter
    end
    indices
  end

  def handle_response(guess, indices)
    @dictionary.select! { |word| word.count(guess) == indices.count }
    indices.each do |index|
      @dictionary.select! { |word| word[index] == guess }
    end
  end

  def candidate_words
    @dictionary
  end

  def require_secret
    secret_word
  end


end


if __FILE__ == $PROGRAM_NAME
  # use print so that user input happens on the same line
  print "Guesser: Computer (yes/no)? "
  if gets.chomp == "yes"
    guesser = ComputerPlayer.player_with_dict_file("dictionary.txt")
  else
    guesser = HumanPlayer.new
  end

  print "Referee: Computer (yes/no)? "
  if gets.chomp == "yes"
    referee = ComputerPlayer.player_with_dict_file("dictionary.txt")
  else
    referee = HumanPlayer.new
  end

  Hangman.new({guesser: guesser, referee: referee}).play
end
