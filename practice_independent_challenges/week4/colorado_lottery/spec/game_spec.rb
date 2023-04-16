require "spec_helper"

RSpec.describe Game do
  before(:each) do
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@pick_4).to be_a(Game)
      expect(@mega_millions).to be_a(Game)
      expect(@mega_millions.name).to eq("Mega Millions")
      expect(@mega_millions.cost).to eq(5)
      expect(@mega_millions.national_drawing).to be(true)
      expect(@pick_4.national_drawing).to be(false)
    end

    it "checks if game is national drawing?" do
      expect(@mega_millions.national_drawing?).to be(true)
      expect(@pick_4.national_drawing?).to be(false)
    end
  end
end