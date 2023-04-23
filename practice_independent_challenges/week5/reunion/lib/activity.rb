class Activity 
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(person_name, amount)
    @participants[person_name] = amount
  end

  def total_cost
    total = 0
    @participants.each_pair do |person_name, amount|
      total += amount
    end
    total
  end
end