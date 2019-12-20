require('rspec')
require('word')



describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe("#clear") do
    it('testing clear functionality')do
      word = Word.new("Hello",nil)
      word.save_word()
      Word.clear()
      expect(Word.all).to(eq([]))
    end
  end

  describe ('.all') do
    it("words database contains all entries") do
      word = Word.new("Hello",nil)
      word.save_word()
      word2 = Word.new("Puppy",nil)
      word2.save_word()
      expect(Word.all).to(eq([word, word2]))
    end
  end

  describe ('.update_word') do
    it("allows the user to chenge the name of the word") do
      word = Word.new("Hello",nil)
      word.save_word()
      word.update_word("Speaker")
      expect(word.name).to(eq("Speaker"))
    end
  end

  describe ('.delete_word') do
    it("allows the user to delete a word from the database") do
      word = Word.new("Hello",nil)
      word.save_word()
      word2 = Word.new("Bacon",nil)
      word2.save_word()
      word.delete_word
      expect(Word.all).to(eq([word2]))
    end
  end

  #find function is new

  describe ('.find') do
    it("will allow the user to find a word by searching word_id") do
      word = Word.new("Hello",nil)
      word.save_word()
      word2 = Word.new("Puppy",nil)
      word2.save_word()
      expect(Word.find(word.word_id).name).to(eq(word.name))
    end
  end

end
