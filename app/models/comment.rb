class Comment < ActiveRecord::Base

	belongs_to :trip
  	belongs_to :user
	validates :trip_id,  presence: true
	validates :user_id, presence: true
	validates :text, presence: true
	validates :grade, presence: true

end
