class ImagesController < ApplicationController
  def index
    @images = Image.comedy_poster.publicable.page(params[:page]).per(10)
  end
end
