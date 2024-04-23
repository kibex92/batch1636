require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    # Go to the meal repository -> #all
    customers = @customer_repository.all
    # Send the customers to the view -> #display
    @view.display(customers)
  end

  def add
    name = @view.ask_user_for("name")
    address = @view.ask_user_for("address")
    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
  end
end