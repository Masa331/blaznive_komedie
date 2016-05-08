class SearchResultsController < ApplicationController
  def index
    @searched_term = params[:search_term]

    @comedies_by_title = Comedy.title_search(@searched_term)
    @comedies_by_text = Comedy.where("text LIKE ?", "%#{@searched_term}%")
    @tags = ActsAsTaggableOn::Tag.where('name LIKE ?', "%#{@searched_term}%")
  end
end
