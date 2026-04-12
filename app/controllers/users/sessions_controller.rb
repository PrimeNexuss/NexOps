class Users::SessionsController < Devise::SessionsController
  layout 'auth'
  skip_before_action :verify_authenticity_token, only: [:create]
  
  # POST /resource/sign_in
  def create
    # Check for guest login (passwordless)
    if params[:user][:email] == 'demoguest@gmail.com' && params[:user][:password].blank?
      guest_user = User.authenticate_guest(params[:user][:email])
      if guest_user
        sign_in(guest_user)
        flash[:notice] = "Welcome! You're logged in as a guest with read-only access."
        redirect_to root_path
        return
      end
    end
    
    # Normal authentication flow
    super
  end
  
  # POST /guest_access
  skip_before_action :verify_authenticity_token, only: [:guest_access]
  
  def guest_access
    guest_user = User.find_by(email: 'demoguest@gmail.com')
    if guest_user && guest_user.guest_user?
      sign_in(guest_user)
      flash[:notice] = "Welcome! You're exploring as a guest with read-only access."
      redirect_to root_path
    else
      flash[:alert] = "Guest access is not available at this time."
      redirect_to new_user_session_path
    end
  end
  
  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out_all_scopes : sign_out(resource_name))
    set_flash_message! :notice, :signed_out
    yield if block_given?
    redirect_to landing_path
  end
end
