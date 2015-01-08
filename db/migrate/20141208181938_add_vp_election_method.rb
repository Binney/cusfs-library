class AddVpElectionMethod < ActiveRecord::Migration
  def change
  	add_column :committees, :vp_election_method, :string
  end
end
