class AlbumsController < ApplicationController
  require 'open-uri'
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album
    else
      render 'new'
    end
  end

  def find_words
    @albums = Album.all.where(owner: 'alif')
  end

  def download_image
    url = 'https://res.cloudinary.com/cloud-storage-test/image/upload/' + params[:image_url].to_s
    data = open(url).read
    send_data data, :disposition => 'image', :filename=>"photo.jpg"

  end

  def show
    @album = Album.find(params[:id])
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end



  private

  def album_params
    params.require(:album).permit(:name, :description, :owner, image:[])
  end
end
