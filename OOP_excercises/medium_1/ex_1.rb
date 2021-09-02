# Modify this class so both flip_switch and the setter method
# switch= are private methods.

class Machine
  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  private

  attr_writer :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

# further exploration:
# Add a private getter for @switch to the Machine class, and
# add a method to Machine that shows how to use that getter.

class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def display_switch_status
    switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new

machine.stop

puts machine.display_switch_status
