# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, 
                customers_controller,
                sessions_controller,
                orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    # 1. Display menu to the user
    while @running
      @employee = @sessions_controller.login
      while @employee
        display_menu
        # 2. Ask the user what they want to do
        action = gets.chomp.to_i
        print `clear`
        # 3. Dispatch the user action to the controller
        dispatch(action)
      end
    end
  end

  def display_manager_menu
    puts "----------Food Delivery-------"
    puts "\n------------------------------"
    puts "1 - List all meals"
    puts "2 - Add a new meal"
    puts "3 - List all customers"
    puts "4 - Add a new customer"
    puts "5 - Add a new order"
    puts "8 - Logout"
    puts "9 - Exit"
  end

  def display_rider_menu
    puts "----------Food Delivery-------"
    puts "\n------------------------------"
    puts "1 - List all undelivered orders"
    puts "2 - Mark an order as delivered"
    puts "8 - Logout"
    puts "9 - Exit"
  end

  def display_menu
    if @employee.manager?
      display_manager_menu
    else
      display_rider_menu
    end
  end


  def dispatch_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @orders_controller.add
    when 8 then logout
    when 9 then stop
    else
      puts "Oops. Wrong input, try again!"
    end
  end

  def dispatch_rider_action(action)
    puts "To do.."
  end

  def dispatch(action)
    if @employee.manager?
      dispatch_manager_action(action)
    else
      dispatch_rider_action(action)
    end
  end

  def stop
    @running = false
    logout
  end

  def logout
    @employee = nil
  end
end