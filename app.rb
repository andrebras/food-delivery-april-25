require 'csv'

require_relative 'app/models/meal'
require_relative 'app/views/meals_view'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/base_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'router'

meal_csv = 'data/meals.csv'
meal_repository = MealRepository.new(meal_csv)
meals_controller = MealsController.new(meal_repository)
router = Router.new(meals_controller)

router.run