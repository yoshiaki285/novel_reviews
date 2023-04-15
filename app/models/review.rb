class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book, primary_key: "isbn"
  has_many :comments, dependent: :destroy
  
  validate :unique_user_review, on: :create
  
  private
  
  def unique_user_review
    if Review.exists?(user_id: user_id, book_id: book_id)
      errors.add(:base, 'You have already reviewed this book.')
    end
  end
end
