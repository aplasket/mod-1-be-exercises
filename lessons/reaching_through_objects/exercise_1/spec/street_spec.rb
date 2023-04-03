require 'spec_helper'

RSpec.describe Street do
 describe '#initialize' do
    it 'initializes' do
      adlington = Street.new("Adlington Road")

      expect(adlington).to be_a(Street)
      expect(adlington.name).to eq("Adlington Road")
    end
  end

  describe '#add building' do
    it 'adds owned buildings to sorted buildings array' do
      adlington = Street.new("Adlington Road")
      zebra = Building.new("123", "Zebra Apartments")
      adlington.add_building(zebra)
      bldg = Building.new("623", "Savills Apartment Building")
      adlington.add_building(bldg)
      
      require 'pry'; binding.pry
      expect(adlington.buildings).to be_an(Array)
      expect(adlington.buildings.first).to be_a(Building)
      expect(adlington.buildings).to eq([bldg, zebra])
    end
  end
end