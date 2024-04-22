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
end