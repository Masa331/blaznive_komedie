class Post < ActiveRecord::Base
  has_many :images
  has_many :videos
  has_many :links

  belongs_to :category

  validates :title, presence: true
  validates :category, presence: true
  validates :text, presence: true, length: { minimum: 100 }
end
