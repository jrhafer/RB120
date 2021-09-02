class Pet
  attr_reader :type, :name

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name, :pets # creates a instance getter method and instance variable for both name and pets

  def initialize(name) # for each Owner instance there are two instance variables:
    @name = name       # @name(owner's name) and @pets(an empty array)
    @pets = []
  end

  def adopt(pet)
    @pets << (pet)  # pet is passed as an argument and appended to instance variable
  end               # @pets, which is an array

  def number_of_pets # instance method, that when called on an instance object,
    @pets.count      # returns the number of elements within the instance variable @pets
  end
end

class Shelter
  attr_reader :owners

  def initialize
    @owners = []
  end

  def print_adoptions

    owners = self.owners.uniq

    owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each do |pet|
        puts "a #{pet.type} named #{pet.name}"
      end
      puts "\n"
    end

  end

  def adopt(name, pet)
    name.adopt(pet)
    add_person(name)
  end

  def add_person(name)
    @owners << name
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
