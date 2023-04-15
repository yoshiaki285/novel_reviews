class CommentsController < ApplicationController
  
  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to book_review_path(@review.book, @review), notice: 'Comment was successfully posted.'
    else
      redirect_to book_review_path(@review.book, @review), alert: 'Failed to post comment'
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review
    @comment.destroy
    flash[:success] = "Comment was successfully deleted"
    redirect_to book_review_path(@review.book.isbn, @review.id)
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:comment, :is_exploded_c)
  end
  
end
