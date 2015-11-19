# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :time_log do
    user nil
    time_log "2015-11-18 17:36:28"
    type_log false
    message false
  end
end
