class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def intialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end

undergrad = Undergraduate.new('Jeremy', 2023)

p undergrad
