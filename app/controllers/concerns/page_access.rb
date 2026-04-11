module PageAccess
  extend ActiveSupport::Concern

  private

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path, alert: "Please sign in to access this page."
    end
  end

  def authenticate_admin!
    unless user_signed_in? && current_user&.admin?
      redirect_to root_path, alert: "Access denied. Admin privileges required."
    end
  end

  def authenticate_operator!
    unless user_signed_in? && current_user&.operator_or_admin?
      redirect_to root_path, alert: "Access denied. Operator privileges required."
    end
  end

  def check_guest_access
    if user_signed_in? && current_user.guest_user?
      redirect_to root_path, alert: "Guest users have limited access."
    end
  end

  def redirect_based_on_role
    return unless user_signed_in?

    case current_user.role&.name
    when 'admin'
      # Admins can access everything
      nil
    when 'operator'
      # Operators can access most pages
      if request.path.starts_with?('/roles') || request.path.starts_with?('/audit_logs')
        flash[:alert] = "Access denied. Admin privileges required."
        redirect_to operations_path
      end
    when 'analyst'
      # Analysts have limited access
      restricted_paths = ['/roles', '/audit_logs', '/users']
      if restricted_paths.any? { |path| request.path.starts_with?(path) }
        flash[:alert] = "Access denied. Insufficient privileges."
        redirect_to operations_path
      end
    when 'guest'
      # Guests have read-only access
      restricted_paths = ['/roles', '/audit_logs', '/users', '/operations/new', '/operations/edit']
      if restricted_paths.any? { |path| request.path.starts_with?(path) }
        flash[:alert] = "Access denied. Guest users have read-only access."
        redirect_to operations_path
      end
    end
  end

  def set_page_title
    @page_title = case controller_name
    when 'operations'
      'Operations Management'
    when 'targets'
      'Target Discovery'
    when 'findings'
      'Finding Management'
    when 'reports'
      'Reports & Analytics'
    when 'analytics'
      'Analytics Dashboard'
    when 'roles'
      'User Roles'
    when 'audit_logs'
      'Audit Logs'
    when 'notifications'
      'Notifications'
    else
      'NexOps'
    end
  end

  def set_breadcrumb
    @breadcrumb = []
    
    # Add home
    @breadcrumb << { name: 'Dashboard', path: operations_path }
    
    # Add controller-specific breadcrumbs
    case controller_name
    when 'operations'
      if action_name == 'show'
        @breadcrumb << { name: 'Operation Details', path: nil }
      elsif action_name == 'new'
        @breadcrumb << { name: 'New Operation', path: nil }
      elsif action_name == 'edit'
        @breadcrumb << { name: 'Edit Operation', path: nil }
      end
    when 'targets'
      @breadcrumb << { name: 'Targets', path: targets_path }
    when 'findings'
      @breadcrumb << { name: 'Findings', path: findings_path }
    when 'reports'
      @breadcrumb << { name: 'Reports', path: reports_path }
    when 'analytics'
      @breadcrumb << { name: 'Analytics', path: analytics_dashboard_path }
    when 'roles'
      @breadcrumb << { name: 'User Roles', path: roles_path }
    when 'audit_logs'
      @breadcrumb << { name: 'Audit Logs', path: audit_logs_path }
    when 'notifications'
      @breadcrumb << { name: 'Notifications', path: notifications_path }
    end
    
    @breadcrumb
  end
end
