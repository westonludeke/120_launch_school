# If we have a Car class and a Truck class and we want to be able to go_fast, how can we add the ability for them to go_fast using the module Speed? How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed 

  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed 

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

lexus = Car.new
lexus.go_slow
lexus.go_fast
tacoma = Truck.new
tacoma.go_very_slow
tacoma.go_fast
# Answer: We need to include the 'Speed' module into both the 'Car' and 'Truck' classes.

# We can check if they can 'go_fast' by calling the 'go_fast' method on the objects.