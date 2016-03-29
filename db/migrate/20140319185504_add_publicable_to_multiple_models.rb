class AddPublicableToMultipleModels < ActiveRecord::Migration
  def change
    add_column :posts,  :published_at, :datetime
    add_column :images, :published_at, :datetime
    add_column :videos, :published_at, :datetime

    Post.find_each do |post|
      post.published_at = post.created_at
      post.save
    end

    Image.find_each do |image|
      image.published_at = image.created_at
      image.save
    end

    Video.find_each do |video|
      video.published_at = video.created_at
      video.save
    end
  end
end
