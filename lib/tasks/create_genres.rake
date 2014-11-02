namespace :db do
  desc "Create genre tags"
  task create_genres: :environment do 

    Genre.create(name: "Epic_Fantasy")
    Genre.create(name: "Hard_Sci_Fi")
    Genre.create(name: "Space_Opera")
    Genre.create(name: "Steampunk")
    Genre.create(name: "Horror")
    Genre.create(name: "Cyberpunk")
    Genre.create(name: "New_Weird")

  end
end