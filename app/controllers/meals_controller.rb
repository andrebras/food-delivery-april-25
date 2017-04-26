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
    # have view ask for name
    name = @meal_view.ask_for(:name)

    # have view ask for price
    price = @meal_view.ask_for(:price)

    # create a new meal instance
    meal = Meal.new(name: name, price: price)

    # add meal to the repo
    @meal_repo.add(meal)
  end
end
