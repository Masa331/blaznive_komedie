require 'active_support/concern'

module Publicable

  extend ActiveSupport::Concern

  included do
    before_save :update_published_at, if: :publish_changed?
    scope :publicable, -> { where(publish: true) }
  end

  def publicable?
    publish
  end

  private

  def update_published_at
    self.published_at = Time.zone.now
  end

end
