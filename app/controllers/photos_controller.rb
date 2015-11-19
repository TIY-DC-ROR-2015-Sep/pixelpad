class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new params.require(:photo).permit(:name, :image)
    if @photo.save
      redirect_to :back, notice: "Photo saved"
    else
      render :new
    end
  end

  def index
    @photos = Photo.all
  end
end
