class Comedy < ActiveRecord::Base
  has_many :images
  has_many :videos
  has_many :links

  belongs_to :category

  validates :cz_title, presence: true
  validates :category, presence: true
  validates :text, presence: true, length: { minimum: 100 }

  def bilingual_title
    return cz_title unless en_title
    [ cz_title, en_title ].join(' - ')
  end

end
