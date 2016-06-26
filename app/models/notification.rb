class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :notified_by, class_name: 'User'  
  belongs_to :listing

  validates :user_id, :notified_by_id, :listing_id, :identifier, :notice_type, presence: true

  	def self.unread
	  where(:read => false)
	end

end
