class Link < ActiveRecord::Base

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
