class RenamePostIdColumnsInAllTables < ActiveRecord::Migration
  def change
    rename_column :images, :post_id, :comedy_id
    rename_column :videos, :post_id, :comedy_id
  end
end
