class Admin::ReviewsController < ApplicationController
  before_action :set_review
  
  def show
  end
  
  def destroy
    @review.delete
    redirect_to admin_index_path, notice: 'Review was successfully deleted.'
  end
  
  private
  
  def set_review
    @review = Review.find(params[:id])
  end
  
end
