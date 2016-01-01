class LikeablesController < ApplicationController
  
  def create 
    @likeable = Likeable.find(params[:id])
    @likeable.user_id = current_user.id
    if @likeable.save
      respond_to do |format|
        format.html (redirect_to @micropost)
        format.js
      end
    end
  end

  def destroy
  	@likeable = Likeable.find(params[:id])
    @micropost = @likeable.micropost
    @likeable.destroy
    respond_to do |format|
      format.html {redirect_to @micropost} 
      format.js
    end  
  end

  private

  def like_params
    params.require(:likeable).permit(:user_id, :micropost_id)
  end
end
