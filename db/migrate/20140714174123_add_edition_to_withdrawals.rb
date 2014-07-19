class AddEditionToWithdrawals < ActiveRecord::Migration
  def change
  	add_column :withdrawals, :edition, :char
  end
end
