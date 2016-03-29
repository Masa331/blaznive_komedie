class AddTypeToLinks < ActiveRecord::Migration
  def change
    add_column :links, :type, :string

    Link.update_all(type: 'YoutubeLink')
  end
end
