class ImagesController < ApplicationController
  def index
    @images = Image.comedy_poster.page(params[:page]).per(10)
  end
end
