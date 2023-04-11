require './employee'

class Intern < Employee
  attr_reader :base_salary
  
  def initialize(base_salary, name, id)
    @base_salary = base_salary
    @bonus = 0
    super(name, id)
  end

  def get_coffee
    "Who got the latte?"
  end

  def benefits
    super.push(:gets_to_get_me_coffee)
  end

end