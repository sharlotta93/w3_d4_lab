class Star

  attr_accessor :name
  attr_reader :id

  def initialize(person)
    @name = person['name']
    @id = person['id'] if person['id']
  end

end
