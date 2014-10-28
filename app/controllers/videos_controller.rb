class VideosController < ApplicationController
  def index
    @videos = Video.publicable.page(params[:page]).per(5)
  end
end
