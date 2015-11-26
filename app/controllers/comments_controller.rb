class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def create
		@micropost = Micropost.find(params[:micropost_id])		
		@comment = @micropost.comments.create(comment_params)
		@comment.user_id = current_user.id
		if @comment.save	
			redirect_to request.referrer || root_url
	  else
	  	flash[:danger] = "error! comment is not created yet."
	  	redirect_to micropost_path(@micropost)
	  end
	end

	def destroy
		@comment.destroy
		flash[:success] = "comment deleted"
		redirect_to request.referrer || root_url
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :micropost_id, :user_id)
	end

	def correct_user
		@comment = Comment.find_by(id: params[:id])
		redirect_to root_url if @comment.nil?
	end
end
