=begin

Class based inheritance works great when it's used to model hierarchical domains. Let's take a look at a few practice problems. Suppose we're building a software system for a pet hotel business, so our classes deal with pets.

One problem is that we need to keep track of different breeds of dogs, since they have slightly different behaviors. For example, bulldogs can't swim, but all other dogs can.

Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

Create a new class called Cat, which can do everything a dog can, except swim or fetch. Assume the methods do the exact same thing. Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.

=end
class Pet
  def run
    "running!"
  end

  def jump
    "jumping!"
  end
end 

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    "fetching!"
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    "meow!"
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

p pete.run                # => "running!"
#p pete.speak              # => NoMethodError
p kitty.run               # => "running!"
p kitty.speak             # => "meow!"
# p kitty.fetch             # => NoMethodError
p dave.speak              # => "bark!"
p bud.run                 # => "running!"
p bud.swim                # => "can't swim!"

p Pet.ancestors
p Dog.ancestors
p Bulldog.ancestors
p Cat.ancestors

