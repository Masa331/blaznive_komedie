# == Schema Information
#
# Table name: comedies
#
#  id          :integer          not null, primary key
#  cz_title    :string(255)
#  text        :text
#  publish     :boolean
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  en_title    :string(255)
#  slug        :string(255)
#

class Search::Comedy
  include ActiveModel::Model
  attr_accessor :title_search, :category_search

  def result
    query = Comedy.all
    query = query.title_search(title_search) unless title_search.blank?
    query = query.where( category_id: category_search) unless category_search.blank?
    query
  end
end
