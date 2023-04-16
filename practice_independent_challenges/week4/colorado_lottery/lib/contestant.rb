class Contestant
  attr_reader :full_name,
              :age,
              :state_of_residence,
              :game_interests
  attr_accessor :spending_money

  def initialize(contestant_info)
    @full_name = "#{contestant_info[:first_name]} #{contestant_info[:last_name]}"
    @age = contestant_info[:age]
    @state_of_residence = contestant_info[:state_of_residence]
    @spending_money = contestant_info[:spending_money]
    @game_interests = []
  end

  def out_of_state?
    return true unless state_of_residence == "CO"
    false
  end

  def add_game_interest(game_name)
    @game_interests << game_name
  end
end