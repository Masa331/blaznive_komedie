class AddSlugToComedies < ActiveRecord::Migration
  def change
    add_column :comedies, :slug, :string, unique: true

    add_index :comedies, :slug, unique: true
  end
end
