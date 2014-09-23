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
	
end