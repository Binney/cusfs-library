class AddExplanationToExhibits < ActiveRecord::Migration
  def change
  	add_column :exhibits, :explanation, :text
  end
end
