class MealsView
  def display_items(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - $#{meal.price}"
    end
    print "\n"
  end

  def ask_for_meal_attributes
    print "Meal name: "
    name = gets.chomp

    print "Meal price: "
    price = gets.chomp

    { name: name, price: price }
  end
end