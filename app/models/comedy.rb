class Comedy < ApplicationRecord
  acts_as_taggable

  has_one :image,
    dependent: :destroy

  has_one :video,
    dependent: :destroy

  validates :text,
    presence: true,
    length: { minimum: 100 }

  def self.title_search(title)
    where("cz_title LIKE ?", "%#{title}%").or(where("en_title LIKE ?", "%#{title}%"))
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
