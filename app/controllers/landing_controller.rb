class LandingController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :configure_permitted_parameters, only: [:index]
  
  def index
    # Landing page - no authentication required
    render plain: "NexOps Landing Page\n\nVisit http://localhost:3000/users/sign_in to try the demo!\n\nClick 'Explore as Guest' for instant access."
  end
end
