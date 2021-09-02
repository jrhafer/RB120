# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. What code would
# you need to write to test your theory?

# @@cats is a class variable that keeps track of how many instances of Cat are
# instantiated. This is done by changing the value of the variable to itself
# plus one everytime a new instances is instantiated in the initialize method

# test:

kitten = Cat.new('kitten')
kitty = Cat.new('black cat')

p Cat.cats_count
