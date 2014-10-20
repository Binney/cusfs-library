class AddUserAboutMeAndGenreDescription < ActiveRecord::Migration
  def change
  	add_column :users, :about_me, :text
  	add_column :genres, :description, :text
  end
end
