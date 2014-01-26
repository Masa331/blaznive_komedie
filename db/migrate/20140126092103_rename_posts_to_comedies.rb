class RenamePostsToComedies < ActiveRecord::Migration
  def change
    rename_table :posts, :comedies
  end
end
