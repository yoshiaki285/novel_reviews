class User::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @reviews = current_user.reviews
  end
  
  def edit
    @user = current_user
  end
  
end
