class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book, primary_key: "isbn"
  
  validate :unique_user_review, on: :create
  
  private
  
  def unique_user_review
    if Review.exists?(user_id: user_id, book_id: book_id)
      errors.add(:base, 'You have already reviewed this book.')
    end
  end
end
