class LikeablesController < ApplicationController
  
  def create 
    @likeable = Likeable.create(like_params)
  	@micropost = @likeable.micropost
  	respond_to do |format|
      format.html {redirect_to :back} 
      format.js
    end  
  end

  def destroy
  	@likeable = Likeable.find(params[:id])
    @micropost = @likeable.micropost
    @likeable.destroy
    respond_to do |format|
      format.html {redirect_to :back} 
      format.js
    end  
  end

  private

  def like_params
    params.require(:likeable).permit(:user_id, :micropost_id)
  end
end
