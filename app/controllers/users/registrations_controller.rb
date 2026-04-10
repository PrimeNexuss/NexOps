class Users::RegistrationsController < Devise::RegistrationsController
  layout 'auth'
  
  # POST /resource
  def create
    super
  end
  
  protected
  
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :terms_accepted, :newsletter_subscribed)
  end
  
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :newsletter_subscribed)
  end
end
