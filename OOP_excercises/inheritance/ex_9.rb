module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color # has instace variable and instance method displaying color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color

# Bird
# Flyable
# Animal
# Object
# Kernel
# BasicObject
