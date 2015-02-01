class Trip < ActiveRecord::Base

  	include Tire::Model::Search
  	include Tire::Model::Callbacks
	mount_uploader :picture, PictureUploader
	has_many :comments, dependent: :destroy
	belongs_to :country
	belongs_to :user
	validates :title,  presence: true, length: { maximum: 50 }
	validates :user_id,  presence: true, length: { maximum: 50 }
	validates :text, presence:true
	validates :grade, presence:true
	validates :country_id, presence:true
	has_many :trip_attachments
	accepts_nested_attributes_for :trip_attachments
	def picture_changed?
		true
	end

end
Trip.index.delete
Trip.import
Trip.index.refresh