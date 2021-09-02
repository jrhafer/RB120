# What could we add to the class below to access the instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end

  def volume
    @volume
  end
end

# we could add a reader method:
# attr_reader :volume  or
# def volume
#   @reader
# end
# or
# call 'instance_varaible_get' on an instance of the object

big_cube = Cube.new(5000)
p big_cube.instance_variable_get("@volume")

p big_cube.volume
