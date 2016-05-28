class ImagesController < ApplicationController
  def index
    @images = Image.order(created_at: :desc).page(params[:page]).per(10)
  end
end
