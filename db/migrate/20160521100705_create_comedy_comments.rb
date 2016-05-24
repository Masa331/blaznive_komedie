class CreateComedyComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comedy_comments do |t|
      t.string :text
      t.references :user, foreign_key: true
      t.references :comedy, foreign_key: true

      t.timestamps
    end
  end
end
