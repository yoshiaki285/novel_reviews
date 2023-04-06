class ReviewsController < ApplicationController
  def index
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to book_reviews_path(@review.book)
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:book_id, :rate, :review)
  end
end
