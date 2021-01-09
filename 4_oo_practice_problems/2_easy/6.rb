# If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# Which one of these is a class method (if any) and how do you know? How would you call a class method?

# Answer: The 'manufacturer' method is a class method, which we know because the method name is prepended with the reserved word 'self'. 

# We can call a class method by using the class name, then calling the method. In this example, 'Television.manufacturer'