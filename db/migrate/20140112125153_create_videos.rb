class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.belongs_to :category
      t.references :post

      t.timestamps
    end
  end
end
