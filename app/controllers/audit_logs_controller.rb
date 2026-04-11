class AuditLogsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_audit_log, only: [:show]

  # GET /audit_logs
  def index
    @query = params[:q]
    @filters = {
      user_id: params[:user_id],
      action: params[:action],
      resource_type: params[:resource_type],
      date_from: params[:date_from],
      date_to: params[:date_to]
    }
    
    @audit_logs = AuditLog.search(@query, @filters).recent.limit(100)
    @total_logs = @audit_logs.count
    @activity_summary = AuditLog.activity_summary(7)
    @users = User.all.order(:name)
    @actions = AuditLog::ACTIONS
    @resource_types = AuditLog::RESOURCE_TYPES
  end

  # GET /audit_logs/:id
  def show
  end

  private

  def set_audit_log
    @audit_log = AuditLog.find(params[:id])
  end
end
