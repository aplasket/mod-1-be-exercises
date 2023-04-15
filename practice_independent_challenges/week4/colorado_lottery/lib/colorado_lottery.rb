class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(name, game)
    return false unless name.game_interests.include?(game.name) && name.age >= 18
    true
  end

  def can_register?(name, game)
    return false unless interested_and_18?(name, game) &&
                        (!name.out_of_state? || game.national_drawing?)
    true
  end

  def register_contestant(name, game)
    if can_register?(name, game) && @registered_contestants.has_key?(game.name)
      @registered_contestants[game.name] << name
    elsif
      can_register?(name, game) && !@registered_contestants.has_key?(game.name)
      @registered_contestants[game.name] = [name]
      name
    else
      nil
    end
  end

  def eligible_contestants(game)
    if @registered_contestants[game.name].nil?
      eligible_contestants = []
    else
      eligible_contestants = @registered_contestants[game.name].select do |contestant|
        contestant.spending_money > game.cost
      end
    end
  end

  def charge_contestants(game)
    #current contestants - returns a hash
    # game_object: [eligible_contestants]
    eligible_contestants(game).map do |contestant|
      require 'pry'; binding.pry
      contestant.spending_money -= game.cost
    end
  end
end