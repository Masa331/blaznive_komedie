class ChangesToLink < ActiveRecord::Migration
  def change
    add_column :links, :uri, :string

    Link.find_each do |link|
      link.uri = link.href
      link.save
    end
  end
end
