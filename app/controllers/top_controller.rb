class TopController < ApplicationController

  def index
	@odais = Odai.includes(:user).page(params[:page]).per(10).order("created_at DESC")
	@fukyos = Fukyo.includes(:user).page(params[:page]).per(10).order("created_at DESC")
  @odai = Odai.new
  #@odaiの中身がnilになってしまうためここでnewする
  end
  
  def about
  end
end
