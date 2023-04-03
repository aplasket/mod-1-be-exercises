class Apartment
  attr_reader :rented

  def initialize
    @rented = false
  end

  def is_rented?
    @rented
  end
end