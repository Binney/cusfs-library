require 'csv'
require "#{Rails.root}/app/helpers/items_helper"
include ItemsHelper
namespace :import do
  desc "Import data from CSV files"
  task :csv, [:filename]  => :environment  do |t, args|
    args.with_defaults(:filename => "library.csv")

    File.open("public/#{args.filename}", "r:ISO-8859-1").readlines.each do |line|
      CSV.parse(line) do |line|
        title, author, date, isbn, tag, location, seriesinfo, authcode, seriescode, bookcode = line
        # Remove "the", "a", and "an" from the start of item titles so they are listed alphabetically by first non-article word.
        # e.g. "A Game of Thrones" => "Game of Thrones, A"
        if title[0..1]=="A " || title[0..1]=="a "
          title[2..title.length] + ", A"
        elsif title[0..2]=="An " || title[0..2]=="an "
          title[3..title.length] + ", An"
        elsif title[0..3]=="The " || title[0..3]=="the "
          title[4..title.length] + ", The"
        else
          title
        end
        notes = ""
        status = ""
        editioncode = ""

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
          editioncode = "a"

          case location.to_s.upcase
          when "MAIN COLLECTION"
            medium = Item::MEDIA[0] # "Fiction"
          when "GRAPHIC NOVELS"
            medium = Item::MEDIA[1] # "GraphicNovel"
          when "TIE-IN NOVELS"
            medium = Item::MEDIA[2] # "TieIn"
          when "ANTHOLOGIES"
            medium = Item::MEDIA[3] # "Anthology"
          when "NONFICTION"
            medium = Item::MEDIA[4] # "NonFiction"
          when "FILM"
            medium = Item::MEDIA[5] # "Film"
          when "GAME"
            medium =  Item::MEDIA[6] # "Game"
          else # Default: fiction book.
            medium =  Item::MEDIA[0] # "Fiction"
          end

          description = ""
          if isbn.blank? || date.blank?
            begin
              book = GoogleBooks.search("#{title} #{author}").first
              date ||= book.published_date
              isbn ||= book.isbn
              description = book.description
              puts "#{title} date is #{date} and isbn is #{isbn}"
            rescue
              puts "Couldn't find date or isbn for #{title}"
            end
          end

          if isbn.blank? || isbn=="?"
            cover_url = '404cover.png'
          else
            cover_url =" http://covers.openlibrary.org/b/isbn/#{isbn}-L.jpg"
          end

          new_item = Item.new(title: title, date: date, isbn: isbn, medium: medium, location: location, description: description,
                              notes: notes, status: status, tag: tag, editions: editioncode, cover_url: cover_url)

          unless bookcode.blank? || seriesinfo[seriesinfo.length-1]==String(bookcode)
            puts "Series information for #{new_item.title} doesn't seem to be consistent. Double check?"
            File.open("upload_log.txt", "a+") { |f| f.write("Series information for #{new_item.title} needs double checking") }
          end

          unless seriesinfo.eql?('-') || seriesinfo.blank?
            puts "Finding series information for #{title} which ought to be #{seriesinfo}"
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