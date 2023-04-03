require 'spec_helper'

RSpec.describe Street do
 describe '#initialize' do
    it 'initializes' do
      adlington = Street.new("Adlington Road")

      expect(adlington).to be_a(Street)
      expect(adlington.street_name).to eq("Adlington Road")
    end
  end

  describe '#add building' do
    it 'adds owned buildings to sorted buildings array' do
      adlington = Street.new("Adlington Road")
      zebra = Building.new("123", "Zebra Apartments")
      bldg = Building.new("623", "Savills Apartment Building")
      adlington.add_building(zebra)
      adlington.add_building(bldg)
      
      expect(adlington.buildings).to be_an(Array)
      expect(adlington.buildings).to eq(["Savills Apartment Building", "Zebra Apartments"])
    end
  end
end