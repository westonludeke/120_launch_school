# If we have this code:

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:
#hello = Hello.new
#p hello.hi
# Answer: We're printing the string "Hello"

# case 2:
#hello = Hello.new
#p hello.bye
# Answer: Get get an error message that 'bye' is an undefined message. This is because the 'bye' method cannot be accessed inside the 'Hello' class.

# case 3:
#hello = Hello.new
# p hello.greet
# Answer: nothing, wrong number of argukments because no argument was passed when we called the 'greet' method.

# case 4:
#hello = Hello.new
#p hello.greet("Goodbye")
# Answer: We're printing the string 'Goodbye'

# case 5: 
p Hello.hi
# undefined method 'hi' for the hello class
# error because we didn't create a new instance of the Hello object first.



