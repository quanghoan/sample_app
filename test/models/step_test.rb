require 'test_helper'

class StepTest < ActiveSupport::TestCase
  
  def setup
    @template = templates(:template)
  	@step = Step.new(hour: 1, day: 2, template_id: @template.id)
  end

  test "should be valid" do
  	assert @step.valid?
  end

  test "step id should be present" do 
  	@step.template_id = nil
  	assert_not @step.valid?
  end

  test "hour should be present" do 
    @step.hour = nil
  	assert_not @step.valid?
  end

  test "day should be present" do 
  	@step.day = nil
  	assert_not @step.valid?
  end

  test "hour should be integer" do 
  	@step.hour = 1.5
  	assert_not @step.valid?
  end

  test " hour should be an integer" do 
    @step.hour = 5
    assert @step.valid?
  end

  test "day should be integer" do 
  	@step.day = 2.5
  	assert_not @step.valid?
  end

  test "hour should be >= 0" do 
  	@step.hour = -2
    assert_not @step.valid?
  end

  test "hour should be < 13" do 
    @step.hour = 15
    assert_not @step.valid?
  end

  test "day should be >= 0" do 
    @step.day = 1
    assert @step.valid?
  end
    
  test " day should be < 8" do 
    @step.day = 8
    assert_not @step.valid?
  end
end
