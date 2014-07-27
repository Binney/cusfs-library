class AddAdminOpts < ActiveRecord::Migration
  def change
  	add_column :users, :admin, :boolean, default: false
  	remove_column :items, :quantity, :integer
  	remove_column :items, :series, :string
  end
end
