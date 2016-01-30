class CategoriesController < ApplicationController

	def index
		@categories = Category.all
		@baby = @categories[0]
		@book = @categories[1]
		@camera = @categories[2]
		@costume = @categories[3]
		@electronic = @categories[4]
		@event = @categories[5]
		@media = @categories[6]
		@medical = @categories[7]
		@musical = @categories[8]
		@realestate = @categories[9]
		@service = @categories[10]
		@sport = @categories[11]
		@vehicle = @categories[12]

		@listings = Listing.joins(:reviews, :listing_attachments).select("listings.*, avg(reviews.rating) as average_rating").group("listings.id").order("average_rating DESC").limit(3)
	end

	def show
		@listings = Listing.where(category_id: params[:id]).order("created_at DESC")
		@category = Category.find(params[:id])
	end
end
