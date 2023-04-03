require 'spec_helper'

RSpec.describe Apartment do
  before(:each) do
    @apartment = Apartment.new
  end

  describe '#initialize' do
    it 'initializes' do
      expect(@apartment).to be_a(Apartment)
    end

    it 'has readable attributes' do
      expect(@apartment.rented).to eq(false)
    end

    it 'checks rented status' do
      expect(@apartment.is_rented?).to eq(false)
    end

    it 'receives rent and updates rented status' do
      @apartment.rent
      expect(@apartment.is_rented?).to eq(true)
    end
  end

  before(:each) do
    @bathroom = Room.new("bathroom")
    @apartment.add_room(@bathroom)
    @apartment.add_room(Room.new("laundry"))
    @apartment.add_room(Room.new("kitchen"))
    @apartment.add_room(Room.new("bedroom"))
  end

  describe '#adds room' do
    it 'can create rooms and adds to array' do
      expect(@bathroom).to be_a(Room)
      expect(@apartment.rooms).to be_an(Array)
      expect(@apartment.rooms.first).to be_a(Room)
    end

    it 'sorts rooms alphabetically' do
      expected_results = ["bathroom", "bedroom", "kitchen", "laundry"]
      expect(@apartment.list_rooms_by_name_alphabetically). to eq(expected_results)
    end
    
  end
end