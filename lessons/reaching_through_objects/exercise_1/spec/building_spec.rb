
 require 'spec_helper'

RSpec.describe Building do
  describe '#initialize' do
    it 'initializes' do
      bldg = Building.new("623", "Savills Apartment Building")

      expect(bldg).to be_a(Building)
    end

    it 'has readable attributes' do
      bldg = Building.new("623", "Savills Apartment Building")

      expect(bldg.building_number).to eq("623")
      expect(bldg.building_name).to eq("Savills Apartment Building")
    end
  end

  before(:each) do
    @bldg = Building.new("623", "Savills Apartment Building")
    @apt_1 = Apartment.new
    @apt_2 = Apartment.new
    @apt_5 = Apartment.new
  end
  describe '# add apartments' do
    it 'can add up to 4 apartments' do
      @bldg.add_apartment(@apt_1)
      @bldg.add_apartment(@apt_2)
      @bldg.add_apartment(@apt_5)
      
      expect(@bldg.list_apartments).to be_an(Array)
      expect(@bldg.list_apartments).to eq([@apt_1, @apt_2, @apt_5])

    end
  end
end