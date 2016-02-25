class SessionsController < ApplicationController

  def new

  end

  def create  
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # if user.activated?
        log_in user
        LogTime.create(user_id: user.id, log_time: Time.now, log_type: "login", log_message: "success") unless user.admin?
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user        
      # else
      #   message  = "Account not activated. "
      #   message += "Check your email for the activation link."
      #   flash[:warning] = message
      #   redirect_to root_url
      # end
    else
      LogTime.create(user_id: user.id, log_time: Time.now, log_type: "login", log_message: "fail") unless user.nil?
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'      
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def createfb
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroyfb
    session[:user_id] = nil
    redirect_to root_url
  end
end