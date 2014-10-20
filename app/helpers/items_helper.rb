module ItemsHelper
	# TODO these three helpers should all search the internet for actual info, but for now here are some placeholders.
	def cover_for item
		image_tag item.cover_url, alt: item.pretty_name, class: 'book_cover', width: "200", height: "300"
	end

	def mini_cover_for item
		image_tag item.cover_url, alt: item.pretty_name, class: 'book_cover', width: "100", height: "150"
	end

	def blurb_for item
		item.description || "Couldn't find a description."
	end

	def chop_articles_from(title)
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
	end
	
end