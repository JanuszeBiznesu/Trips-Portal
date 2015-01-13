class Copy < ActiveRecord::Base
	belongs_to :book
  belongs_to :user
	validates :book_id,  presence: true
	validates :user_id, presence: true
	validates :text, presence: true
	validates :grade, presence: true

  private

  def year_of_print_not_in_future?
    if year_of_print > Date.today.year
      errors.add(:year_of_print, 'Wrong year of print') 
    end
  end

end
