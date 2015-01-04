class Book < ActiveRecord::Base
	  mount_uploader :picture, PictureUploader
	  validates :title,  presence: true, length: { maximum: 50 }
	  validates :author,  presence: true, length: { maximum: 50 }
	  validates :year_of_print ,  presence: true
	  validates :synopsis, presence:true
	  validates :amount, numericality: { greater_than_or_equal_to: 0}
	  has_many  :borrowed_relationships, class_name:  "Possession",
                                    foreign_key: "borrowed_id",
                                    dependent:   :destroy
      has_many :borrowers, through: :borrowed_relationships, source: :borrower
end
