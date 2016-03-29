class RemoveUnusedColumnsFromVarisouModels < ActiveRecord::Migration
  def change
    remove_column :images, :caption
    remove_column :images, :category_id
    remove_column :videos, :category_id
  end
end
