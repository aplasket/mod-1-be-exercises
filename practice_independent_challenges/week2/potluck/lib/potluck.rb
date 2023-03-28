class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    dishes << dish
    dish
  end

  def get_all_from_category(category)
    dishes.select do |dish|
      dish.category == category
    end
  end

  def sort_dishes
    @dishes.sort_by do |dish|
      dish.name
    end
  end

  def menu
    menu = {}
    sort_dishes.map do |dish|
      
    end

  end
end