class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :name

      t.timestamps
    end
    add_column :items, :series_id, :integer
    add_column :items, :series_number, :integer # Ambiguous I'll grant, but _id is always for other tables, right? series_number is for which number in the series it is. For example, "Harry Potter and the Chamber of Secrets", series.name: "Harry Potter", series_number: 2
  end
end
