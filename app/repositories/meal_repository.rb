require_relative './base_repository'

class MealRepository < BaseRepository
  def build_row_header
    ['id', 'name', 'price']
  end

  def build_row(meal)
    [meal.id, meal.name, meal.price]
  end

  def build_instance(row)
    meal_attributes = {
      id: row[:id].to_i,
      name: row[:name],
      price: row[:price].to_i,
    }

    Meal.new(meal_attributes)
  end
end