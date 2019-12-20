require('rspec')
require('dictionary')
require('word')

describe '#Word' do

  before(:each) do
    Word.clear()
    Dictionary.clear()
    @word = Word.new("Puppy", nil)
    @word.save_word()
  end

  describe("#clear") do
    it('testing Dictionary clear functionality')do
      definition = Dictionary.new("A small dog",@word.word_id, nil)
      definition.save_definition
      Dictionary.clear()
      expect(Dictionary.all).to(eq([]))
    end
  end

  describe ('.all') do
    it("definitions contains all entries") do
      definition = Dictionary.new("Hello",@word.word_id,nil)
      definition.save_definition()
      definition2 = Dictionary.new("Puppy",@word.word_id,nil)
      definition2.save_definition()
      expect(Dictionary.all).to(eq([definition, definition2]))
    end
  end
  #
  # describe ('.update_word') do
  #   it("allows the user to chenge the name of the word") do
  #     word = Word.new("Hello",nil)
  #     word.save_word()
  #     word.update_word("Speaker")
  #     expect(word.name).to(eq("Speaker"))
  #   end
  # end
  #
  # describe ('.delete_word') do
  #   it("allows the user to delete a word from the database") do
  #     word = Word.new("Hello",nil)
  #     word.save_word()
  #     word2 = Word.new("Bacon",nil)
  #     word2.save_word()
  #     word.delete_word
  #     expect(Word.all).to(eq([word2]))
  #   end
  # end

end
