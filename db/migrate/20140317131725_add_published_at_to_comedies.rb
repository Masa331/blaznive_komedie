class AddPublishedAtToComedies < ActiveRecord::Migration
  def change
    add_column :comedies, :published_at, :datetime

    Comedy.find_each do |comedy|
      comedy.published_at = comedy.created_at
      comedy.save
    end
  end
end
