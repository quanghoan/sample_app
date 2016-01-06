class MicropostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy
	
	def create
		@micropost = current_user.microposts.build(micropost_params)
		if @micropost.save
			flash[:success] = "Micropost created!"
			redirect_to root_url
		else
			@feed_items = []
			render 'static_pages/home'
		end
	end

	def show
		@micropost = Micropost.find(params[:id])
		@comments = @micropost.comments
		@comment = @micropost.comments.build
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Micropost deleted"
		redirect_to root_url
	end

	def like  
		@micropost = Micropost.find(params[:id])
		@micropost.liked_by current_user
		respond_to do |format|
			format.html 
			format.js 
		end		
	end

	def unlike
		@micropost = Micropost.find(params[:id])
		@micropost.unliked_by current_user
		respond_to do |format|
			format.html
			format.js 
		end	
	end

	private

	def micropost_params
		params.require(:micropost).permit(:content, :picture)
	end

	def correct_user
		@micropost = current_user.microposts.find_by(id: params[:id])
		redirect_to root_url if @micropost.nil?
	end

end
