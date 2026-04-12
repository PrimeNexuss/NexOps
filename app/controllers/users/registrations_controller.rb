class Users::RegistrationsController < Devise::RegistrationsController
  layout 'auth'
  skip_before_action :verify_authenticity_token, only: [:create]
  
  # POST /resource
  def create
    super
    # Assign role after user is created
    if resource.persisted? && params[:role_name].present?
      role = Role.find_by(name: params[:role_name])
      resource.assign_role(role.name) if role
    end
  end
  
  protected
  
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :terms_accepted, :newsletter_subscribed)
  end
  
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :newsletter_subscribed)
  end
end
