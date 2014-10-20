class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamps
    end

    create_table :genres_items, id: false do |t|
      t.belongs_to :genre
      t.belongs_to :item
    end
    
  end
end
