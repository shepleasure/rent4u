class ListingAttachment < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
    belongs_to :listing
end
