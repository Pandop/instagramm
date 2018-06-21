class PicsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  before_action :find_pic, only: [:show, :edit,:update,:destroy,:upvote]
 
  def index
    @pics = Pic.all.sorted
  end

  def show
    @pic = Pic.find(params[:id])
  end

  def new
    #@pic = Pic.new
    @pic = current_user.pics.build
  end

  def create
    #@pic = Pic.new(pic_params)
    @pic = current_user.pics.build(pic_params)
    if @pic.save
      #flash[:notice] = "Years! It was posted."
      #redirect_to(@pic, note: "Yesss! It was posted!")
      flash[:notice] = "Years! It was posted."
      redirect_to(pics_path)
    else
      render('new')
    end
  end

  def edit 
    #@pic = Pic.find(params[:id])
  end

  def update 
    #@pic = Pic.find(params[:id])
    if @pic.update_attributes(pic_params) 
      #flash[:notice] = "Yess! It was updated..."
      #redirect_to(pic_path(@pic), note: "Yesss! It was updated!")
      flash[:notice] = "Yess! It was updated..."
      redirect_to(pic_path(@pic))
    else
      render('edit')
    end
  end

  def destroy 
    #@pic = Pic.find(params[:id])
    @pic.destroy 
    redirect_to(pics_path)
  end

  def upvote
    @pic.upvote_by(current_user)
    redirect_to(pic_path(@pic))
    #redirect_to :back
    #render(pic_path(@pic))
  end

  private 

    def find_pic
      @pic = Pic.find(params[:id])
    end

    def pic_params
      return params.require(:pic).permit(:title, :description, :image)
    end
end
