class UsersController < ApplicationController
  before_action :sign_in_required, only: [:edit, :update]
  def show
  	@user = User.find(params[:id])
    @username = @user.username
  	@odais = @user.odais.page(params[:page]).per(10).order("created_at DESC")
  	@fukyos = @user.fukyos.page(params[:page]).per(10).order("created_at DESC")
    @likefukyos = @user.likes
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
  	current_user.update(update_params)
  end

  private
  def update_params
  	params.require(:user).permit(:username)
  end
end
