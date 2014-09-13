class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :time
      t.string   :name
      t.text     :description
      t.string   :location
      t.string   :activity

      t.timestamps
    end
  end
end
