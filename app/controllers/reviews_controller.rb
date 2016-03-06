class ReviewsController < ApplicationController

	before_action :find_review, only: [:edit, :update, :destroy]
	before_action :find_listing
	before_action :authenticate_user!

	def new
		if current_user == @listing.user
			redirect_to @listing
		else
			@review = Review.where(user_id: current_user.id, listing_id: params[:listing_id]).first_or_initialize 
		    if @review.id.present? 
		    	flash[:alert] = "You can't review a product more than once. But you can edit your existing review"
		    	render 'edit' 
		    end 
		end 
	end

	def create
		@review = Review.new(review_params)
		@review.user_id = current_user.id
		@review.listing_id = @listing.id
		@listing_user = @listing.user

		if @review.save
			create_notification @listing, @review
			respond_to do |format|
		        format.html { redirect_to @listing }
		        format.js
		    end
			ReviewNotifier.send_review_email(@listing_user,@review.user.fullname, @review.listing.title).deliver
		else
			flash[:alert] = @review.errors.full_messages.to_sentence
			render 'new'
		end
	end

	def edit
	end

	def update
		@review.update(review_params)
		ReviewNotifier.send_edit_review_email(@listing.user,@review.user.fullname, @review.listing.title).deliver
		redirect_to @listing
	end

	def destroy
		@review.destroy
		redirect_to listing_path(@listing)
	end

	private

	def create_notification(listing, review)  
	    Notification.create(user_id: listing.user.id,
	                        notified_by_id: current_user.id,
	                        listing_id: listing.id,
	                        identifier: review.id,
	                        notice_type: 'review')
	end  

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