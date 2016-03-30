class CategoriesController < ApplicationController

	def index
		@categories = Category.all
		@book = @categories[0]
		@camera = @categories[1]
		@clothing = @categories[2]
		@computer = @categories[3]
		@electronic = @categories[4]
		@event = @categories[5]
		@medical = @categories[6]
		@musical = @categories[7]
		@realestate = @categories[8]
		@service = @categories[9]
		@sport = @categories[10]
		@vehicle = @categories[11]

		@listings = Listing.joins(:reviews, :listing_attachments).select("listings.*, avg(reviews.rating) as average_rating").group("listings.id").order("average_rating DESC").limit(3)
	end
    
	def show
		if params[:price].blank? || params[:price] == "new"
			@listings = Listing.where(category_id: params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
		elsif params[:price] == "high"
			@listings = Listing.where(category_id: params[:id]).order("price DESC").paginate(:page => params[:page], :per_page => 3)	
		elsif params[:price] == "low"
			@listings = Listing.where(category_id: params[:id]).order("price ASC").paginate(:page => params[:page], :per_page => 3)
		elsif params[:price] == "popular"
			@listings_def = Listing.where(category_id: params[:id])
			@listings = @listings_def.joins(:reviews, :listing_attachments).select("listings.*, avg(reviews.rating) as average_rating").group("listings.id").order("average_rating DESC").paginate(:page => params[:page], :per_page => 3)
		end	
		@category = Category.find(params[:id])

		@categories = Category.all
		@book = @categories[0]
		@camera = @categories[1]
		@clothing = @categories[2]
		@computer = @categories[3]
		@electronic = @categories[4]
		@event = @categories[5]
		@medical = @categories[6]
		@musical = @categories[7]
		@realestate = @categories[8]
		@service = @categories[9]
		@sport = @categories[10]
		@vehicle = @categories[11]
	end
end
