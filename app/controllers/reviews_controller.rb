class ReviewsController < ApplicationController
  before_action :set_book
  before_action :set_review, only: [:edit, :update, :destroy]
  
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end
  
  def create
    @book = Book.find(params[:book_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.book = @book
    # binding.pry
    if @review.save
      redirect_to book_path(@book), notice: 'Review was successfully posted.'
    else
      render :new
    end
  end
  
  def index
    
  end
  
  def edit
    # ログインユーザーとレビューの投稿者が一致するかチェック
    # unless current_user == @review.user
    #   flash[:alert] = "You are not authorized to edit this review."
    #   redirect_to @review.book and return
    # end
  end
  
  def update
    if @review.update(review_params)
      redirect_to book_path(@book), notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end
  
  private
  
  def review_params
    params.require(:review).permit(:review, :is_exploded, :book_id)
  end
  
  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_review
    @review = @book.reviews.find(params[:id])
  end
end
