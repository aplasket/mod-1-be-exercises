class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
    @eligible_contestants = []
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
      name
    elsif
      can_register?(name, game) && !@registered_contestants.has_key?(game.name)
      @registered_contestants[game.name] = [name]
    else
      nil
    end
  end

  # def determine_eligible_contestants
    # require 'pry'; binding.pry
    # @eligible_contestants << 
    #all contestants that are registered &&
    # have more spending money than the cost of game
    #returns an array of contestant objects
  # end

  # def current_contestants
    #returns a hash
    # game_object: [eligible_contestants]
  # end
end