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

  describe "#charge" do
    it "can charge renters for hours rented" do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)
      2.times { @kayak_1.add_hour }
      4.times { @kayak_2.add_hour }
      @sup_1.add_hour

      expect(@dock.charge(@kayak_1)).to eq({:card_number => "4242424242424242",
                                            :amount => 40})
      
      expect(@dock.charge(@kayak_2)).to eq({:card_number => "4242424242424242",
                                            :amount => 60})

      expect(@dock.charge(@sup_1)).to eq({:card_number => "1313131313131313",
                                            :amount => 15})
    end
  end

  describe "#return" do
    it "returns boats when finished renting" do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)
      2.times { @kayak_1.add_hour }
      4.times { @kayak_2.add_hour }
      @sup_1.add_hour
      
      expect(@dock.returned_boats).to eq({})

      @dock.return(@kayak_1)
      expect(@dock.returned_boats).to eq({@kayak_1 => @patrick})
      @dock.return(@kayak_2)
      expect(@dock.returned_boats).to eq({@kayak_1 => @patrick,
                                          @kayak_2 => @patrick})
    end
  end

  describe "#log hour" do
    it "adds additional hour to boats currently rented" do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)
      @kayak_1.add_hour 
      2.times{ @kayak_2.add_hour }

      expect(@kayak_1.hours_rented).to eq(1)
      expect(@kayak_2.hours_rented).to eq(2)

      @dock.log_hour

      expect(@kayak_1.hours_rented).to eq(2)
      expect(@kayak_2.hours_rented).to eq(3)
    end
  end

  describe "#revenue" do
    it "collects revenue for all returned boats" do
      @dock.rent(@kayak_1, @patrick)
      @dock.rent(@kayak_2, @patrick)
      @dock.rent(@sup_1, @eugene)
      @kayak_1.add_hour 
      @sup_1.add_hour
      2.times{ @kayak_2.add_hour }
      @dock.return(@kayak_1)

      expect(@dock.returned_boats).to eq({@kayak_1 => @patrick})
      expect(@dock.revenue).to eq(20)
      
      @dock.log_hour
      @dock.return(@kayak_2)
      @dock.return(@sup_1)

      expect(@dock.returned_boats).to eq({@kayak_1 => @patrick,
                                          @kayak_2 => @patrick,
                                          @sup_1 => @eugene})
      expect(@dock.revenue).to eq(110)
    end
  end
end