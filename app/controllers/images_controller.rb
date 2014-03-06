class ImagesController < ApplicationController

  before_filter :load_random_comedies

  def index
    @images = Image.comedy_poster.publicable.page(params[:page]).per(10)
  end
end
