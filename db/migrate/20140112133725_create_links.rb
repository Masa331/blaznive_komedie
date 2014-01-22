class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :href
      t.references :video

      t.timestamps
    end
  end
end
