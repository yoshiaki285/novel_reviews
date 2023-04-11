class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book, primary_key: "isbn"
  
  enum status: { content: 0, spoiler: 1 }
  
end
