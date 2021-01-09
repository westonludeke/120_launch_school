# If I have the following class:
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# What would happen if I called the methods like shown below?

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model

# We cannot call 'tv.manufacturer' because 'manufacturer' is a Class Method.
# However, calling 'tv.model' will work

# We can call 'Television.manufacturer' because this is how one calls a Class Method
# 'Television.model' however will not work