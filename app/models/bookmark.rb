class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  # 一人のユーザーにつき一回のブックマークとする
  validates_uniqueness_of :book_id, scope: :user_id
end
