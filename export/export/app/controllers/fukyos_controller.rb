class FukyosController < ApplicationController
	def index
		@fukyos = Fukyo.all
	end

	def new
	  @odai = Odai.find(params[:odai_id])
	  @fukyo = Fukyo.new
	  @fukyo.odai_id = @odai.id
	end

	def create
      @fukyo = Fukyo.create(create_params)
      redirect_to :root
	end

	def show
	  @fukyo = Fukyo.find(params[:id])
	  @comments = @fukyo.comments
	end

	def destroy
		fukyo = Fukyo.find(params[:id])
		if fukyo.user_id == current_user.id
			fukyo.destroy
		end
	end

	private
	def create_params
	  params.require(:fukyo).permit(:odai_id, :title, :URL, :detail).merge(user_id: current_user.id)
	end
end
