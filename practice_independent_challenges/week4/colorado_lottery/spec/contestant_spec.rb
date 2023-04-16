require "spec_helper"

RSpec.describe Contestant do
  before(:each) do
    @alexander = Contestant.new({first_name: 'Alexander',
                                last_name: 'Aigiades',
                                age: 28,
                                state_of_residence: 'CO',
                                spending_money: 10})
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@alexander).to be_a(Contestant)
      expect(@alexander.full_name).to eq("Alexander Aigiades")
      expect(@alexander.age).to eq(28)
      expect(@alexander.state_of_residence).to eq("CO")
      expect(@alexander.spending_money).to eq(10)
    end
    
    it "checks if contestant is out of state" do
      expect(@alexander.out_of_state?).to eq(false)
    end

    it "starts with an empty array of game interests" do
      expect(@alexander.game_interests).to eq([])
      expect(@alexander.game_interests).to be_an(Array)
    end
  end

  describe "#add game interests" do
    it "can add game interests to array" do
      @alexander.add_game_interest('Mega Millions')
      @alexander.add_game_interest('Pick 4')
      
      expect(@alexander.game_interests).to eq(["Mega Millions", "Pick 4"])
    end
  end
end