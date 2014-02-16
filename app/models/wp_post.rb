# == Schema Information
#
# Table name: wp_posts
#
#  id                    :integer          not null, primary key
#  post_author           :integer
#  post_date             :datetime
#  post_date_gmt         :datetime
#  post_content          :text
#  post_title            :text
#  post_excerpt          :text
#  post_status           :text
#  comment_status        :text
#  ping_status           :text
#  post_password         :text
#  post_name             :text
#  to_ping               :text
#  pinged                :text
#  post_modified         :datetime
#  post_modified_gmt     :datetime
#  post_content_filtered :text
#  post_parent           :integer
#  guid                  :text
#  menu_order            :integer
#  post_type             :text
#  post_mime_type        :text
#  comment_count         :integer
#

class WpPost < ActiveRecord::Base
  def self.migrate_from_wp
    where(post_type: 'post').each do |old|
      Comedy.new(title: old.post_title, text: old.post_content).save(validate: false)
    end
  end
end
