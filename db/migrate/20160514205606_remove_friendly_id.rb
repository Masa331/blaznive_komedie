class RemoveFriendlyId < ActiveRecord::Migration[5.0]
  def change
    remove_column :comedies, :slug
  end
end
