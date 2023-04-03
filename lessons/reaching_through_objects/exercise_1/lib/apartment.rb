class Apartment
  attr_reader :rented

  def initialize
    @rented = false
  end

  def is_rented?
    @rented
  end

  def rent
    @rented = true
  end
end