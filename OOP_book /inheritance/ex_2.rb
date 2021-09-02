# Add a class variable to your superclass that can keep track of the number
# of objects created that inherit from the superclass.
# Create a method to  print out the value of this class variable as well.

class Vehicle
  attr_accessor :color
  attr_reader :year
  attr_reader :model

  @@number_of_objects = 0

  def initialize(year, model, color)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
    @@number_of_objects += 1
  end

  def number_of_objects
    @@number_of_objects
  end

  def spray_paint(new_color)
    self.color = new_color
    puts "You spray painted your car #{color}."
  end

  def speed_up(number)
    @current_speed += number
    puts "You sped up #{number} mph to #{@current_speed} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You slowed down #{number} mph to #{@current_speed} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0
    puts "You turned the car off."
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
  def to_s
   "My car is a #{color}, #{year}, #{@model}!"
  end
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
  def to_s
   "My truck is a #{color}, #{year}, #{@model}!"
  end
end

my_car = MyCar.new('2010', 'Ford Focus', 'silver')
my_truck = MyTruck.new('2010', 'Ford Tundra', 'white')
puts my_car.number_of_objects
my_car1 = MyCar.new('2010', 'Ford Focus', 'silver')
my_truck2 = MyTruck.new('2010', 'Ford Tundra', 'white')
puts my_car.number_of_objects
