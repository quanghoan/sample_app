require 'test_helper'

class TemplateTest < ActiveSupport::TestCase
  def setup
  	@user = users(:hoan)
  	@template = @user.templates.build(subject: "test template", body: "body of subject", user_id: @user.id)
  end

  test "should be valid" do
  	assert @template.valid? 
  end

  test "user id should be present" do 
    @template.user_id = nil
    assert_not @template.valid?
  end

  test "subject should be present" do
  	@template.subject = ""
  	assert_not @template.valid?
  end

  test "subject should be unique" do 
  	duplicate_template = @template.dup
  	@template.save
  	assert_not duplicate_template.valid?
  end

  test "subject should be at most 50 characters" do
  	@template.subject = "a" * 55
    assert_not @template.valid?
  end

  test "body should be present" do 
  	@template.body = "  "
  	assert_not @template.valid?
  end
end
