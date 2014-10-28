class ComediesController < ApplicationController

  before_filter :load_random_comedies

  def show
    @comedy          = Comedy.friendly.find(params[:id])
    @next_comedy     = Comedy.next_by_id(@comedy.id)
    @previous_comedy = Comedy.previous_by_id(@comedy.id)
  end

  def index
    @comedies = Comedy.publicable.order(published_at: :desc).page(params[:page]).per(5)
  end

  def list
    @search   = Search::Comedy.new(search_params)
    @comedies = @search.result.publicable.order(:cz_title)
  end

  private


  def search_params
    params.permit(search: [:title_search, :category_search, :tag_search]).fetch(:search, {})
  end
end
