class Admin::CategoriesController < ApplicationController

  before_filter :authenticate_admin!
  layout 'administration'

  def show
    @category = Category.find params[:id]
  end

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    if Category.create(permitted_params)
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find[:id]
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(permitted_params)
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    category = Category.find(params[:id])

    if category.destroy
      flash[:notice] = 'Kategories úspěšně smazána.' # TODO predelat do locales
    else
      flash[:error] = 'Kategorii se nepodařilo smazat.'
    end

    redirect_to admin_categories_path
  end

  private

  def permitted_params
    params.require(:category).permit(:title)
  end
end
