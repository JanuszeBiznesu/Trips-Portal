class Possession < ActiveRecord::Base
  belongs_to :borrower, class_name: "User"
  belongs_to :borrowed, class_name: "Copy"
  validates :borrower_id, presence: true
  validates :borrowed_id, presence: true
  default_scope -> { order(created_at: :asc) }

  def return_book(user, order)
    Possessions.find_by(borrowed_id: copy.id, borrower_id: user.id).destroy
  end
end
