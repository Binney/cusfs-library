module ItemsHelper
	def cover_for item
		image_tag '404cover.jpg', alt: item.title, class: 'book_cover'
	end
end