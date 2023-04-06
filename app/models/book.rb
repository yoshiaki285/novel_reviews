class Book < ApplicationRecord
  self.primary_key = "isbn"
  has_many :reviews
  has_many :bookmarks
  
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
end
