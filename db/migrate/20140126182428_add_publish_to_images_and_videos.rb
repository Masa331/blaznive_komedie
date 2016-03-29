class AddPublishToImagesAndVideos < ActiveRecord::Migration
  def change
    add_column :images, :publish, :boolean
    add_column :videos, :publish, :boolean
  end
end
