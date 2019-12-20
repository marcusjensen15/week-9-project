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

  describe ('.update_definition') do
    it("allows the user to edit the definition") do
    definition = Dictionary.new("Hello",@word.word_id,nil)
    definition.save_definition()
    definition.update_definition("puppy")
      expect(definition.definition).to(eq("puppy"))
    end
  end

  describe ('.delete_definition') do
    it("allows the user to delete a definition from the database") do
      definition = Dictionary.new("Hello",@word.word_id,nil)
      definition.save_definition()
      definition2 = Dictionary.new("Puppy",@word.word_id,nil)
      definition2.save_definition()
      definition.delete_definition
      expect(Dictionary.all).to(eq([definition2]))
    end
  end

  describe ('.find') do
    it("will allow the user to find a definition by its id") do
      definition = Dictionary.new("Hello",@word.word_id,nil)
      definition.save_definition()
      definition2 = Dictionary.new("Puppy",@word.word_id,nil)
      definition2.save_definition()
      expect(Dictionary.find(definition.id).definition).to(eq(definition.definition))
    end
  end

end
