class AddSeriesDataToBooks < ActiveRecord::Migration
  def change
  	add_column :items, :series, :string
  	add_column :items, :tag, :string
  end
end
