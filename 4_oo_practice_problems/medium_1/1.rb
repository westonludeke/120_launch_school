# Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

my_Bank = BankAccount.new(400)
p my_Bank.positive_balance?
# Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put the @ before balance when you refer to the balance instance variable in the body of the positive_balance? method."

# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

# Who is right, Ben or Alyssa, and why?

# Answer: Ben is right, but I'm not sure why. Though, it looks like it works both with and without the '@'

# Correct Answer: Ben is right because he added an 'attr_reader' for the balance instance variable.