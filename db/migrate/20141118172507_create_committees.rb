class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :date
      t.integer :start_year

      t.string :chairbeing
      t.string :secretary
      t.string :treasurer
      t.string :librarian
      t.string :memsec
      t.string :ttba

      t.string :reeve
      t.string :geldjarl
      t.string :runecaster
      t.string :meadkeeper
      t.string :bard

      t.text :vice_presidents

      t.timestamps
    end
  end
end
