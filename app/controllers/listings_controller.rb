class ListingsController < ApplicationController

	before_action :find_listing, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show, :search]


	def new
		@listing = 	Listing.new
	end

	def create
		@listing = Listing.new(listing_params)
		@listing.user = current_user

		if @listing.save
		    redirect_to @listing
		else
			flash[:alert] = @listing.errors.full_messages.to_sentence
			render 'new'
		end
	end

	def show
		@reviews = Review.where(listing_id: @listing.id).order("created_at DESC")

		if @reviews.blank?
      		@avg_review = 0
    	else
      		@avg_review = @reviews.average(:rating).round(2)
    	end
	end

	def edit
	end

	def update
		@listing.update(listing_params)
		redirect_to @listing
	end

	def destroy
		@listing.destroy
		redirect_to root_path
	end

	def search
		@listings = Listing.search(params).order("created_at DESC")
	end

	def mylistings
		@listings = Listing.where(user: current_user).order("created_at DESC")
	end

	private

	def listing_params
		params.require(:listing).permit(:title, :description, :city, :state, :locality, :category_id, :subcategory_id, listing_attachments_attributes: [:id, :avatar, :avatar_cache, :_destroy])
	end

	def find_listing
		@listing = Listing.find(params[:id])
	end

end