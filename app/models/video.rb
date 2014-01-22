class Video < ActiveRecord::Base
  belongs_to :category
  has_one :link

  accepts_nested_attributes_for :link

  validates :title, presence: true
  validates :link, presence: true
end
