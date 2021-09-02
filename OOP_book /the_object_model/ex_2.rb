# A module allows us to group reusable code into one place.
# We use modules in our classes by using the include method invocation,
# followed by the module name. Modules are also used as a namespace.

# - a module extends functionality of a class

module Study
end

class MyClass
  include Study
end

my_object = MyClass.new

# - namespacing:

module Careers
  class Engineer
  end

  class Teacher
  end
end

first_job = Careers::Teacher.new
