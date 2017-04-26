require_relative 'base_view'

class MealsView < BaseView
  def display_items(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - $#{meal.price}"
    end
    print "\n"
  end
end
