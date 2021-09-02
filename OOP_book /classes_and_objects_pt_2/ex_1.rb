class MyCar
  def self.gas_milage(miles, gallons)
    puts "The car's gas milage is #{gallons/miles} miles to the gallon."
  end

end

MyCar.gas_milage(13, 351)
