class TripAttachment < ActiveRecord::Base
   mount_uploader :avatar, AvatarUploader
   belongs_to :trip
end
