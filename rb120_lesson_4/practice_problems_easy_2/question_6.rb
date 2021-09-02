# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would
# you call a class method?

# class methods start with self
# class methods are called by using the class name then the method:

Television.manufacturer
