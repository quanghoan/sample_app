require 'test_helper'

class StepsEditTest < ActionDispatch::IntegrationTest
  
  def setup
  	@step = steps(:step)
    @template = templates(:template)
  end

  test "unsuccessful edit" do 
    log_in_as(users(:hoan))
  	get edit_step_path(@step)
  	assert_template 'steps/edit'
  	patch step_path(@step), step: {template_id: "", hour: "", day: ""}
  	assert_template 'steps/edit'
  end

  test "successful edit " do 
    log_in_as(users(:hoan))
  	get edit_step_path(@step)
  	assert_template 'steps/edit'
  	patch step_path(@step), step: {template_id: @template.id, hour: 2, day: 3}
    assert_not flash.empty?
    assert_redirected_to @step
    @step.reload
    assert_equal @template.id, @step.template_id
    assert_equal 2, @step.hour
    assert_equal 3, @step.day
  end
end
