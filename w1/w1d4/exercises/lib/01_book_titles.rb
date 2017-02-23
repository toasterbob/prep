SMALL_WORLDS = %w[the a of and in from an]

class Book
  attr_accessor :title

  def title=(title)
    @title = titleize(title)
  end

  def titleize(title)
    title.capitalize!
    titled_words = []
    title.split(" ").each do |word|
      if SMALL_WORLDS.include?(word)
        titled_words << word
      else
        titled_words << word.capitalize
      end
    end
    titled_words.join(" ")
  end

end
