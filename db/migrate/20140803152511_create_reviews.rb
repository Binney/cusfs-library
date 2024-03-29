class CreateReviews < ActiveRecord::Migration
	def change
		create_table :reviews do |t|
			t.string :title
			t.text :content
			t.text :content_warnings
			t.integer :rating
			t.integer :user_id
			t.integer :item_id
			t.integer :series_id
			t.integer :author_id

			t.timestamps
		end
	end
end
