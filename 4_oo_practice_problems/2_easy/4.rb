# What could you add to this class to simplify it and remove two methods from the class definition while still maintaining the same functionality?

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

my_beegas = BeesWax.new('sexy kind')
p my_beegas.describe_type 

# Answer: I believe simply adding the 'attr_reader' method, while removing the two 'type' instance methods, is sufficient.

# Correct: 'attr_accessor' instead of 'attr_reader'