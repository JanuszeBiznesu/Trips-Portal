class Book < ActiveRecord::Base
	  mount_uploader :picture, PictureUploader
	  has_many :copy, dependent: :destroy
	  validates :title,  presence: true, length: { maximum: 50 }
	  validates :author,  presence: true, length: { maximum: 50 }
	  validates :synopsis, presence:true

end
