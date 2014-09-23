namespace :db do
  desc "Google all books without descriptions and find a suitable blurb"
  task google_blurbs: :environment do
      Item.all.each do |item|
        if item.description.blank?
          begin
            book = GoogleBooks.search(item.title).first
            descript = book.description.to_s
            item.update_attribute(:description, descript)
            puts "#{item.title} description updated to #{descript}"
          rescue
            puts "Couldn't find description for #{item.title}"
          end
        end
      end

  end
end