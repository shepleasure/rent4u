class Listing < ActiveRecord::Base
	
	has_many   :attachments
	accepts_nested_attributes_for :attachments, :reject_if => proc { |attributes| attributes['image'].blank? }, :allow_destroy => true

	
	belongs_to :category
	belongs_to :subcategory
	belongs_to :user
	
	validates_presence_of :user_id
	validates_presence_of :title
	validates_presence_of :description
	validates_presence_of :city
	validates_presence_of :state

	geocoded_by :full_address
	after_validation :geocode

	def full_address
		[city, state, locality].join(', ')
	end

	def self.search(params)
    listings = Listing.where(category_id: params[:category].to_i)
    listings = listings.where("title LIKE ? or description LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    listings = listings.near(params[:location], 20) if params[:location].present?
    listings
  end
end