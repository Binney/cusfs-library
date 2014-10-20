module GenresHelper

	def icon_for genre
		image_tag "#{genre.title}.png", alt: genre.name, class: 'book_cover', width: "300", height: "300"
	end

	def mini_icon_for genre
		image_tag "#{genre.title}.png", alt: genre.name, class: 'book_cover', width: "150", height: "150"
	end

end
