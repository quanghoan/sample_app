class NotificationsController < ApplicationController
  # before_action :logged_in_user
  def index
  	@notification1 = Notification.all
  	@notification2 = current_user.notifications
    @notifications = @notification1 - @notification2
  end   

  def destroy
  	Notification.find(params[:id]).destroy
  	flash[:success] = "destroyed a message ."
  	redirect_to notifications_url
  end
end
