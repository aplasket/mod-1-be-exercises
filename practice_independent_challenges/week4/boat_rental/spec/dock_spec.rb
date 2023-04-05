require 'spec_helper'

RSpec.describe Dock do
  before(:each) do
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20) 
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")   
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  describe '#initialize' do
    it 'exists' do
      expect(@dock).to be_a(Dock)
      expect(@kayak_1).to be_a(Boat)
      expect(@patrick).to be_a(Renter)
    end

    it 'has attributes' do
      expect(@dock.name).to eq("The Rowing Dock")
      expect(@dock.max_rental_time).to eq(3)
      expect(@dock.rental_log)
    end
  end

  describe '#rent' do
    it 'rent boat by renter' do
      @dock.rent(@kayak_1, @patrick)    
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)   

      expect(@dock.rental_log).to be_a(Hash)
      expect(@dock.rental_log).to eq({@kayak_1 => @patrick, @kayak_2 => @patrick, @sup_1 => @eugene})
    end
  end

  describe '#charge' do
    it 'charges the renter for a boat' do
      @dock.rent(@kayak_1, @patrick) 
      @kayak_1.add_hour
      @kayak_1.add_hour
      @kayak_1.add_hour
      @kayak_1.add_hour
      
      expect(@dock.charge(@kayak_1)).to eq({:card_number => "4242424242424242", :amount => 60})
    end
  end

  describe '#return' do
    it 'returns a boat' do
      @dock.rent(@kayak_1, @patrick) 
      @kayak_1.add_hour
      @kayak_1.add_hour
      @dock.return(@kayak_1)
      expect(@dock.returned_boats).to eq({@kayak_1 => @patrick})
    end
  end
end