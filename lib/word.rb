require './lib/dictionary'

class Word

  attr_reader :word_id, :name

  @@words = {}
  @@total_words = 0

  def initialize(name, word_id)
    @name = name
    @word_id = word_id || @@total_words += 1
  end

  def self.all
    @@words.values().sort_by { | val| val.name}
  end

  def save_word

    @@words[self.word_id] = Word.new(self.name,self.word_id)

  end

  def update_word(name)
    @name = name

  end

  def delete_word

    @@words.delete(self.word_id)

  end

  def self.clear
    @@words = {}
    @@total_words = 0
  end

  def ==(word_to_compare)
     self.name == word_to_compare.name()
   end

   def get_definitions
     
   end


end
