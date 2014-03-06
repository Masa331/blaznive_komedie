class VideosController < ApplicationController

  before_filter :load_random_comedies

  def index
    @videos = Video.publicable.page(params[:page]).per(5)
  end
end
