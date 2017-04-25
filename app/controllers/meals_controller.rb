class MealsController
  def initialize(meal_repo)
    @meal_repo = meal_repo
    @meal_view = MealsView.new
  end

  def list
    # get the meals array from repo
    meals = @meal_repo.all

    # give it to the view to display
    @meal_view.display_items(meals)
  end

  def create
    # have view ask for name and price
    meal_attributes = @meal_view.ask_for_meal_attributes

    # create a new meal instance
    meal = Meal.new(meal_attributes)

    # add meal to the repo
    @meal_repo.add(meal)
  end
end