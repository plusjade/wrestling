require 'test_helper'

class BoutTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "blank object validations" do
    bout = Bout.new
    assert bout.invalid?
    assert !bout.save
    assert bout.errors.invalid?(:red_id), "Require Red Id"
    assert bout.errors.invalid?(:green_id), "Require Green Id"
  end
  
  test "time set properly" do
    bout = Bout.new(:time_seconds => 63,
                    :time_minutes => 1)
    bout.save
    assert bout.time == 123, "Time gets set to total seconds: #{bout.time}"
    assert bout.time_minutes == 2, "Minutes gets properly calculated: #{bout.time_minutes}"
    assert bout.time_seconds == "03", "Seconds gets padded out to two spaces: #{bout.time_seconds}"
  end
  
  test "joins for bout model" do
    bout = Bout.find(1)
    
    assert bout.red_id == 1, "Tied to wrestler with id of 1: #{bout.red_id}"
    assert_equal "Mike Wheeler", bout.red_wrestler.first_last
    assert_equal "Home Team", bout.red_wrestler.team.first.team_name
  end
  
  test "create new wrestler from First/Last name" do
    bout = Bout.new(:red_first_name => "non-existent",
                    :red_last_name => "wrestler",
                    :red_team_name => "new team",
                    :green_first_name => "Mike",
                    :green_last_name => "Wheeler",
                    :green_team_name => "Home Team"
                    )
    assert bout.save, "Successful save"
    assert_equal "Mike Wheeler", bout.green_wrestler.first_last
    assert_equal 1, bout.green_wrestler.id
    assert_equal "non-existent wrestler", bout.red_wrestler.first_last
  end
  
end
