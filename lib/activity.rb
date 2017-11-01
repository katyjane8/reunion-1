class Activity
  attr_reader :name

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_participant(participant)
    @activities << participant
  end

  def evaluate_cost
    monies = 0
    @activities.each do |activity|
      value = activity.values.last
        monies += value
    end
    monies
  end


end
