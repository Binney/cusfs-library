class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
    	t.integer :item_id
    	t.integer :collection_id

      t.timestamps
    end

    create_table :collections do |t|
    	t.string :name
    	t.string :description
    	t.integer :user_id

    	t.timestamps
    end
  end
end
