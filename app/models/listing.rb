class Listing < ActiveRecord::Base
	belongs_to :category
	belongs_to :subcategory
	belongs_to :user
	validates_presence_of :user_id
	validates_presence_of :title
	validates_presence_of :description
	validates_presence_of :city
	validates_presence_of :security
	validates_presence_of :price

	validate do |listing|
    	listing.errors[:base] << "Atleast one image is required. Upload Image below" if listing.listing_attachments.blank?
  	end

	has_many :listing_attachments, dependent: :destroy
    accepts_nested_attributes_for :listing_attachments, reject_if: proc{ |param| param[:avatar].blank? && param[:avatar_cache].blank? && param[:id].blank? }, allow_destroy: true

	has_many :reviews, dependent: :destroy

	has_many :notifications, dependent: :destroy

	geocoded_by :full_address
	after_validation :geocode

	def full_address
		[city, locality].join(', ')
	end

	def self.search_main(params)
		listings = Listing.where(nil)
	    listings = listings.where(category_id: params[:category].to_i) if params[:category].present?
	    listings = listings.where("title ILIKE ? or description ILIKE ?", "%#{params[:search_main]}%", "%#{params[:search_main]}%") if params[:search_main].present?
	    listings = listings.near(params[:location], 20) if params[:location].present?
	    listings
  	end
end