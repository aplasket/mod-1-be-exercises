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
    it "if contestant can register, it returns a Contestant object after registering" do
      expect(@lottery.register_contestant(@alexander, @pick_4)).to eq(@alexander)
      expect(@lottery.register_contestant(@benjamin, @pick_4)).to eq(nil)
    end
    
    it "adds registered contestants to registered contestants array" do
      @lottery.register_contestant(@alexander, @pick_4)
      expect(@lottery.registered_contestants).to eq({"Pick 4" => [@alexander]})

      @lottery.register_contestant(@alexander, @mega_millions)
      expect(@lottery.registered_contestants).to eq({ "Pick 4" => [@alexander],
                                                      "Mega Millions" => [@alexander]})

      @lottery.register_contestant(@frederick, @mega_millions) 
      @lottery.register_contestant(@winston, @cash_5)
      @lottery.register_contestant(@winston, @mega_millions)
      expect(@lottery.registered_contestants).to eq({ "Pick 4" => [@alexander], 
                                                      "Mega Millions" => [@alexander, @frederick, @winston],
                                                      "Cash 5" => [@winston]})
    end
  end

  describe "#eligible contestants" do
    it "starts with an empty array" do 
      expect(@lottery.eligible_contestants(@pick_4)).to eq([])
    end

    it "returns an array of eligible registered contestant objects" do
      @lottery.register_contestant(@alexander, @mega_millions)
      @lottery.register_contestant(@frederick, @mega_millions) 
      @lottery.register_contestant(@winston, @cash_5)
      @lottery.register_contestant(@winston, @mega_millions)
      @lottery.register_contestant(@alexander, @pick_4)

      expect(@frederick.spending_money).to eq(20)
      expect(@alexander.spending_money).to eq(10)
      expect(@winston.spending_money).to eq(5)
      expect(@pick_4.cost).to eq(2)
      expect(@mega_millions.cost).to eq(5)
      expect(@cash_5.cost).to eq(1)
      expect(@lottery.eligible_contestants(@pick_4)).to eq([@alexander])
      expect(@lottery.eligible_contestants(@mega_millions)).to eq([@alexander, @frederick])
      expect(@lottery.eligible_contestants(@cash_5)).to eq([@winston])
    end
  end

  describe "#current contestants" do
    before(:each) do
      @lottery.register_contestant(@alexander, @mega_millions)
      @lottery.register_contestant(@alexander, @pick_4)
      @lottery.register_contestant(@frederick, @mega_millions) 
      @lottery.register_contestant(@winston, @cash_5)
      @lottery.register_contestant(@winston, @mega_millions)
    end
    
    it "returns a hash of charged contestants" do
      @lottery.charge_contestants(@pick_4)
      expect(@lottery.current_contestants).to eq({@pick_4 => ["Alexander Aigades"]})

      @lottery.charge_contestants(@mega_millions)
      @lottery.charge_contestants(@cash_5)
      expect(@lottery.current_contestants).to eq({@pick_4 => ["Alexander Aigades"],
                                                  @mega_millions => ["Alexander Aigades", "Frederick Douglass"],
                                                  @cash_5 => ["Winston Churchill"]})
    end
  end
end