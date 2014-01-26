class AddColumnsToImage < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.string :alt
      t.string :caption
    end
  end
end
