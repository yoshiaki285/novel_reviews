class Admin::CommentsController < ApplicationController
  
  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review
    if @comment.present? && @review.present?
      @comment.destroy
      redirect_to admin_review_path(@review.id), notice: 'Review was successfully deleted.'
    else
      redirect_to admin_review_path(@review.id), notice: 'Comment was not found.'
    end
  end
end
