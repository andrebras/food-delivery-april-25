require_relative 'base'

class Customer < Base
  attr_reader :name, :address

  def initialize(attributes = {})
    super(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
  end
end
