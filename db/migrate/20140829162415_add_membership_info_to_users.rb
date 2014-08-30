class AddMembershipInfoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :membership_expiry, :datetime, default: 1000.years.from_now
  end
end
