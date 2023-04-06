class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book, primary_key: "isbn"
  validates :rate, presence: true
end
