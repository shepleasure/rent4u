class Review < ActiveRecord::Base

	belongs_to :user
	belongs_to :listing

	validates_presence_of :rating
	validates_presence_of :title
	validates_uniqueness_of :user_id, :scope => :listing_id, :message=>"You can't review a product more than once", on: 'create'
end
