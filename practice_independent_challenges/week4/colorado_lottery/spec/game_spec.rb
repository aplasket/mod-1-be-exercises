require "spec_helper"

RSpec.describe Game do
  before(:each) do
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  describe "#initialize" do
    it "exists" do
      expect(@mega_millions).to be_a(Game)
    end

    it "has attributes" do
      expect(@mega_millions.name).to eq("Mega Millions")
      expect(@mega_millions.cost).to eq(5)
    end
  end
  
  describe "#national drawing?" do
    it "returns a boolean based on national_drawing attribute" do
      expect(@mega_millions.national_drawing?).to eq(true)
      expect(@pick_4.national_drawing?).to eq(false)
    end
  end
end