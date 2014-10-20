namespace :db do
  desc "Google all books without descriptions and find a suitable blurb"
  task :google_blurbs, [:starting]  => :environment  do |t, args|
    args.with_defaults(:starting => 0)
    Item.all[args.starting.to_i..-1].each do |item|
      if item.description.blank?
        begin
          str = "#{item.title} #{item.author.name}"
          str = str.gsub(/[^0-9A-Za-z]/, ' ').downcase
          book = GoogleBooks.search(str).first
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