class Venue
  attr_reader :name, :capacity, :patrons
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @patrons = []
  end

  def add_patron(name)
    @patrons << name
  end

  def yell_at_patrons
    @patrons.map {|name| name.upcase}
  end

  def over_capacity?
    if @patrons.count > 4
      true
    else
      false
    end
  end

  def kick_out
    until @patrons.count < 5
      @patrons.pop
    end
  end
end
