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

  def split
    total_cost/@participants.count
  end

  def owed
    total_owed = {}
    
    @participants.each_pair do |person_name, amount|
      total_owed[person_name] = split - amount
    end
    total_owed
  end
end