class LikesController < ApplicationController
  
  def create
  	@like = Like.create(params[:like])
  	@micropost = @like.micropost
  	render :toggle
  end

  def destroy
  	like = Like.find(params[:id]).destroy
  	@micropost = like.micropost
  	render :toggle
  end
end
