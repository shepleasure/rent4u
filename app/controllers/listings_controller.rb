class ListingsController < ApplicationController

	before_action :find_listing, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show, :search]


	def new
		@listing = 	Listing.new
		@listing_attachment = @listing.listing_attachments.build
	end

	def create
		@listing = Listing.new(listing_params)
		@listing.user = current_user

		if @listing.save
			params[:listing_attachments]['avatar'].each do |a|
          		@listing_attachment = @listing.listing_attachments.create!(:avatar => a, :listing_id => @listing.id)
          end
		    redirect_to @listing
		else
			flash[:alert] = @listing.errors.full_messages.to_sentence
			render 'new'
		end
	end

	def show
		@listing_attachments = @listing.listing_attachments.all
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
		@listings = Listing.search(params)
	end

	def mylistings
		@listings = Listing.where(user: current_user)
	end

	private

	def listing_params
		params.require(:listing).permit(:title, :description, :city, :state, :locality, :category_id, :subcategory_id, listing_attachments_attributes: [:id, :listing_id, :avatar])
	end

	def find_listing
		@listing = Listing.find(params[:id])
	end

end