class CreateWithdrawals < ActiveRecord::Migration
  def change
    create_table :withdrawals do |t|
      t.integer :user_id
      t.integer :item_id
      t.timestamps
    end
  end
end
