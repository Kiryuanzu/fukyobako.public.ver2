class TopController < ApplicationController
	before_action :sign_in_required, only: [:index]


	def index
		@odais = Odai.includes(:user).page(params[:page]).per(5).order("created_at DESC")
		@fukyos = Fukyo.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    end

    def show
    	user = User.find(params[:id])
    	
    end

    def about
    	
    end
end
