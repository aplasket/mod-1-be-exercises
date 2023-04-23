require "spec_helper"

RSpec.describe Reunion do
  before(:each) do
    @reunion = Reunion.new("1406 BE")
    @activity_1 = Activity.new("Brunch")
    @activity_2 = Activity.new("Drinks")
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@reunion).to be_a(Reunion)
      expect(@reunion.name).to eq("1406 BE")
      expect(@activity_1).to be_an(Activity)
    end

    it "starts with an empty array of activities" do
      expect(@reunion.activities).to eq([])
    end
  end

  describe "#add activities" do
    it "adds activities" do
      @reunion.add_activity(@activity_1)
      expect(@reunion.activities).to eq([@activity_1])

      @reunion.add_activity(@activity_2)
      expect(@reunion.activities).to eq([@activity_1, @activity_2])
    end
  end

  describe "#total cost" do
    before(:each) do
      @reunion.add_activity(@activity_1)
      @reunion.add_activity(@activity_2)
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @activity_2.add_participant("Maria", 60)
      @activity_2.add_participant("Luther", 60)
      @activity_2.add_participant("Louis", 0)
    end

    it "calculates the total cost of the reunion" do
      expect(@reunion.total_cost).to eq(180)
    end
  end
end