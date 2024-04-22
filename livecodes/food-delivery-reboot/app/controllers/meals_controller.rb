require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    # Go to the meal repository -> #all
    meals = @meal_repository.all
    # Send the meals to the view -> #display
    @view.display(meals)
  end

  def add
    # 1. Ask user for name
    name = @view.ask_user_for("name")
    # 2. Ask user for price
    price = @view.ask_user_for_price
    # 3. Create a meal object with the user data
    meal = Meal.new(name: name, price: price)
    # 4. Send the meal to the repository to be created in the CSV file
    @meal_repository.create(meal)
  end
end