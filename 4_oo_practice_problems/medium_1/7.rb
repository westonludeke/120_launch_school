# How could you change the method name below so that the method name is more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.color_and_brightness
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end