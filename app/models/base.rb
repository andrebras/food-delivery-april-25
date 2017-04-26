class Base
  attr_accessor :id

  def initialize(attributes = {})
    @id = attributes[:id]
  end
end
