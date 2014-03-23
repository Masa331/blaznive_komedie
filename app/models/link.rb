# == Schema Information
#
# Table name: links
#
#  id          :integer          not null, primary key
#  video_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#  type        :string(255)
#  uri         :string(255)
#  linker_id   :integer
#  linker_type :string(255)
#

class Link < ActiveRecord::Base

  belongs_to :linker, polymorphic: true

  validates :uri, presence: true

  def o_uri
    URI(read_attribute(:uri) || 'ahoj' )
  end

  def method_missing(method, *args, &block)
    if o_uri.respond_to?(method)
      o_uri.send(method)
    else
      super
    end
  end
end
