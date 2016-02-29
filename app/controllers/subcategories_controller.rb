class SubcategoriesController < ApplicationController

	def show
		if params[:price].blank? || params[:price] == "new"
			@listings = Listing.where(subcategory_id: params[:id]).order("created_at DESC").paginate(:page => params[:page], :per_page => 3)
		elsif params[:price] == "high"
			@listings = Listing.where(subcategory_id: params[:id]).order("price DESC").paginate(:page => params[:page], :per_page => 3)	
		elsif params[:price] == "low"
			@listings = Listing.where(subcategory_id: params[:id]).order("price ASC").paginate(:page => params[:page], :per_page => 3)
		elsif params[:price] == "popular"
			@listings_def = Listing.where(subcategory_id: params[:id])
			@listings = @listings_def.joins(:reviews, :listing_attachments).select("listings.*, avg(reviews.rating) as average_rating").group("listings.id").order("average_rating DESC").paginate(:page => params[:page], :per_page => 3)
		end	
		@category = Category.find(params[:category_id])
		@subcategory = Subcategory.find(params[:id])
	end

	def find_by_category
		category = Category.find(params[:category_id])
		subcategories = category.subcategories.find_all
		render json: { subcategories: subcategories}
	end
end