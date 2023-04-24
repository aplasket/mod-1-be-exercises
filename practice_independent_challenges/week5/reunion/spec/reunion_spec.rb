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
    it "calculates the total cost of the reunion" do
      @reunion.add_activity(@activity_1)
      @reunion.add_activity(@activity_2)
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @activity_2.add_participant("Maria", 60)
      @activity_2.add_participant("Luther", 60)
      @activity_2.add_participant("Louis", 0)

      expect(@reunion.total_cost).to eq(180)
    end
  end

  describe "#total owed" do 
    it "calculates how much each person is owed or owes" do
      @reunion.add_activity(@activity_1)
      @reunion.add_activity(@activity_2)
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @activity_2.add_participant("Maria", 60)
      @activity_2.add_participant("Luther", 60)
      @activity_2.add_participant("Louis", 0)

      expect(@activity_1.split).to eq(30)
      expect(@activity_2.split).to eq(40)
      expect(@reunion.total_owed).to eq({"Maria" => -10, "Luther" => -30, "Louis" => 40})
    end
  end

  describe "#summary" do
    it "returns a summary of each participant and what they own/are owed" do
      @reunion.add_activity(@activity_1)
      @reunion.add_activity(@activity_2)
      @activity_1.add_participant("Maria", 20)
      @activity_1.add_participant("Luther", 40)
      @activity_2.add_participant("Maria", 60)
      @activity_2.add_participant("Luther", 60)
      @activity_2.add_participant("Louis", 0)

      expect(@reunion.summary).to eq("Maria: -10\n Luther: -30\n Louis: 40")
    end
  end
end