require 'csv'

require_relative 'app/models/meal'
require_relative 'app/views/meals_view'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/base_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'router'

meal_csv = 'data/meals.csv'
meal_repository = MealRepository.new(meal_csv)
meals_controller = MealsController.new(meal_repository)

employees_csv = 'data/employees.csv'
employee_repository = EmployeeRepository.new(employees_csv)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, sessions_controller)
router.run
