require 'csv'
namespace :import do
  desc "Import data from CSV files"
  task import_from_csv: :environment do

    File.open("public/catalogue.csv").readlines.each do |line|
      CSV.parse(line) do |line|
        title, author, date, isbn, location, x, notes, status, xx, tag, seriesinfo, xxx, authcode, seriescode, bookcode, editioncode, xxxx, alphabet, xxxxx, T, A, D, L, I, tagged, marked = line

        if Item.exists?(title: title.to_s, author: author.to_s)
          # There already exists a record for this item; we're looking at a duplicate.
          existing_book = Item.find_by(title: title.to_s, author: author.to_s)
          if existing_book.editions.include?(String(editioncode))
            # The row you're trying to read is identical to an existing record - down to the code. Maybe you're trying to upload the same file twice? At any rate, don't add another entry.
            puts "Duplicate entry detected. Are you trying to upload the same file twice?"
          else
            # This is the nth copy of a book already in the database - fine. Append its editioncode to the existing record.
            existing_book.update_attribute(:editions, existing_book.editions + editioncode)
          end

        else
          # This is a totally new record; create a new Item to hold it.
          extra = bookcode.blank? ? "-" : ""
          tag = "#{authcode}/#{seriescode}#{extra}#{bookcode}"
          editioncode ||= "a"
          medium ||= "Book"

          new_item = Item.new(title: title, author: author, date: date, isbn: isbn, location: location,
                              notes: notes, status: status, tag: tag, editions: editioncode)

          unless bookcode.blank? || seriesinfo[seriesinfo.length-1]==String(bookcode)
            puts "Series information for #{new_item.title} doesn't seem to be consistent. Double check?"
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