# TODO: implement the router of your app.
class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
    @running = true
  end

  def run
    # 1. Display menu to the user
    while @running
      display_menu
      # 2. Ask the user what they want to do
      action = gets.chomp.to_i
      # 3. Dispatch the user action to the controller
      dispatch(action)
    end
  end

  def display_menu
    puts "----------Food Delivery-------"
    puts "\n------------------------------"
    puts "1 - List all meals"
    puts "2 - Add a new meal"
    puts "9 - Exit"
  end

  def dispatch(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 9 then stop
    else
      puts "Oops. Wrong input, try again!"
    end
  end

  def stop
    @running = false
  end
end