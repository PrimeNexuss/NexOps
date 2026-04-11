class Users::SessionsController < Devise::SessionsController
  layout 'auth'
  
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
  
  # DELETE /resource/sign_out
  def destroy
    super
  end
end
