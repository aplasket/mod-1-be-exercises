class Building
  attr_accessor :building_name
  attr_reader   :building_number,
                :list_apartments

  def initialize(building_number, building_name)
    @building_number = building_number
    @building_name = building_name
    @list_apartments = []
  end

  def add_apartment(apt)
    @list_apartments << apt 
  end
end