class DeleteCategories < ActiveRecord::Migration[5.0]
  def change
    drop_table :categories
    remove_columns :comedies, :category_id
  end
end
