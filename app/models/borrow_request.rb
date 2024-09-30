class BorrowRequest < ApplicationRecord
  belongs_to :user
  belongs_to :book

  # validates :book_id, presence: true
  validates :borrow_date, presence:true
  validates :due_date, presence: true
end
