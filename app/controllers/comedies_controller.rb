class ComediesController < ApplicationController
  def show
    @comedy = Comedy.friendly.find(params[:id])
  end

  def index
    @comedies = Comedy.publicable.page(params[:page]).per(5)
  end

  def list
    @search = Search::Comedy.new(search_params)
    @comedies = @search.result.publicable.order(:cz_title)
  end

  private

  def search_params
    params.permit(search: [ :title_search, :category_search ]).fetch(:search, {})
  end
end
