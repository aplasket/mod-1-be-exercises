require "spec_helper"

RSpec.describe ColoradoLottery do
  before(:each) do
    @lottery = ColoradoLottery.new
  end

  describe "#initialize" do
    it "exists and has attributes" do
      expect(@lottery).to be_a(ColoradoLottery)
      expect(@lottery.registered_contestants).to be_a(Hash)
      expect(@lottery.winners).to be_an(Array)
      expect(@lottery.current_contestants).to be_a(Hash)
    end
    
    it "starts with no registered contestants" do
      expect(@lottery.registered_contestants).to eq({})
    end
    
    it "starts with no winners" do
      expect(@lottery.winners).to eq([])
    end

    it "starts with no current contestants" do
      expect(@lottery.current_contestants).to eq({})
    end
  end

  before(:each) do
    @pick_4 = Game.new('Pick 4', 2)
    @mega_millions = Game.new('Mega Millions', 5, true)
    @cash_5 = Game.new('Cash 5', 1)
    @alexander = Contestant.new({
                                first_name: 'Alexander',
                                last_name: 'Aigades',
                                age: 28,
                                state_of_residence: 'CO',
                                spending_money: 10})
    @benjamin = Contestant.new({
                                first_name: 'Benjamin',
                                last_name: 'Franklin',
                                age: 17,
                                state_of_residence: 'PA',
                                spending_money: 100})
    @frederick = Contestant.new({
                                first_name:  'Frederick',
                                last_name: 'Douglass',
                                age: 55,
                                state_of_residence: 'NY',
                                spending_money: 20})
    @winston = Contestant.new({
                                first_name: 'Winston',
                                last_name: 'Churchill',
                                age: 18,
                                state_of_residence: 'CO',
                                spending_money: 5})                          
  end

  describe "has contestants and games" do
    it "has contestant objects" do
      expect(@winston).to be_a(Contestant)
    end

    it "has game objects" do
      expect(@cash_5).to be_a(Game)
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

  describe "interested and 18?" do
    it "checks if contestant is interested in game and 18" do
      expect(@lottery.interested_and_18?(@alexander, @pick_4)).to be(true)
      expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to be(false)
      expect(@lottery.interested_and_18?(@alexander, @cash_5)).to be(false)
    end
  end

  describe "can register?" do
    it "can register candidates if interested, 18+, and in CO or national drawing" do
      expect(@lottery.can_register?(@alexander, @pick_4)).to be(true)
      expect(@lottery.can_register?(@alexander, @cash_5)).to be(false)
      expect(@lottery.can_register?(@frederick, @mega_millions)).to be(true)
      expect(@lottery.can_register?(@frederick, @cash_5)).to be(false)
      expect(@lottery.can_register?(@benjamin, @mega_millions)).to be(false)
    end
  end

  describe "register contestants" do
    before(:each) do
      @lottery.can_register?(@alexander, @pick_4)
      @lottery.can_register?(@alexander, @cash_5)
      @lottery.can_register?(@frederick, @mega_millions)
      @lottery.can_register?(@frederick, @cash_5)
      @lottery.can_register?(@benjamin, @mega_millions)
    end
    
    it "returns a Contestant object after registering" do
      expect(@lottery.register_contestants).to be_a(Contestant)
    end
    
    xit "adds registered contestants to registered contestants array" do

    end
  end
end