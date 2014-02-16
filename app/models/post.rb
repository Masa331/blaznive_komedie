# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  text       :string(255)
#  title      :string(255)
#  publish    :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Post < ActiveRecord::Base
  validates :title,
    presence: true
  validates :text,
    presence: true
  validates :preface,
    presence: true,
    length: { in: 100..300 }

  scope :publicable, -> { where(publish: true) }
end
