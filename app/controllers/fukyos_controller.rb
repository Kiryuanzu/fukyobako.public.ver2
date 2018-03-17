class FukyosController < ApplicationController
	before_action :sign_in_required, only: [:new, :create, :destroy]

	def new
	  @odai = Odai.find(params[:odai_id])
	  @fukyo = Fukyo.new
	  @fukyo.odai_id = @odai.id
	end

	def create
    @fukyo = Fukyo.create(fukyo_params)
    FukyoMailer.fukyo_notify(@fukyo).deliver_now 
    redirect_to root_url
	end

	def show
	  @fukyo = Fukyo.find(params[:id])
	  @comments = Comment.includes(:user).page(params[:page]).per(10).order("created_at DESC")
	end

	def destroy
		fukyo = Fukyo.find(params[:id])
		if fukyo.user_id == current_user.id
			fukyo.destroy
			redirect_to root_url
		end
	end

	private
	def fukyo_params
	  params.require(:fukyo).permit(:odai_id, :title, :URL, :detail).merge(user_id: current_user.id)
	end
end
