class Users::RegistrationsController < Devise::RegistrationsController
  layout 'auth'
  
  # POST /resource
  def create
    super
    # Assign role after user is created
    if resource.persisted? && params[:user][:role_id].present?
      role = Role.find(params[:user][:role_id])
      resource.assign_role(role.name) if role
    end
  end
  
  protected
  
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :terms_accepted, :newsletter_subscribed, :role_id)
  end
  
  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password, :newsletter_subscribed)
  end
end
