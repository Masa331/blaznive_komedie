class Search::Comedy
  include ActiveModel::Model
  attr_accessor :title_search, :category_search, :tag_search

  def result
    query = Comedy.all
    query = query.title_search(title_search) unless title_search.blank?
    query = query.where(category_id: category_search) unless category_search.blank?
    query = query.where(category_id: category_search) unless category_search.blank?
    query = query.tagged_with(tag_search) unless tag_search.blank?
    query
  end
end
