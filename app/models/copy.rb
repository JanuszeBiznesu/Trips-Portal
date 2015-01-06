class Copy < ActiveRecord::Base
	belongs_to :book
	validates :book_id,  presence: true
	has_many  :borrowed_relationships, class_name:  "Possession",
                                    foreign_key: "borrowed_id",
                                    dependent:   :destroy
    has_many :borrowers, through: :borrowed_relationships, source: :borrower
end
