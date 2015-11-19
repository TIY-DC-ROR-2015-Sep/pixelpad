class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new params.require(:photo).permit(:name, :image)
    if @photo.save
      @photo.render_bitmap!
      redirect_to :back, notice: "Photo saved"
    else
      render :new
    end
  end

  def index
    @photos = Photo.all
  end

  def draw
    @photo = Photo.find params[:id]
    @photo.render_bitmap!
    redirect_to :back
  end

  def reset
    Photo.reset!
    redirect_to :back
  end
end
