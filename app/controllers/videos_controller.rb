class VideosController < ApplicationController
  def index
    @videos = Video.page(params[:page]).per(5)
  end
end
