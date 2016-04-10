class ImagesController < ApplicationController
  def index
    @images = Image.all.page(params[:page]).per(10)
  end
end
