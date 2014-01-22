class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.boolean :publish
      t.belongs_to :category

      t.timestamps
    end
  end
end
