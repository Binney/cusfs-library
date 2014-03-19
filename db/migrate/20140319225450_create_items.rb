class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :medium, default: "book"
      t.string :author
      t.integer :date
      t.string :isbn
      t.string :location
      t.string :notes
      t.string :status, default: "Available"

      t.timestamps
    end

    add_index :items, :title
    add_index :items, :medium
    add_index :items, :author
    add_index :items, :date
    add_index :items, :isbn
    add_index :items, :status
  end
end
