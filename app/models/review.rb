class Review < ActiveRecord::Base

	belongs_to :user
	belongs_to :listing

	validates_presence_of :rating
	validates_presence_of :title

end
