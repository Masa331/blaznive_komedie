class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.text :text
      t.string :title
      t.boolean :publish

      t.timestamps
    end
  end

  def down
    drop_table :posts
  end
end
