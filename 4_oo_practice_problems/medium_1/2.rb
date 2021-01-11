# Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    @quantity = updated_count if updated_count >= 0
  end
end

towel = InvoiceEntry.new('towels', 3)
towel.update_quantity(4)
p towel.quantity
# Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?

# Answer: The 'quantity' variable in the 'update_quantity' method needs to be an instance variable. Otherwise it's a local variable that is local only to the 'update_quantity' method, and not to the entire 'InvoiceEntry' class.