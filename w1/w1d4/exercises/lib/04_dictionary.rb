class Dictionary
  attr_accessor :entries

  def initialize
    @entries = {}
  end

  def add(entry)
    if entry.is_a?(String)
      @entries[entry] = nil
    elsif entry.is_a?(Hash)
      @entries.merge!(entry)
    end
  end

  def keywords
    @entries.keys.sort
  end

  def include?(word)
    self.keywords.include?(word)
  end

  def find(word)
    @entries.select { |key, definition| key.match(word)}
  end

  def printable
    @entries.each do |key, definition|
      
    end
  end

end
