require 'test_helper'

class StepSignupTest < ActionDispatch::IntegrationTest
  
  def setup
    @template = templates(:template)  
  end

  test "invalid signup step" do 
    log_in_as(users(:hoan))
  	get new_step_path
  	assert_no_difference 'Step.count' do 
  		post steps_path, step: {template_id: "", hour: "", day: ""}
  	end
  	assert_template 'steps/new'
  end

  test "valid signup step" do 
    log_in_as(users(:hoan))
  	get new_step_path
  	assert_difference 'Step.count', 1 do 
  		post_via_redirect steps_path, step: {template_id: @template.id, hour: 3, day: 4}
  	end
  	assert_template 'steps/show'
  end
end
