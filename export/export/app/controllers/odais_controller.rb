class OdaisController < ApplicationController
	def index
		@odais = Odai.all
	end

	def new
	end

	def create
		Odai.create(detail: odai_params[:detail], user_id: current_user.id)
	end

	def show
		@odai = Odai.find(params[:id])
		@fukyos = @odai.fukyos
	end

	def destroy
		odai = Odai.find(params[:id])
		if odai.user_id == current_user.id
			odai.destroy
		end
	end

	private
	def odai_params
	  params.permit(:detail)
	end

end
