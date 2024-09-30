class Book < ApplicationRecord
  has_one_attached :book_image
  has_many :borrow_requests

  validates :title, presence: { message: "を入力してください。"}
  validates :author, presence: { message: "を入力してください。"}
  validates :pages, presence: { message: "を入力してください。"}
  validates :price, presence: { message: "を入力してください。"}
  validates :no_of_copies, presence: { message: "を入力してください。"}
  validates :publisher, presence: { message: "を入力してください。"}

  def self.search(search)
    if search 
      where("title LIKE :search OR author LIKE :search", search: "%#{search}%")
    else 
      all
    end

   end
end
