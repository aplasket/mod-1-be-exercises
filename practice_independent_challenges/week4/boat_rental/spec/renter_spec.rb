require "spec_helper"

RSpec.describe Renter do
  before(:each) do
    @renter = Renter.new("Patrick Star", "4242424242424242")
  end

  describe "#initialized" do
    it "exists and has attributes" do
      expect(@renter).to be_a(Renter)
      expect(@renter.name).to eq("Patrick Star")
      expect(@renter.credit_card_number).to eq("4242424242424242")
    end
  end
end