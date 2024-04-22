require_relative "../views/customers_view"

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
end