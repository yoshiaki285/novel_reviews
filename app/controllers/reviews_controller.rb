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
    @review.user = current_user
    @review.book = @book
    binding.pry
    if @review.save
      redirect_to book_path(@book), notice: 'レビューを投稿しました。'
    else
      render 'new'
    end
  end

  
  private
  def review_params
    params.require(:review).permit(:review, :is_exploded, :book_id)
  end
end
