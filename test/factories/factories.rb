
FactoryGirl.define do 
	factory :step do 
		template_id 2
		hour 1
		day 2
	end

	factory :user do 
		name 'hoandq'
		email 'hoandq@gmail.com'
		password '123456'
		password_confirmation '123456'
		admin true
	end

	factory :template do 
		user_id 2
		subject 'template1'
		body 'body of template'
	end
end




