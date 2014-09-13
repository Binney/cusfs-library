require 'csv'
namespace :import do
  desc "Import data from CSV files"
  task import_from_csv: :environment do

    filenames = ["tieins", "anthologies", "films", "graphicnovels", "nonfiction", "fiction"]
    filenames.each do |fn|
      File.open("public/#{fn}.csv", "r:ISO-8859-1").readlines.each do |line|
        CSV.parse(line) do |line|
          title, author, date, isbn, location, x, notes, status, xx, tag, seriesinfo, xxx, authcode, seriescode, bookcode, editioncode, xxxx, alphabet, xxxxx, T, A, D, L, I, tagged, marked = line

          if Item.exists?(title: title.to_s) && Item.find_by(title: title.to_s).author.name==author
            # There already exists a record for this item; we're looking at a duplicate.
            existing_book = Item.find_by(title: title.to_s, author_id: Author.find_by(name: author.to_s))
            if existing_book.editions.include?(String(editioncode))
              # The row you're trying to read is identical to an existing record - including the editioncode.
              if editioncode.blank?
                newcode = existing_book.editions[-1].next
                puts "Trying to upload a duplicate copy of #{title} with no edition code. Guessing the code is #{newcode}"
                File.open("upload_log.txt", "a+") { |f| f.write("Weird editioncode on #{title}; guessing editioncode to be #{newcode}") }
                existing_book.add_edition(newcode)
              else
                puts "Duplicate entry detected for #{title}. Are you trying to upload the same file twice?!"
                File.open("upload_log.txt", "a+") { |f| f.write("Suspected duplicate on #{title} edition #{editioncode}; skipping that record.") }
              end
            else
              # This is the nth copy of a book already in the database - fine. Append its editioncode to the existing record.
              existing_book.add_edition(editioncode)
            end

          else
            # This is a totally new record; create a new Item to hold it.
            extra = bookcode.blank? ? "-" : ""
            editioncode ||= "a"

            case location
            when "Main Collection"
              medium = Item::MEDIA[0] # "Fiction"
            when "Graphic Novels"
              medium = Item::MEDIA[1] # "GraphicNovel"
            when "Tie-In Novels"
              medium = Item::MEDIA[2] # "TieIn"
            when "Anthologies"
              medium = Item::MEDIA[3] # "Anthology"
            when "Nonfiction"
              medium = Item::MEDIA[4] # "NonFiction"
            when "Film"
              medium = Item::MEDIA[5] # "Film"
            when "Game"
              medium =  Item::MEDIA[6] # "Game"
            else # Default: fiction book.
              medium =  Item::MEDIA[0] # "Fiction"
            end

            new_item = Item.new(title: title, date: date, isbn: isbn, medium: medium, location: location,
                                notes: notes, status: status, tag: tag, editions: editioncode)

            unless bookcode.blank? || seriesinfo[seriesinfo.length-1]==String(bookcode)
              puts "Series information for #{new_item.title} doesn't seem to be consistent. Double check?"
              File.open("upload_log.txt", "a+") { |f| f.write("Series information for #{new_item.title} needs double checking") }
            end
            unless seriesinfo.eql?('-') || seriesinfo.blank?
              series_name = seriesinfo[0..seriesinfo.length-3].rstrip
              if Series.exists?(name: series_name)
                # Add book to existing series.
                series = Series.find_by(name: series_name)
              else
                # First book of a new series; create series too.
                series = Series.create(name: series_name)
              end
              new_item.series_id = series.id
              new_item.series_number = bookcode
            end

            unless author.blank?
              if Author.exists?(name: author)
                # Add book to existing series.
                writer = Author.find_by(name: author)
              else
                # First book of a new series; create series too.
                writer = Author.create(name: author)
              end
              new_item.author_id = writer.id
            end

            new_item.title = new_item.chop_articles_from_title

            if new_item.save
              puts "Added #{title} to the library!"
            else
              puts "Something went wrong trying to add #{title} to the library..."
            end

          end
        end
      end
    end
  end
end