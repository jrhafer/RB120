class Person
  def hi
    puts "Bob says hi"
  end

  private # moved to space below def hi
end

bob = Person.new
bob.hi
