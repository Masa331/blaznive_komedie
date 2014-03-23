class Admin::LinksController < ApplicationController

  before_filter :authenticate_admin!
  layout 'administration'

  def show
    @link = Link.find(params[:id])
  end

  def index
    @links = Link.all
  end

  def new
    @link = ulink.new
  end

  def create
    if Link.create(permitted_params)
      redirect_to admin_links_path
    else
      render :new
    end
  end

  def edit
    @link = Link.find[:id]
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(permitted_params)
      next_link = Link.where(["id > ?", @link.id]).first
      if next_link
        redirect_to admin_link_path(next_link)
      else
        redirect_to admin_links_path
      end
    else
      render :show
    end
  end

  def destroy
    link = Link.find(params[:id])

    if link.destroy
      flash[:notice] = 'Obrázek úspěšně smazána.' # TODO predelat do locales
    else
      flash[:error] = 'Obrázek se nepodařilo smazat.'
    end

    redirect_to admin_links_path
  end

  private

  def permitted_params
    params.require(:youtube_link).permit(:uri, :linker_id)
  end
end
