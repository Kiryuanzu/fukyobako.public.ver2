class LikesController < ApplicationController
  before_action :sign_in_required, only: [:create, :destroy] 
  def create
    @fukyo= Fukyo.find(params[:fukyo_id])
    @like = @fukyo.likes.create(user_id: current_user.id)
    @likes =@fukyo.likes
    @fukyos = Fukyo.all
  end

  def destroy
    @fukyo = Fukyo.find(params[:fukyo_id])
    like = @fukyo.likes.find_by(user_id: current_user.id)
    like.destroy
    @likes = @fukyo.likes
    @fukyos = Fukyo.all
  end

end
