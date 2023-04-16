class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    return false unless contestant.game_interests.include?(game.name) &&
                        contestant.age >= 18
    true
  end

  def can_register?(contestant, game)
    if interested_and_18?(contestant, game) &&
      (!contestant.out_of_state? || game.national_drawing?)
      @registered_contestants[contestant] = game
      true
    else
      false
    end
  end

  def register_contestants 
    #return a Contestant object
    # We will only register contestants that #can_register?

    @registered_contestants.each_key do |contestant| contestant
      require 'pry'; binding.pry

    end
  end

  # def eligible_contestants
    #return an array of Contestant objects
    #who have been registered to play a given game 
    # and that have more spending_money than the cost.
  # end

  # def current_contestants
    #return hash of contestant names who have been charged, organized by game.
    # {game: [contestant.full_name], game: [contestant.full_name]}
  # end
end