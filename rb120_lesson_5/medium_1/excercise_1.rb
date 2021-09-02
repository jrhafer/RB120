# class Machine
#
#   def start
#     self.flip_switch(:on)
#   end
#
#   def stop
#     self.flip_switch(:off)
#   end
#
#   private
#
#   attr_writer :switch
#
#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

# Add a private getter for @switch to the Machine class, and add a method
# to Machine that shows how to use that getter.

class Machine

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def switch_status
    if switch == :on
      puts "Switch is on."
    elsif switch == :off
      puts "Switch is off."
    end
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

machine = Machine.new
p machine.start
machine.switch_status
p machine.stop
machine.switch_status
