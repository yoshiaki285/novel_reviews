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
    
end