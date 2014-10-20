class GenresController < ApplicationController

	def index
		@genres = Genre.all
	end

	def show
		@genre = Genre.find(params[:id])
		@items = @genre.items
	end

end
