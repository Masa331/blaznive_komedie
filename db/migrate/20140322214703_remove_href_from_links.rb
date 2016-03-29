class RemoveHrefFromLinks < ActiveRecord::Migration
  def change
    remove_column :links, :href, :string
  end
end
