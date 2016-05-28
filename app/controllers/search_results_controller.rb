class SearchResultsController < ApplicationController
  def index
    @searched_term = search_param

    @comedies_by_title = Comedy.title_search(@searched_term)
    @comedies_by_text = Comedy.where("text LIKE ?", "%#{@searched_term}%")

    @tags = ActsAsTaggableOn::Tag.where('name LIKE ?', "%#{@searched_term}%")
    @comedies_by_tag = Comedy.tagged_with(@tags.map(&:name), any: true)
  end

  private

  def search_param
    params.permit(:search_term)[:search_term]
  end
end
