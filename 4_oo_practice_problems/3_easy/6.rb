# If we have a class such as the one below:
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

tabs = Cat.new('tabby')
p tabs.make_one_year_older
# In the make_one_year_older method we have used self. What is another way we could write this method so we don't have to use the self prefix?

# Answer: We can change the 'self' prefix to include the prefix '@', since 'age' is an instance variable.

