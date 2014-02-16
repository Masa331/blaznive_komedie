class CreatePost < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.boolean :publish

      t.timestamps
    end
  end
end
