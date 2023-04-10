class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end
  
  def index
    
  end
  
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.book_id = @book.isbn
    @review.save
    # binding.pry
    redirect_to book_path(@book)
  end
  
  private
  def review_params
    params.require(:review).permit(:book_id, :review)
  end
end
