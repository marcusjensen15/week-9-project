class Dictionary

  #everything passes except update, moving :definition to accessor to see if it passes
  attr_reader  :id
  attr_accessor :name, :word_id, :definition

  @@definitions = {}
  @@total_definitions = 0

  def initialize(definition, word_id, id)

    @definition = definition
    @word_id = word_id
    @id = id || @@total_definitions += 1

  end



  def self.all
    @@definitions.values().sort_by { | val| val.name}
  end

  def save_definition

    @@definitions[self.id] = Dictionary.new(self.definition,self.word_id, self.id)

  end

  def update_definition(definition)
    @definition = definition
    @@definitions[self.id] = Dictionary.new(self.definition, self.word_id, self.id)


  end

  def delete_definition

    @@definitions.delete(self.id)

  end

  def self.clear
    @@definitions = {}
    @@total_definitions = 0
  end

  def ==(definition_to_compare)
     self.definition == definition_to_compare.definition()
   end

   def self.find(id)
     @@definitions[id]
   end

   #find by word is not tested

   def self.find_by_word(word_id)
     @@definitions.values.select{ |definition| definition.word_id == word_id }
   end

end
