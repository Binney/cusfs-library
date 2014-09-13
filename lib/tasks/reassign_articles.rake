namespace :db do
  desc "Fill database with sample data"
  task reassign_articles: :environment do
    Item.all.each do |item|
      new_title = item.chop_articles_from_title
      if new_title != item.title
        puts "Changing #{item.title} title to #{new_title}"
      else
        puts "Not changing title of #{item.title}"
      end
      item.title = new_title
      if item.save
        puts "Succeeded!"
      else
        puts "Failed :("
      end
    end
  end
end