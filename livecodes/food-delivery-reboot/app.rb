require_relative "router"
require_relative "app/controllers/meals_controller"
require_relative "app/repositories/meal_repository"

meals_csv = "data/meals.csv"
meal_repository = MealRepository.new(meals_csv)

meals_controller = MealsController.new(meal_repository)
router = Router.new(meals_controller)

router.run