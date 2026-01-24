class Light
  attr_reader :status, :brightness

  def initialize
    @status = "off"
    @brightness = 5
  end

  def turn_on
    self.status = "on"
  end

  def turn_off
    self.status = "off"
  end

  def set_brightness(level)
    if level.between?(1,10)
      self.brightness = level
    else
      puts "Invalid brightness level. Please choose a value between 1 and 10."
    end
  end

  private

  attr_writer :status, :brightness
end

# Example of problematic usage:
p my_light = Light.new
p my_light.status
p my_light.turn_on
p my_light.turn_off
p my_light.set_brightness(100)
