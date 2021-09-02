# When objects are created they are a separate realization of a particular class.
#
# Given the class below, how do we create two different instances of this class
# with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

hotburger = AngryCat.new(4, "HotBurger")
peanut = AngryCat.new(1, "Peanut")

hotburger.name
hotburger.age

peanut.name
peanut.age
