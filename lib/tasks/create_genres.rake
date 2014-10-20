namespace :db do
  desc "Google all books without descriptions and find a suitable blurb"
  task create_genres: :environment do 

    Genre.create(name: "Epic_Fantasy")
    Genre.create(name: "Hard_Sci_Fi")
    Genre.create(name: "Space_Opera")
    Genre.create(name: "Steampunk")
    Genre.create(name: "Horror")
    Genre.create(name: "Cyberpunk")
    Genre.create(name: "New Weird")

  end
end