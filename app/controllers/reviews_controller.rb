class ReviewsController < ApplicationController
	before_action :sign_in_user, only: [:create, :edit, :destroy]

	def create
		@review = current_user.reviews.build(review_params)
		if @review.save
			flash[:success] = "Review submitted for moderation. It'll appear online soon!"
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
		@review = Review.find(params[:id])
		@user = @review.user
		@review.destroy
		redirect_to reviews_user_path(@user)
	end

	def show
		@review = Review.find(params[:id])
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update_attributes(review_params)
			flash[:success] = "Updated review."
			redirect_to @review
		else
			render 'edit'
		end
	end

	def index
		@item_reviews = Review.where.not(item_id: nil)
		@author_reviews = Review.where.not(author_id: nil)
		@series_reviews = Review.where.not(series_id: nil)
		@reviews = Review.all.order(:created_at)
	end

	private

		def review_params
			params.require(:review).permit(:title, :content, :rating, :item_id, :series_id, :author_id)
		end

end
