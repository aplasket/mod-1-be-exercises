class Street
  attr_reader :name, :buildings

  def initialize(name)
    @name = name
    @buildings = []
  end

  def add_building(building)
    @buildings << building.building_name
    alphabetize_buildings
  end

  def alphabetize_buildings
    @buildings.map do |building|
      building
    end.sort
  end
end