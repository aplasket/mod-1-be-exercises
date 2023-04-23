class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    cost_activities = 0
    @activities.each do |activity|
      cost_activities += activity.total_cost
    end
    cost_activities
  end

  def total_owed
    # Each Reunion can tell us each participant's name and what they owe 
    # for the whole reunion. This should be the combination of what 
    # they owe from all activities. Again, a negative value means they are 
    # owed money. For example, if "Maria" owes 10 from brunch and is 
    # owed 20 from drinks, her final amount owed in the breakout is -10.

    #pesudocode: 
    # calculate the @activity.owed for each activity and participant 
    # if total[person] exists, += amount owed of the next activity
    # if total[person] does not exist, total[person] = amount owed

    total = {}
    @activities.each do |activity|
      activity.participants.each do |participant, amount|
        if total.keys.include?(participant)
          total[participant] += activity.split - amount
        else
          total[participant] = activity.split - amount
        end
      end
    end
    total
  end

  def summary
    #Each Reunion can print a summary of each participant's name 
    #and what they owe, separated by a line break.

  end
end