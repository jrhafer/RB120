# If we have these two methods in the Computer class:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

# What is the difference in the way the code works?

# in the first Computer class, show_template calls the getter method from 
# the attr_accessor to display the value of @template when called
#
# in the second, the self that prepends template is unessesary.
