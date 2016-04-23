class ListingAttachment < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
    belongs_to :listing

    validates :avatar, file_size: { less_than: 5.megabytes,message: ' should be less than 5mb' }
end
