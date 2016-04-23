class ListingsController < ApplicationController

	before_action :find_listing, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index, :show, :search_main, :search]
	before_action :verified, only: [ :new ]


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

	def search_main
		if params[:price].blank? || params[:price] == "new"
			@listings = Listing.search_main(params).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
		elsif params[:price] == "high"
			@listings = Listing.search_main(params).order("price DESC").paginate(:page => params[:page], :per_page => 3)	
		elsif params[:price] == "low"
			@listings = Listing.search_main(params).order("price ASC").paginate(:page => params[:page], :per_page => 3)
		elsif params[:price] == "popular"
			@listings_def = Listing.search_main(params)
			@listings = @listings_def.joins(:reviews, :listing_attachments).select("listings.*, avg(reviews.rating) as average_rating").group("listings.id").order("average_rating DESC").paginate(:page => params[:page], :per_page => 3)
		end	
	end

	def mylistings
		if params[:price].blank? || params[:price] == "new"
			@listings = Listing.where(user: current_user).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
		elsif params[:price] == "high"
			@listings = Listing.where(user: current_user).order("price DESC").paginate(:page => params[:page], :per_page => 3)	
		elsif params[:price] == "low"
			@listings = Listing.where(user: current_user).order("price ASC").paginate(:page => params[:page], :per_page => 3)
		elsif params[:price] == "popular"
			@listings_def = Listing.where(user: current_user)
			@listings = @listings_def.joins(:reviews, :listing_attachments).select("listings.*, avg(reviews.rating) as average_rating").group("listings.id").order("average_rating DESC").paginate(:page => params[:page], :per_page => 3)
		end	
	end


	private

	def listing_params
		params.require(:listing).permit(:title, :description, :city, :locality, :price, :time, :category_id, :subcategory_id, :security, :terms, :delivery, :security_amount, listing_attachments_attributes: [:id, :avatar, :avatar_cache, :_destroy])
	end

	def find_listing
		@listing = Listing.find(params[:id])
	end

	def verified
		if current_user.needs_mobile_number_verifying? 
			redirect_to(verifications_path)
		end
	end

end