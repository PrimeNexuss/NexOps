class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  # Include Devise and Pundit modules
  include Devise::Controllers::Helpers
  include Pundit::Authorization

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def authorize_permission(permission)
    unless current_user.has_permission?(permission)
      flash[:alert] = "You are not authorized to perform this action."
      redirect_back(fallback_location: root_path)
    end
  end

  def require_admin
    unless current_user.is_admin?
      flash[:alert] = "Admin access required."
      redirect_back(fallback_location: root_path)
    end
  end

  def require_operator
    unless current_user.is_operator?
      flash[:alert] = "Operator access required."
      redirect_back(fallback_location: root_path)
    end
  end

  def require_analyst
    unless current_user.is_analyst?
      flash[:alert] = "Analyst access required."
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :terms_accepted, :newsletter_subscribed])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :newsletter_subscribed])
  end
end
