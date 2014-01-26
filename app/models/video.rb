class Video < ActiveRecord::Base
  belongs_to :category
  belongs_to :comedy
  has_one :link

  accepts_nested_attributes_for :link

  validates :title, presence: true
  validates :link, presence: true

  def iframe_options
    { src: link.href, height: 281, width: 500, allowfullscreen: '', frameborder: 0 }
  end
end
