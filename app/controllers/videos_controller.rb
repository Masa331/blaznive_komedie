class VideosController < ApplicationController
  def index
    @videos = Video.order(created_at: :desc).page(params[:page]).per(5)
  end
end
