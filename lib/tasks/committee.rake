namespace :db do
  desc 'Upgrade all committee members to admin'
  task upgrade: :environment do
    for i in 1..7
 	  User.find(i).update_attribute(:admin, true)
    end
  end
end
