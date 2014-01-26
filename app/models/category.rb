class Category < ActiveRecord::Base
  has_many :images
  has_many :comedies
  has_many :videos

  validates :title, presence: true
end
