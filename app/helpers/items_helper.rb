module ItemsHelper
	# TODO these three helpers should all search the internet for actual info, but for now here are some placeholders.
	def cover_for item
		image_tag '404cover.jpg', alt: item.title, class: 'book_cover', width: "200", height: "300"
	end

	def mini_cover_for item
		image_tag '404cover.jpg', alt: item.title, class: 'book_cover', width: "100", height: "150"
	end

	def blurb_for item
		"This book has a truly marvellous blurb, which this summary is too narrow to contain." + Faker::Lorem.paragraph(5)
	end
	
end