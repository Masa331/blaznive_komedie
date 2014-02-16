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

require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end
