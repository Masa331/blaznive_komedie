# == Schema Information
#
# Table name: comedies
#
#  id          :integer          not null, primary key
#  cz_title    :string(255)
#  text        :text
#  publish     :boolean
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  en_title    :string(255)
#  slug        :string(255)
#

class Comedy < ActiveRecord::Base
  include FriendlyId
  friendly_id :bilingual_title, use: :slugged

  has_one :image
  has_one :video

  belongs_to :category

  validates :image,
    presence: true

  validates :video,
    presence: true

  validates :category,
    presence: true

  validates :text,
    presence: true,
    length: { minimum: 100 }

  scope :publicable, -> { where(publish: true) }

  def self.title_search(title)
    where(arel_table[:cz_title].matches("%#{title}%").or(arel_table[:en_title].matches("%#{title}%")))
  end

  def self.next_by_id(id)
    where(["id > ?", id]).first
  end

  def self.previous_by_id(id)
    where(["id < ?", id]).last
  end

  def self.random(count = 5)
    order("RANDOM()").limit(count)
  end

  def bilingual_title
    [ cz_title, en_title ].compact.join(' - ')
  end

end
