class Link < ActiveRecord::Base
  validates :href, presence: true
end
