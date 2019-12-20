class Dictionary

  attr_reader :definition_id
  attr_accessor :name, :word_id

  @@definitions = {}
  @@total_definitions = 0

  def initalize(definition, word_id, id)

    @definition = definition
    @word_id = word_id
    @id = id || @@total_definitions += 1

  end



  def self.all
    @@definitions.values().sort_by { | val| val.name}
  end

  def save_definition

    @@words[self.definition_id] = Dictionary.new(self.definition,self.word_id, self.id)

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

end
