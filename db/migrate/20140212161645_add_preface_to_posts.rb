class AddPrefaceToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :preface, :text
  end
end
