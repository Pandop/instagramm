class PicsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)
    if @pic.save
      flash[:success] = "Picture was created successfully."
      redirect_to(pics_path)
    else
      render('new')
    end
  end

  private 
    def pic_params
      return params.require(:pic).permit(:title, :description)
    end
end
