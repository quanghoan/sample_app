require 'test_helper'

class TemplatesControllerTest < ActionController::TestCase
   
   def setup
   	@template = templates(:template)
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

end
