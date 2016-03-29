class RemoveVideoIdFromLinks < ActiveRecord::Migration
  def up
    remove_column :links, :video_id
  end

  def down
    add_column :links, :video_id, :integer
  end
end
