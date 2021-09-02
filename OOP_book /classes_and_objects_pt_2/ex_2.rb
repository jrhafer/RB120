class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @current_speed = 0
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

  def to_s
   "My car is a #{color}, #{year}, #{@model}!"
 end
end

my_car = MyCar.new('2006', 'silver', 'Subaru Impreza')
puts my_car.to_s
