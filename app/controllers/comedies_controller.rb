class ComediesController < ApplicationController
  def show
    @comedy          = Comedy.find(params[:id])
    @next_comedy     = Comedy.next_by_id(@comedy.id)
    @previous_comedy = Comedy.previous_by_id(@comedy.id)
  end

  def index
    @comedies = Comedy.all.includes(:image).order(created_at: :desc).page(params[:page]).per(5)

    respond_to do |format|
      format.html do |html|
        html.desktop do
          @comedies = @comedies.includes(:tags)
        end

        html.tablet do
          @comedies = @comedies.includes(:tags)
        end
      end
    end
  end
end
