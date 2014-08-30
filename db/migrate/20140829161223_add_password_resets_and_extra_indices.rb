class AddPasswordResetsAndExtraIndices < ActiveRecord::Migration
  def change
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_sent_at, :datetime

    add_index :reviews, :item_id
    add_index :reviews, :author_id
    add_index :reviews, :series_id

    add_index :withdrawals, :item_id
    add_index :withdrawals, :user_id

    add_index :exhibits, :item_id
    add_index :exhibits, :collection_id
    add_index :exhibits, [:item_id, :collection_id], unique: true

    add_index :items, :series_id
  end
end