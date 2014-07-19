#namespace :seed do
#  desc "create committee accounts"
#  task seed: :environment do

	librarian = User.create( name: "The Librarian",  email: "librarian@cusfs.org.uk",  password: "OokAhOok42", password_confirmation: "OokAhOok42")
	chairbeing = User.create(name: "The Chairbeing", email: "chairbeing@cusfs.org.uk", password: "Amazeballs42", password_confirmation: "Amazeballs42")
	secretary = User.create( name: "The Secretary",  email: "secretary@cusfs.org.uk",  password: "Longsuffering42", password_confirmation: "Longsuffering42")
	ttba = User.create(      name: "The Editor",     email: "ttba@cusfs.org.uk",       password: "Jagrofess42", password_confirmation: "Jagrofess42")
	treasurer = User.create( name: "The Treasurer",  email: "treasurer@cusfs.org.uk",  password: "Smaug42", password_confirmation: "Smaug42")
	memsec = User.create(    name: "The Membership Secretary", email: "memsec@cusfs.org.uk", password: "Gatekeeper42", password_confirmation: "Gatekeeper42")
	reeve = User.create(     name: "The Reeve",      email: "reeve@cusfs.org.uk",      password: "Omnipotence42", password_confirmation: "Omnipotence42")

#  end
#end	