class Hangman
  attr_reader :guesser, :referee, :board, :word

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
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
    @guesser.handle_response(guess, indices)
  end

  def update_board(indices, guess)
    indices.each do |index|
      @board[index] = guess
    end
  end

end

class HumanPlayer
  def initialize(name = "Jimbob")
    @name = name
  end

  def pick_secret_word

  end

  def register_secret_length(length)

  end

  def guess

  end

  def check_guess(guess)

  end

  def handle_response

  end
end

class ComputerPlayer
  attr_reader :secret_word, :length

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

    all_words = @dictionary.join("")
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
end
