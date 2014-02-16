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
#

class Comedy < ActiveRecord::Base
  has_one :image
  has_one :video

  belongs_to :category

  validates :cz_title,
    presence: true
  validates :category,
    presence: true
  validates :text,
    presence: true,
    length: { minimum: 100 }

  scope :publicable, -> { where(publish: true) }

  def self.title_search(title)
    where(arel_table[:cz_title].matches("%#{title}%").or(arel_table[:en_title].matches("%#{title}%")))
  end

  def bilingual_title
    # TODO predelat naopak - pokud je jeden title, tak je to en ne cz
    return cz_title unless en_title
    [ cz_title, en_title ].join(' - ')
  end

end
