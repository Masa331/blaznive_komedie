class ComediesController < ApplicationController
  def show
    @comedy = Comedy.find(params[:id])
  end

  def index
    @comedies = Comedy.all
  end
end
