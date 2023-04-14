require "spec_helper"

RSpec.describe ColoradoLottery do
  before(:each) do
    @lottery = ColoradoLottery.new
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)
    @alexander = Contestant.new({ first_name: 'Alexander',
                                  last_name: 'Aigades',
                                  age: 28,
                                  state_of_residence: 'CO',
                                  spending_money: 10})
    @benjamin = Contestant.new({  first_name: 'Benjamin',
                                  last_name: 'Franklin',
                                  age: 17,
                                  state_of_residence: 'PA',
                                  spending_money: 100})
    @frederick = Contestant.new({ first_name:  'Frederick',
                                  last_name: 'Douglass',
                                  age: 55,
                                  state_of_residence: 'NY',
                                  spending_money: 20})
    @winston = Contestant.new({   first_name: 'Winston',
                                  last_name: 'Churchill',
                                  age: 18,
                                  state_of_residence: 'CO',
                                  spending_money: 5})
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

  before(:each) do
    @alexander.add_game_interest('Pick 4')
    @alexander.add_game_interest('Mega Millions')
    @frederick.add_game_interest('Mega Millions')
    @winston.add_game_interest('Cash 5')
    @winston.add_game_interest('Mega Millions')
    @benjamin.add_game_interest('Mega Millions')
  end

  describe "#interested and 18" do
    it "can return boolean of candidate is interested and 18" do
      expect(@lottery.interested_and_18?(@alexander, @pick_4)).to be(true)
      expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to be(false)
    end
  end

  describe "#can register" do
    it "can return a boolean if candidate can register" do
      expect(@lottery.can_register?(@alexander, @pick_4)).to be(true)
      expect(@lottery.can_register?(@alexander, @cash_5)).to be(false)
      expect(@lottery.can_register?(@frederick, @mega_millions)).to be(true)
      expect(@lottery.can_register?(@frederick, @cash_5)).to be(false)
      expect(@lottery.can_register?(@benjamin, @mega_millions)).to be(false)
    end
  end

  describe "#register contestant" do
    it "can register qualified contestants" do
      expect(@lottery.register_contestant(@alexander, @pick_4)).to eq(@alexander)
      expect(@lottery.register_contestant(@frederick, @mega_millions)).to eq(@frederick)
      expect(@lottery.register_contestant(@winston, @pick_4)).to be(nil)
    end
  end

  before(:each) do
    @lottery.register_contestant(@alexander, @pick_4)
    @lottery.register_contestant(@alexander, @mega_millions)
    @lottery.register_contestant(@frederick, @mega_millions)
    @lottery.register_contestant(@winston, @cash_5)
  end

  describe "#eligible contestants" do
    xit "starts with an empty array of eligible contestants" do
      expect(@lottery.eligible_contestants).to eq([])
      expect(@lottery.eligible_contestants).to be_an(Array)
    end

    xit "adds eligible contestants to the array" do
      expect(@lottery.eligible_contestants).to eq()
    end
  end

end