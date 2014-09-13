namespace :db do
  desc "Fill database with sample data"
  task delete_all_items: :environment do
    Item.all.each do |item|
      item.destroy
    end
    Author.all.each do |author|
      author.destroy
    end
    Series.all.each do |series|
      series.destroy
    end
  end
end