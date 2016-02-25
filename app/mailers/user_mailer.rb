class UserMailer < ActionMailer::Base

default from: "hoandq@kaopiz.com"

  def account_activation(user)
    @user = user
    message = "Account activation"    
    delivery_options = { address: "gator3103.hostgator.com", port: 587, user_name: "dqhoan2@gmail.com", password: "daoquanghoan", authentication: "plain" }
    mail subject: message, to: [ " ", user.nil? ? nil : user.email ], delivery_method_options: delivery_options  
  end

  def sendmail(user)
    @user = user
    message = "send mail"
    delivery_options = { address: "gator3103.hostgator.com", port: 587, user_name: "dqhoan2@gmail.com", password: "daoquanghoan", authentication: "plain" }
    mail subject: message, to: "quanghoan1992@gmail.com" , delivery_method_options: delivery_options  
  end
 
  def password_reset(user)
    @user = user 
    message = "reset password"    
    delivery_options = { address: "gator3103.hostgator.com", port: 587, user_name: "dqhoan2@gmail.com", password: "daoquanghoan", authentication: "plain" }
    mail subject: message, to: [ " ", user.nil? ? nil : user.email ], delivery_method_options: delivery_options  
  end

  def daily_mail(user, template)  
    @user = user  
    @template = template 
    message = template.subject     
    delivery_options = { address: "gator3103.hostgator.com", port: 587, user_name: "dqhoan2@gmail.com", password: "daoquanghoan", authentication: "plain" }
    mail subject: message, to: [ " ", user.nil? ? nil : user.email ], delivery_method_options: delivery_options  
  end
end