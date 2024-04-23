require_relative "../views/orders_view"
require_relative "../views/customers_view"
require_relative "../views/employees_view"

class OrdersController
  def initialize(meal_repository,
                 customer_repository,
                employee_repository,
                order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @view = OrdersView.new
  end


  def add
    meal = get_meal
    customer = get_customer
    employee = get_employee
    order = Order.new(
      meal: meal,
      customer: customer,
      employee: employee
    )
    @order_repository.create(order)
  end

  private

  def get_meal
    # 1. Get all the meals from meal repository
    meals = @meal_repository.all
    # 2. Display all the meals -> MealsView
    MealsView.new.display(meals)
    # 3. Ask the user which meal 
    meal_index = @view.ask_user_for_index
    # 4. Add meal to the order
    return meals[meal_index]
  end

  def get_customer
    # 1. Get all the meals from meal repository
    customers = @customer_repository.all
    # 2. Display all the meals -> MealsView
    CustomersView.new.display(customers)
    # 3. Ask the user which meal 
    customer_index = @view.ask_user_for_index
    # 4. Add meal to the order
    return customers[customer_index]
  end

  def get_employee
    # 1. Get all the meals from meal repository
    employees = @employee_repository.all_riders
    # 2. Display all the meals -> MealsView
    EmployeesView.new.display(employees)
    # 3. Ask the user which meal 
    employee_index = @view.ask_user_for_index
    # 4. Add meal to the order
    return employees[employee_index]
  end
end