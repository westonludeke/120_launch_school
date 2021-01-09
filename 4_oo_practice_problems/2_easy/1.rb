# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

# What is the result of executing the following code:

oracle = Oracle.new
p oracle.predict_the_future

# My guess before running: Nothing since there's no 'initialize' method...

# Running the code: Included "You will" concatenated with one of the 'choices' array elements



