# What is the default return value of to_s when invoked on an object? Where could
# you go to find out if you want to be sure?

class Car
end

car = Car.new

puts car

# the default value is the object's object id.

# to find it, got to object documentation in ruby docs then click to_s
