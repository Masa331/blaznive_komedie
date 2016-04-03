class DeleteUsersAndRemovePublicable < ActiveRecord::Migration[5.0]
  def change
    drop_table :users

    remove_columns :comedies, :publish, :published_at
    remove_columns :videos, :publish, :published_at
    remove_columns :images, :publish, :published_at
  end
end
