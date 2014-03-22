namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    99.times do |n|
      title  = Faker::Company.bs
      author = Faker::Name.name
      notes = Faker::Lorem.sentence

      Item.create!(title: title,
                   author: author,
                   notes: notes,
                   date: 1963)
    end
  end
end