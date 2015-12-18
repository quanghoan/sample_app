# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authentication do
    user_id 1
    provider "MyString"
    uid "MyString"
    name "MyString"
    oauth_token "MyString"
    oauth_expires_at "2015-12-09 16:12:43"
  end
end
