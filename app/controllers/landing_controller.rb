class LandingController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :configure_permitted_parameters, only: [:index]
  
  def index
    # Landing page - no authentication required
  end
end
