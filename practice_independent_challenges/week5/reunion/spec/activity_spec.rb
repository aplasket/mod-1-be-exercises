require "spec_helper"

RSpec.describe Activity do
  before(:each) do
    @activity = Activity.new("Brunch")
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@activity).to be_an(Activity)
      expect(@activity.name).to eq("Brunch")
    end

    it "starts with no particpants in its hash" do
      expect(@activity.participants).to be_a(Hash)
      expect(@activity.participants).to eq({})
    end
  end

  describe "#add participants" do
    it "can add participants to the participants hash" do
      @activity.add_participant("Maria", 20)
      expect(@activity.participants).to eq({"Maria" => 20})
    end
  end

  describe "#total costs" do
    it "calculates the total cost of the activity" do
      @activity.add_participant("Maria", 20)
      expect(@activity.total_cost).to eq(20)

      @activity.add_participant("Luther", 40)
      expect(@activity.participants).to eq({"Maria" => 20, "Luther" => 40})
      expect(@activity.total_cost).to eq(60)
    end
  end

  describe "#split" do
    it "splits the total cost between participants" do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)

      expect(@activity.total_cost).to eq(60)
      expect(@activity.split).to eq(30)
    end
  end

  describe "#owed" do
    it "calculates amount the participant owes or is owed" do
      @activity.add_participant("Maria", 20)
      @activity.add_participant("Luther", 40)
      expect(@activity.owed).to eq({"Maria" => 10, "Luther" => -10})
    end
  end
end