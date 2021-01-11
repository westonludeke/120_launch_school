# If we have these two methods:

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

# Answer: With the first 'Computer' class, there's a 'template' instance variable inside the 'create_template' method, and a local variable 'template' inside 'show_template'. The local variable cannot access the string assigned to the instance variable.

# With the second computer class, the two 'template' methods are called with 'self', which are referencing the calling object.

###  This is wrong, see the solution
