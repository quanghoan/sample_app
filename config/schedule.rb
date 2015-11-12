set :environment, "development"
set :output, "~/abc.log"

# every 1.minute do
# 	command "echo 'abcdef'"
# 	runner "User.send_mail"
# end

every 1.minute do
	runner "User.user_step"
end

