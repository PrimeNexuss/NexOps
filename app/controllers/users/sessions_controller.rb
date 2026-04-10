class Users::SessionsController < Devise::SessionsController
  layout 'auth'
  
  # POST /resource/sign_in
  def create
    super
  end
  
  # DELETE /resource/sign_out
  def destroy
    super
  end
end
