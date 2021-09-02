class Person
  attr_writer :name # or attr_accessor
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
