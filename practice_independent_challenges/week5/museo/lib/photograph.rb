class Photograph
  attr_reader :id,
              :name,
              :artist_id,
              :year
              
  def initialize(attribute_info)
    @id = attribute_info[:id]
    @name = attribute_info[:name]
    @artist_id = attribute_info[:artist_id]
    @year = attribute_info[:year]
  end
end