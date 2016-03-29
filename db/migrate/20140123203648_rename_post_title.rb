class RenamePostTitle < ActiveRecord::Migration
  def change
    change_table :posts do |t|
      t.rename :title, :cz_title
      t.string :en_title
    end
  end
end
