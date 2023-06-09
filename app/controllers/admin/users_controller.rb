class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:edit, :update]
  
  def index
    @users = User.all
  end
  
  def edit
  end

  def update
    @user.update(user_params)
    redirect_to admin_users_path
  end
  
  private
    
  def user_params
    params.require(:user).permit(:is_deleted)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end
