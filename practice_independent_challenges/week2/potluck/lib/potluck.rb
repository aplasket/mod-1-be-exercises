class Potluck
  attr_reader :date, :dishes

  def initialize(date)
    @date = date
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def get_all_from_category(category)
    @dishes.select do |dish|
      dish.category == category
    end
  end

 def menu
  apps_arr = get_all_from_category(:appetizer).map {|dish| dish.name}.sort

  entres_arr = get_all_from_category(:entre).map {|dish| dish.name}.sort
  
  desserts_arr = get_all_from_category(:dessert).map {|dish| dish.name}.sort
  {
    appetizers: apps_arr,
    entres: entres_arr,
    desserts: desserts_arr
  }
 end

 def ratio(category)
  (get_all_from_category(category).count / @dishes.count.to_f)*100
 end
end