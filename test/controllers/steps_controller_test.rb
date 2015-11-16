require 'test_helper'

class StepsControllerTest < ActionController::TestCase
  
  def setup
  	@step = steps(:step)
  	@template = templates(:template)
  end

  test "should redirect create when not logged in " do 
  	assert_no_difference 'Step.count' do 
  		post :create, step: {template_id: @template.id, hour: 1, day: 3}
  	end
  	assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in " do 
  	assert_no_difference 'Step.count' do 
  		delete :destroy, id: @step
  	end
  	assert_redirected_to login_url
  end
end
