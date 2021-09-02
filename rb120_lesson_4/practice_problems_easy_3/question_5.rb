# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer # => method error (no instance method exists)
tv.model # => ouput from model

Television.manufacturer # => output from class method
Television.model # => method error (not a class method)
