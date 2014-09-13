class CreateCreations < ActiveRecord::Migration
  def change
    create_table :creations do |t|
      t.string :name
      t.string :url
      t.string :medium
      t.text :description

      t.timestamps
    end
  end
end
