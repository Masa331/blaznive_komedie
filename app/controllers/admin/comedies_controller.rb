class Admin::ComediesController < ApplicationController

  before_filter :authenticate_admin!
  layout 'administration'

  def show
    @comedy = Comedy.friendly.find(params[:id])
  end

  def index
    @comedies = Comedy.all
  end

  def new
    @comedy = Comedy.new
  end

  def create
    @comedy = Comedy.new(permitted_params)
    if @comedy.save
      redirect_to admin_comedies_path
    else
      render :new
    end
  end

  def edit
    @comedy = Comedy.friendly.find(params[:id])
  end

  def update
    @comedy = Comedy.friendly.find(params[:id])
    if @comedy.update_attributes(permitted_params)
      redirect_to admin_comedies_path
    else
      render :show
    end
  end

  def destroy
    comedy = Comedy.friendly.find(params[:id])
    if comedy.destroy
      redirect_to admin_comedies_path
    else
      render :edit
    end
  end

  private

  def permitted_params
    params.require(:comedy).permit(:cz_title, :en_title, :text, :category_id, :publish, :tag_list)
  end
end
