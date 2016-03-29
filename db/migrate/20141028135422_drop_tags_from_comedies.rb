class DropTagsFromComedies < ActiveRecord::Migration
  def change
    drop_table :taggings
    drop_table :tags
    drop_table :wp_posts
  end
end
