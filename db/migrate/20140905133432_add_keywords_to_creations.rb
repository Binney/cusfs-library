class AddKeywordsToCreations < ActiveRecord::Migration
  def change
  	add_column :creations, :keywords, :text
  end
end
