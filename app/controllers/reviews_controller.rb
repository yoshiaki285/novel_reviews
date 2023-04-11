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
    # binding.pry
    @review.user_id = current_user.id
    @review.book_id = @book.id
    @review.status = params[:review][:status].to_i if params[:review][:status].present?
    @review.save
    redirect_to book_path(@book)
  end
  
  private
  def review_params
    params.require(:review).permit(:book_id, :review, :status)
  end
end
