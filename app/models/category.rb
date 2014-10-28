class Category < ActiveRecord::Base
  has_many :comedies

  validates :title, presence: true
end
