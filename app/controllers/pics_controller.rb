class PicsController < ApplicationController
  # before_action :find_pic, only: [:show, :edit, :destroy]
  def index
    @pics = Pic.all.order("created_at")
  end

  def show
    @pic = Pic.find(params[:id])
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)
    if @pic.save
      flash[:notice] = "Years! It was posted."
      redirect_to(pics_path)
    else
      render('new')
    end
  end

  private 
    def find_pic
      @pic = Pic.new(pic_params)
    end
    def pic_params
      return params.require(:pic).permit(:title, :description)
    end
end
