# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  text       :text
#  title      :string(255)
#  publish    :boolean
#  created_at :datetime
#  updated_at :datetime
#  preface    :text
#

class Post < ActiveRecord::Base

  include Publicable

  validates :title,
    presence: true
  validates :text,
    presence: true
  validates :preface,
    presence: true,
    length: { in: 100..300 }

  scope :publicable, -> { where(publish: true) }
end
