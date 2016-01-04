class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@micropost = Micropost.find(params[:micropost_id])		
		@comment = @micropost.comments.build(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			Notification.create(user_id: @comment.user_id, comment_id: @comment.id, micropost_id: @micropost.id) 			
			respond_to do |format|
				format.html { redirect_to request.referrer || root_url}	
				format.js
			end
		end
	end

	def destroy
		@micropost = Micropost.find(params[:micropost_id])	
		@comment.destroy
		respond_to do |format|
			format.html do 
				flash[:success] = "comment deleted"
				redirect_to request.referrer || root_url
			end
			format.js
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :micropost_id, :user_id)
	end

	def correct_user
		@comment = current_user.comments.find_by(id: params[:id])
		redirect_to root_url if @comment.nil?
	end
end
