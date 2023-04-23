class User::SessionsController < Devise::SessionsController
  before_action :reject_inactive_customer, only: [:create]
  
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  def reject_inactive_customer
    @user = User.find_by(email: params[:user][:email])
    if @user
      if @user.valid_password?(params[:user][:password]) && @user.is_deleted
        redirect_to new_user_session_path
      end
    end
  end
end