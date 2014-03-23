class Admin::VideosController < ApplicationController

  before_filter :authenticate_admin!
  layout 'administration'

  def show
    @video = Video.find params[:id]
  end

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    if Video.create(permitted_params)
      redirect_to admin_videos_path
    else
      render :new
    end
  end

  def edit
    @video = Video.find[:id]
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(permitted_params)
      redirect_to admin_videos_path
    else
      render :new
    end
  end

  def destroy
    video = Video.find(params[:id])

    if video.destroy
      flash[:notice] = 'Video úspěšně smazána.' # TODO predelat do locales
    else
      flash[:error] = 'Video se nepodařilo smazat.'
    end

    redirect_to admin_videos_path
  end

  private

  def permitted_params
    params.require(:video).permit(:title, :comedy_id)
  end
end
