class Book < ActiveRecord::Base
	  mount_uploader :picture, PictureUploader
	  validates :title,  presence: true, length: { maximum: 50 }
	  validates :author,  presence: true, length: { maximum: 50 }
	  validates :year_of_print ,  presence: true
	  validates :synopsis, presence:true
end
