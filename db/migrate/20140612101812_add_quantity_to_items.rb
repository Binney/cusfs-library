class AddQuantityToItems < ActiveRecord::Migration
  def change
  	add_column :items, :quantity, :integer
  	add_column :items, :editions, :string
  end
end
