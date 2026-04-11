class AnalyticsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_analytics_permission

  def dashboard
    # Time periods for analytics
    @time_periods = {
      '7d' => 7.days.ago,
      '30d' => 30.days.ago,
      '90d' => 90.days.ago,
      '1y' => 1.year.ago
    }
    
    @selected_period = params[:period] || '30d'
    @period_start = @time_periods[@selected_period]
    
    # Get data for the selected period
    @operations_data = get_operations_data(@period_start)
    @findings_data = get_findings_data(@period_start)
    @targets_data = get_targets_data(@period_start)
    @reports_data = get_reports_data(@period_start)
    @user_activity_data = get_user_activity_data(@period_start)
    
    # Calculate overall metrics
    @total_operations = current_user.operations.count
    @total_targets = current_user.targets.count
    @total_findings = current_user.findings.count
    @total_reports = current_user.reports.count
    
    # Security metrics
    @critical_findings = current_user.findings.where(severity: 'critical').count
    @high_findings = current_user.findings.where(severity: 'high').count
    @compromised_targets = current_user.targets.where(state_compromise: true).count
    @verified_findings = current_user.findings.where(verified: true).count
    
    # Recent activity
    @recent_operations = current_user.operations.where('operations.created_at >= ?', 7.days.ago).count
    @recent_findings = current_user.findings.where('findings.created_at >= ?', 7.days.ago).count
    @recent_reports = current_user.reports.where('reports.created_at >= ?', 7.days.ago).count
    
    # Trend data
    @operations_trend = get_trend_data('operations', @period_start)
    @findings_trend = get_trend_data('findings', @period_start)
    @severity_distribution = get_severity_distribution
    @resource_types = get_resource_types_distribution
  end

  private

  def get_operations_data(period_start)
    operations = current_user.operations.where('operations.created_at >= ?', period_start)
    {
      total: operations.count,
      active: operations.where(status: 'active').count,
      closed: operations.where(status: 'closed').count,
      by_month: operations.group_by_month(period_start),
      avg_duration: calculate_average_duration(operations)
    }
  end

  def get_findings_data(period_start)
    findings = current_user.findings.where('findings.created_at >= ?', period_start)
    {
      total: findings.count,
      critical: findings.where(severity: 'critical').count,
      high: findings.where(severity: 'high').count,
      medium: findings.where(severity: 'medium').count,
      low: findings.where(severity: 'low').count,
      verified: findings.where(verified: true).count,
      by_month: findings.group_by_month(period_start)
    }
  end

  def get_targets_data(period_start)
    targets = current_user.targets.joins(:operation).where('operations.created_at >= ?', period_start)
    {
      total: targets.count,
      compromised: targets.where(state_compromise: true).count,
      secure: targets.where(state_compromise: false).count,
      by_os: targets.group(:os).count
    }
  end

  def get_reports_data(period_start)
    reports = current_user.reports.where('reports.created_at >= ?', period_start)
    {
      total: reports.count,
      by_month: reports.group_by_month(period_start)
    }
  end

  def get_user_activity_data(period_start)
    audit_logs = current_user.audit_logs.where('audit_logs.created_at >= ?', period_start)
    {
      total_actions: audit_logs.count,
      actions_by_type: audit_logs.group(:action).count,
      daily_activity: audit_logs.group_by_day(period_start)
    }
  end

  def get_trend_data(resource_type, period_start)
    case resource_type
    when 'operations'
      current_user.operations.where('operations.created_at >= ?', period_start)
        .group_by_day(period_start)
    when 'findings'
      current_user.findings.where('findings.created_at >= ?', period_start)
        .group_by_day(period_start)
    end
  end

  def get_severity_distribution
    findings = current_user.findings
    {
      critical: findings.where(severity: 'critical').count,
      high: findings.where(severity: 'high').count,
      medium: findings.where(severity: 'medium').count,
      low: findings.where(severity: 'low').count
    }
  end

  def get_resource_types_distribution
    {
      operations: current_user.operations.count,
      targets: current_user.targets.count,
      findings: current_user.findings.count,
      reports: current_user.reports.count
    }
  end

  def calculate_average_duration(operations)
    completed_operations = operations.where.not(end_date: nil)
    return 0 if completed_operations.empty?
    
    total_days = completed_operations.sum do |op|
      (op.end_date - op.start_date).to_i
    end
    (total_days / completed_operations.count).round(1)
  end

  private

  def require_analytics_permission
    # Analytics is available to users with read permissions on any resource
    has_any_permission = current_user.has_permission?('read_operations') ||
                        current_user.has_permission?('read_targets') ||
                        current_user.has_permission?('read_findings') ||
                        current_user.has_permission?('read_reports')
    
    redirect_to root_path, alert: "Access denied" unless has_any_permission
  end
end

# Add helper methods to ActiveRecord for grouping
class ActiveRecord::Relation
  def group_by_month(start_date)
    where('created_at >= ?', start_date)
      .group("DATE_TRUNC('month', created_at)")
      .count
  end

  def group_by_day(start_date)
    where('created_at >= ?', start_date)
      .group("DATE_TRUNC('day', created_at)")
      .count
  end
end
