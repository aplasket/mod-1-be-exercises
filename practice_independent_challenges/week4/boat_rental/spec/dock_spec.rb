require "spec_helper"

RSpec.describe Dock do
  before(:each) do
    @dock = Dock.new("The Rowing Dock", 3)
    @kayak_1 = Boat.new(:kayak, 20)
    @kayak_2 = Boat.new(:kayak, 20) 
    @sup_1 = Boat.new(:standup_paddle_board, 15)
    @patrick = Renter.new("Patrick Star", "4242424242424242")
    @eugene = Renter.new("Eugene Crabs", "1313131313131313")
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@dock).to be_a(Dock)
      expect(@dock.name).to eq("The Rowing Dock")
      expect(@dock.max_rental_time).to eq(3)
      expect(@kayak_1).to be_a(Boat)
      expect(@patrick).to be_a(Renter)
    end
  end

  describe "#rent" do
    it "can return an array of rented boats to renters" do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)

      expect(@dock.rental_log).to be_a(Hash)
      expect(@dock.rental_log).to eq({@kayak_1 => @patrick,
                                      @kayak_2 => @patrick,
                                      @sup_1 => @eugene})
    end
  end
end