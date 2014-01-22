class Category < ActiveRecord::Base
  has_many :images
  has_many :posts
  has_many :videos

  validates :title, presence: true
end
