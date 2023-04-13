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
    end
  end
end