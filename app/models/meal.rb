require_relative 'base'

class Meal < Base
  attr_reader :name, :price

  def initialize(attributes = {})
    super(attributes)
    @name = attributes[:name]
    @price = attributes[:price]
  end
end
