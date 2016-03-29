class Category < ApplicationRecord
  has_many :comedies

  validates :title, presence: true
end
