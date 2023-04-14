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
end