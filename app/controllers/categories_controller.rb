class CategoriesController < ApplicationController

	def index
		set_meta_tags title: 'Rent Items', 
					  description: "The place where you can earn or save money by renting. Mrentz Home page."

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

		@listings = Listing.joins(:reviews, :listing_attachments).select("listings.*, avg(reviews.rating) as average_rating").group("listings.id").order("average_rating DESC").limit(6)
		@new_listings = Listing.order("created_at DESC").limit(6)

	end
    
	def show
        set_meta_tags description: "Mrentz Catogories page."
		@category = Category.find_by(name: params[:name])
		@category_id = @category.id

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

		if params[:subcategory].blank? || params[:subcategory] == "all"
			@new_listings = Listing.where(category_id: @category_id).order("created_at DESC").paginate(:page => params[:new_page], :per_page => 12)
			
			@high_listings = Listing.where(category_id: @category_id).order("total DESC").paginate(:page => params[:high_page], :per_page => 12)
			
			@low_listings = Listing.where(category_id: @category_id).order("total ASC").paginate(:page => params[:low_page], :per_page => 12)
			
			@listings_def = Listing.where(category_id: @category_id)
			@popular_listings = @listings_def.joins(:reviews, :listing_attachments).select("listings.*, avg(reviews.rating) as average_rating").group("listings.id").order("average_rating DESC").paginate(:page => params[:popular_page], :per_page => 12)

		else
			@subcategory_id = Subcategory.find_by(name: params[:subcategory]).id
			
			@new_listings = Listing.where(category_id: @category_id).where(subcategory_id: @subcategory_id).order("created_at DESC").paginate(:page => params[:new_page], :per_page => 12)
			
			@high_listings = Listing.where(category_id: @category_id).where(subcategory_id: @subcategory_id).order("total DESC").paginate(:page => params[:high_page], :per_page => 12)
			
			@low_listings = Listing.where(category_id: @category_id).where(subcategory_id: @subcategory_id).order("total ASC").paginate(:page => params[:low_page], :per_page => 12)
			
			@listings_def = Listing.where(category_id: @category_id).where(subcategory_id: @subcategory_id)
			@popular_listings = @listings_def.joins(:reviews, :listing_attachments).select("listings.*, avg(reviews.rating) as average_rating").group("listings.id").order("average_rating DESC").paginate(:page => params[:popular_page], :per_page => 12)
		end
	
	end

	def rated
		set_meta_tags title: 'Top rated Items', 
					  description: "Mrentz top rated items page."
		@all = Category.all
		if params[:category].blank? || params[:category] == "all"
			@listings = Listing.joins(:reviews, :listing_attachments).select("listings.*, avg(reviews.rating) as average_rating").group("listings.id").order("average_rating DESC").paginate(:page => params[:page], :per_page => 12)
		else
			@category = Category.find_by(name: params[:category])
			@category_id = @category.id
			@listings_def = Listing.where(category_id: @category_id)
			@listings = @listings_def.joins(:reviews, :listing_attachments).select("listings.*, avg(reviews.rating) as average_rating").group("listings.id").order("average_rating DESC").paginate(:page => params[:page], :per_page => 12)
		end
	end

	def new_items
		set_meta_tags title: 'New Items', 
					  description: "Mrentz new items page."
		@all = Category.all
		if params[:category].blank? || params[:category] == "all"
			@listings = Listing.order("created_at DESC").paginate(:page => params[:page], :per_page => 12)
		else
			@category = Category.find_by(name: params[:category])
			@category_id = @category.id
			
			@listings = Listing.where(category_id: @category_id).order("created_at DESC").paginate(:page => params[:page], :per_page => 12)

		end
	end

end
