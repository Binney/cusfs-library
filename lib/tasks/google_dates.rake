namespace :db do
  desc "Google all books without isbns or dates and find a suitable blurb"
  task :google_dates, [:starting]  => :environment  do |t, args|
    args.with_defaults(:starting => 0)
    Item.all[args.starting.to_i..-1].each do |item|
      if item.description.blank? || item.isbn.blank? || item.date.blank? || item.isbn=="?" || item.date==0
        str = "#{item.title} #{item.author.name}"
        str = str.gsub(/[^0-9A-Za-z]/, ' ').downcase
        begin
          book = GoogleBooks.search(str).first
          date ||= book.published_date
          isbn ||= book.isbn
          description = book.description
          puts "#{item.title} date is #{date} and isbn is #{isbn}"

          if item.isbn.blank?
            item.update_attribute(:isbn, isbn)
          end
          if item.date.blank?
            item.update_attribute(:date, date)
          end
          if item.description.blank?
            item.update_attribute(:description, description)
          end

          puts "#{item.title} details updated to #{isbn}, #{date}"
        rescue
          puts "Couldn't find details for #{item.title}"
        end
      end
    end

  end
end