class LogTimesController < ApplicationController
  before_action :admin_user
	# before_action :logged_in_user
  def index
  	@logtimes = LogTime.all
  end

  def destroy
  	LogTime.find(params[:id]).destroy
  	flash[:success] = "you has destroyed a logtime!"
  	redirect_to log_times_url
  end
end
