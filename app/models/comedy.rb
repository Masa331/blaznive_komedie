class Comedy < ApplicationRecord

  include FriendlyId

  include Publicable

  friendly_id :bilingual_title, use: :slugged

  has_one :image
  has_one :video

  belongs_to :category

  validates :category,
    presence: true

  validates :text,
    presence: true,
    length: { minimum: 100 }

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
    [ cz_title, en_title ].select(&:present?).join(' - ')
  end

  def to_s
    bilingual_title
  end
end
