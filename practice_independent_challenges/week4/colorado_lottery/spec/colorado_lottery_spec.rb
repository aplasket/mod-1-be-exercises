require "spec_helper"

RSpec.describe ColoradoLottery do
  before(:each) do
    @lottery = ColoradoLottery.new
  end

  describe "#initialize" do
    it "exists" do
      expect(@lottery).to be_a(ColoradoLottery)
    end

    it "starts with no registered contestants" do
      expect(@lottery.registered_contestants).to eq({})
      expect(@lottery.registered_contestants).to be_a(Hash)
    end

    it "starts with no winners" do
      expect(@lottery.winners).to eq([])
      expect(@lottery.winners).to be_an(Array)
    end

    it "starts with no current contestants" do
      expect(@lottery.current_contestants).to eq({})
      expect(@lottery.current_contestants).to be_a(Hash)
    end
  end
end