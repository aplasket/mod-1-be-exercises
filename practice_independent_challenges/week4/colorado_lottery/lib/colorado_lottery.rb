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
    return false unless interested_and_18?(contestant, game) &&
                    (!contestant.out_of_state? || game.national_drawing?)
    true
  end

  def register_contestant(contestant, game)
    return nil if !can_register?(contestant, game)
    if can_register?(contestant, game) && @registered_contestants.include?(game.name)
      @registered_contestants[game.name] << contestant
    else
      @registered_contestants[game.name] = [contestant]
    end
    
    contestant
  end

  def eligible_contestants(game)
    return [] if @registered_contestants.empty?
    
    @registered_contestants[game.name].find_all {|contestant| contestant.spending_money > game.cost}    
  end

  def charge_contestants(game)
    contestants = eligible_contestants(game)
    contestant_name = eligible_contestants(game).map {|contestant| contestant.full_name}
    @current_contestants[game] = contestant_name
  end
end