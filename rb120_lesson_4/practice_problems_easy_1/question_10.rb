# If we have the class below, what would you need to call to create a new
# instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# we need to call .new on the class bag and pass in two arguments that will
# become the value of the two instance variables
