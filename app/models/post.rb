class Post < ActiveRecord::Base
  include Publicable

  validates :title,
    presence: true
  validates :text,
    presence: true
  validates :preface,
    presence: true,
    length: { in: 100..300 }
end
