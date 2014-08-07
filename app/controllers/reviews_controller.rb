class ReviewsController < ApplicationController
	before_action :sign_in_user, only: [:create]

	def create
		@review = current_user.reviews.build(review_params)
		if @review.save
			flash[:success] = "Review submitted for review. It'll appear online soon!"
			# todo find subject of review, eg item or author or series
			if !(@review.item_id.nil?)
				redirect_to Item.find(@review.item_id)
			elsif !(@review.author_id.nil?)
				redirect_to Author.find(@review.author_id)
			elsif !(@review.series_id.nil?)
				redirect_to Series.find(@review.series_id)
			else
				redirect_to reviews_user_path(current_user)
			end
		else
		  render Item.find(@review.item_id)
		end
	end

	def destroy

	end

	private

		def review_params
			params.require(:review).permit(:title, :content, :rating, :item_id, :series_id, :author_id)
		end

end
