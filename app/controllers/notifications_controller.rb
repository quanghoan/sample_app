class NotificationsController < ApplicationController
  before_action :logged_in_user
  def index
  	@notifications = Notification.all
  end

  def destroy
  	Notification.find(params[:id]).destroy
  	flash[:success] = "destroyed a message ."
  	redirect_to notifications_url
  end
end
