class User::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i[update destroy]
  
  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end
  
  def after_sign_up_path_for(resource)
    user_path
  end
  
  def update
    @user = current_user
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.update_with_password(user_params)
      bypass_sign_in(@user)
      redirect_to user_path, notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
    
end