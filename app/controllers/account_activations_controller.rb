class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
      LogTime.create(user_id: user.id, log_time: Time.now, log_type: "login", log_message: "success") unless user.admin?
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end