class LandingController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_before_action :configure_permitted_parameters, only: [:index]
  skip_before_action :redirect_based_on_role, only: [:index]
  
  def index
    # Landing page - no authentication required
    @page_title = 'NexOps - Security Operations Platform'
    @breadcrumb = [{ name: 'Home', path: root_path }]
  end
end
