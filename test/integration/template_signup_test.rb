require 'test_helper'

class TemplateSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup template" do 
  	log_in_as(users(:hoan))
  	get new_template_path
  	assert_no_difference 'Template.count' do 
  		post templates_path, template: {subject: "", body: ""}
  	end
  	assert_template 'templates/new'	
  end

  test "valid signup template" do 
  	log_in_as(users(:hoan))
  	get new_template_path
  	assert_difference 'Template.count', 1 do 
  		post_via_redirect templates_path, template: {subject: "subject4", body: "body", user_id: 1}
  	end
  	assert_template 'steps/new'
  end
end
