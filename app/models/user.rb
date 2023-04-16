class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_books, through: :bookmarks, source: :book
  
  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
  
  def reviewed?(book)
    reviews.exists?(book_id: book.id)
  end
  
  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
      user.name = "guest"
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now
    end
  end
end
