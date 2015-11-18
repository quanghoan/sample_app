require 'test_helper'

class TemplatesControllerTest < ActionController::TestCase
   
   def setup
    @user = FactoryGirl.create(:user)
   	@template = FactoryGirl.create(:template, user_id: @user.id, subject: "adf", body: "adfasdf")
   end

   test "should redirect create when not logged in" do 
   	assert_no_difference 'Template.count' do 
   		post :create, templates: {suject: "daohoan", body: "daoquanghoan"}
   	end
   	assert_redirected_to login_url
   end

   test "should redirect destroy when not logged in" do 
   	assert_no_difference 'Template.count' do 
   		delete :destroy, id: @template
   	end
   	assert_redirected_to login_url
   end

   test "delete template" do 
    log_in_as(@user)
    assert_difference 'Template.count', -1 do 
      delete :destroy, id: @template
    end
    assert_redirected_to templates_path
  end
end
