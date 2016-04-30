class Comedy::ThumbnailsController < ApplicationController
  def index
    @comedies = Comedy.order(:cz_title)
  end
end
