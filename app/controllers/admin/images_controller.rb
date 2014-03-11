class Admin::ImagesController < ApplicationController

  before_filter :authenticate_admin!
  layout 'administration'

  def show
    @image = Image.find params[:id]
  end

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    if Image.create(permitted_params)
      redirect_to admin_images_path
    else
      render :new
    end
  end

  def edit
    @image = Image.find[:id]
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(permitted_params)
      redirect_to admin_images_path
    else
      render :new
    end
  end

  def destroy
    image = Image.find(params[:id])

    if image.destroy
      flash[:notice] = 'Obrázek úspěšně smazána.' # TODO predelat do locales
    else
      flash[:error] = 'Obrázek se nepodařilo smazat.'
    end

    redirect_to admin_images_path
  end

  private

  def permitted_params
    params.require(:image).permit(:title, :image, :comedy_id)
  end
end
