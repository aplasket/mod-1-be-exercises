class Street
  attr_reader :street_name, :buildings_array

  def initialize(street_name)
    @street_name = street_name
    @buildings_array = []
  end

  def add_building(building)
    @buildings_array << building
  end
  
  def buildings
    @buildings_array.map {|building| building.building_name}.sort
  end
 
end