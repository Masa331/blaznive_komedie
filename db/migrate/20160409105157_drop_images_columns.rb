class DropImagesColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :images, :image_content_type
    remove_column :images, :image_file_size
    remove_column :images, :image_updated_at
    rename_column :images, :image_file_name, :image_url
  end
end
