require 'test_helper'

class TemplatesEditTest < ActionDispatch::IntegrationTest
  
	def setup
		@template = templates(:template)
		@user = users(:hoan)
	end

	test "unsuccessful edit" do
		log_in_as(@user)
		get edit_template_path(@template)
		assert_template 'templates/edit'
		patch template_path(@template), template: {subject: "", body: ""}
		assert_template 'templates/edit'
	end

	test "successful edit" do 
		log_in_as(@user)
		get edit_template_path(@template)
		assert_template 'templates/edit'
		patch template_path(@template), template: {subject: "subject22", body: "body22"}
		# assert_not flash.empty?
		# assert_redirected_to @template
		@template.reload
		assert_equal "subject", @template.subject
		assert_equal "body", @template.body
	end
end
