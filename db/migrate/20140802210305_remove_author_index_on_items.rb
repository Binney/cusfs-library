class RemoveAuthorIndexOnItems < ActiveRecord::Migration
  def change
  	remove_index :items, :author
  	remove_column :items, :author, :string
  	add_index :items, :author_id
  	add_index :users, :name
  	add_index :authors, :name
  	add_index :series, :name
  end
end
