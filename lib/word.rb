require './lib/dictionary'

class Word
  @@words = {}
  @@total_words = 0

  def initialize(name, word_id)
    @name = name
    @word_id = word_id || @@total_words += 1
  end

  def self.all
    @@words.values().sort_by { | val| val.name}
  end

  def add_word


  end

  def update_word
  end

  def delete_word
  end




end
