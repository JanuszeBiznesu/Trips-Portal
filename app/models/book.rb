class Book < ActiveRecord::Base
	  validates :title,  presence: true, length: { maximum: 50 }
	  validates :author,  presence: true, length: { maximum: 50 }
	  validates :date_of_print ,  presence: true
	  validates :synopsis, presence:true
	  validates :amount, numericality: { greater_than_or_equal_to: 0}
end
