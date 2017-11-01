require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_activity_exists
    activity = Activity.new("swimming")

    assert_instance_of Activity, activity
  end

  def test_activity_has_a_name
    activity = Activity.new("swimming")

    assert_equal "swimming", activity.name
  end

  def test_participant_can_be_added
    activity = Activity.new("swimming")
    result = activity.add_participant({:participant => "Roger", :amount_paid => 20})

    assert_equal [{:participant => "Roger", :amount_paid=>20}], result
  end

  def test_can_evaluate_cost
    activity = Activity.new("swimming")
    activity.add_participant({:participant => "Roger", :amount_paid => 20})
    cost = activity.evaluate_cost

    assert_equal 20, cost
  end

  def test_cost_can_be_split
    activity = Activity.new("bowling")
    activity.add_participant({:participant => "Roger", :amount_paid => 30})
    activity.add_participant({:participant => "Nadine", :amount_paid => 20})

    assert_equal 60, activity.split_cost
  end

end
