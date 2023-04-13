require "spec_helper"

RSpec.describe Contestant do
  before(:each) do
    @alexander = Contestant.new({ first_name: 'Alexander',
                                  last_name: 'Aigiades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10})
  end
  describe "#initialize" do
    it "exists" do
      expect(@alexander).to be_a(Contestant)
    end

    it "has attributes" do
      expect(@alexander.full_name).to eq("Alexander Aigiades")
      expect(@alexander.age).to eq(28)
      expect(@alexander.state_of_residence).to eq("CO")
      expect(@alexander.spending_money).to eq(10)
    end
    
  end
end