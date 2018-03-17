class CommentsController < ApplicationController
  before_action :sign_in_required, only: [:create, :destroy]
  def create
  	@comment = Comment.create(text: comment_params[:text], fukyo_id: comment_params[:fukyo_id], user_id: current_user.id)
    redirect_to "/fukyos/#{@comment.fukyo.id}" 
  end

  def destroy
	comment = Comment.find(params[:id])
		if comment.user_id == current_user.id
			comment.destroy
      redirect_to "/fukyos/#{comment.fukyo.id}" 
		end
  end

  private
  def comment_params
  	params.permit(:text, :fukyo_id)
  end
end
