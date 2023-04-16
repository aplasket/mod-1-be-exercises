class Artist
  attr_reader :id,
              :name,
              :born,
              :died,
              :country

  def initialize(attribute_info)
    @id = attribute_info[:id]
    @name = attribute_info[:name]
    @born = attribute_info[:born]
    @died = attribute_info[:died]
    @country = attribute_info[:country]
  end

  def age_at_death
    @died.to_i - @born.to_i
  end
end