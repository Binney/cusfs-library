class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.string  :title
      t.text    :notes
      t.integer :support
      t.timestamps
    end
  end
end
