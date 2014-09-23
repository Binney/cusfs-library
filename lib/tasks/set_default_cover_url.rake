namespace :db do
  desc "Set all cover urls to default."
  task set_default_cover_url: :environment do
      Item.all.each do |item|
        if item.cover_url=='404cover.jpg'
          url = '404cover.png'
          puts "Updating cover for #{item.title}"
          item.update_attribute(:cover_url, url)
        end
      end
  end
end