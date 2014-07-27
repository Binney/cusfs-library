#namespace :seed do
#  desc "create committee accounts"
#  task seed: :environment do

	librarian = User.create( name: "The Librarian",  email: "librarian@cusfs.org.uk",  password: "OokAhOok42", password_confirmation: "OokAhOok42",    		  admin: true)
	chairbeing = User.create(name: "The Chairbeing", email: "chairbeing@cusfs.org.uk", password: "Amazeballs42", password_confirmation: "Amazeballs42", 	  admin: true)
	secretary = User.create( name: "The Secretary",  email: "secretary@cusfs.org.uk",  password: "Longsuffering42", password_confirmation: "Longsuffering42", admin: true)
	ttba = User.create(      name: "The Editor",     email: "ttba@cusfs.org.uk",       password: "Jagrofess42", password_confirmation: "Jagrofess42",  		  admin: true)
	treasurer = User.create( name: "The Treasurer",  email: "treasurer@cusfs.org.uk",  password: "Smaug42", password_confirmation: "Smaug42", 				  admin: true)
	memsec = User.create(    name: "The Membership Secretary", email: "memsec@cusfs.org.uk", password: "Gatekeeper42", password_confirmation: "Gatekeeper42", admin: true)
	reeve = User.create(     name: "The Reeve",      email: "reeve@cusfs.org.uk",      password: "Omnipotence42", password_confirmation: "Omnipotence42", 	  admin: true)

#  end
#end	