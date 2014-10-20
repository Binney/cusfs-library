class AddImageUrlToEventsAndCreations < ActiveRecord::Migration
  def change
  	add_column :events, :image_url, :string
  	add_column :creations, :image_url, :string
  end
end
