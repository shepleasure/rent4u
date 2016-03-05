class ReviewsController < ApplicationController

	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :find_listing
	before_action :authenticate_user!

	def new
		@review = 	Review.new
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.listing_id = @listing.id
		@listing_user = @listing.user

		if @review.save
			ReviewNotifier.send_review_email(@listing_user,@review.user.fullname, @review.listing.title).deliver
		    redirect_to @listing
		else
			flash[:alert] = @review.errors.full_messages.to_sentence
			render 'new'
		end
	end

	def edit
	end

	def update
		@review.update(review_params)
		redirect_to @listing
	end

	def destroy
		@review.destroy
		redirect_to listing_path(@listing)
	end

	private

	def review_params
		params.require(:review).permit(:rating, :comment, :title)
	end

	def find_review
		@review = Review.find(params[:id])
	end

	def find_listing
		@listing = Listing.find(params[:listing_id])
	end
end