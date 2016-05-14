class ComediesController < ApplicationController
  def show
    @comedy          = Comedy.find(params[:id])
    @next_comedy     = Comedy.next_by_id(@comedy.id)
    @previous_comedy = Comedy.previous_by_id(@comedy.id)
  end

  def index
    @comedies = Comedy.order(created_at: :desc).page(params[:page]).per(5)
  end
end
