class WpPost < ActiveRecord::Base
  def self.migrate_from_wp
    where(post_type: 'post').each do |old|
      Comedy.new(title: old.post_title, text: old.post_content).save(validate: false)
    end
  end
end
