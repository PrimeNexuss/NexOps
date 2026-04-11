class FindingsController < ApplicationController
  before_action :set_finding, only: [:show, :edit, :update, :destroy, :update_severity, :attach_evidence, :mark_verified]
  before_action :set_target, only: [:new, :create]
  before_action :require_read_findings_permission, only: [:index, :show]
  before_action :require_create_findings_permission, only: [:new, :create]
  before_action :require_update_findings_permission, only: [:edit, :update, :update_severity]
  before_action :require_delete_findings_permission, only: [:destroy]
  before_action :require_verify_findings_permission, only: [:mark_verified, :attach_evidence]

  # GET /findings
  def index
    @findings = current_user.findings.includes(:target, :operation, :evidence).order(created_at: :desc)
    @total_findings = @findings.count
    @critical_findings = @findings.where(severity: 'critical').count
    @verified_findings = @findings.where(verified: true).count
  end

  # GET /findings/new
  def new
    @finding = @target.findings.new
  end

  # POST /findings
  def create
    @finding = @target.findings.build(finding_params)
    if @finding.save
      # Create notification
      Notification.create_for_user(
        current_user,
        title: 'New Finding Added',
        message: "Finding '#{@finding.title}' added to target #{@target.host_name}",
        type: 'warning'
      )
      redirect_to @target, notice: 'Finding was successfully added.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /findings/:id
  def show
    @evidences = @finding.evidences.order(created_at: :desc)
    @target = @finding.target
    @operation = @finding.operation
  end

  # GET /findings/:id/edit
  def edit
  end

  # PATCH/PUT /findings/:id
  def update
    if @finding.update(finding_params)
      redirect_to @finding, notice: 'Finding was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /findings/:id
  def destroy
    @target = @finding.target
    @finding.destroy
    redirect_to @target, notice: 'Finding was successfully deleted.'
  end

  # PATCH /findings/:id/update_severity
  def update_severity
    if @finding.update(severity: params[:severity])
      redirect_to @finding, notice: 'Severity was successfully updated.'
    else
      redirect_to @finding, alert: 'Unable to update severity.'
    end
  end

  # POST /findings/:id/attach_evidence
  def attach_evidence
    @evidence = @finding.evidences.build(evidence_params)
    if @evidence.save
      redirect_to @finding, notice: 'Evidence was successfully attached.'
    else
      redirect_to @finding, alert: 'Unable to attach evidence.'
    end
  end

  # PATCH /findings/:id/mark_verified
  def mark_verified
    if @finding.update(verified: true)
      redirect_to @finding, notice: 'Finding was successfully marked as verified.'
    else
      redirect_to @finding, alert: 'Unable to mark finding as verified.'
    end
  end

  private

  def set_finding
    @finding = current_user.findings.find(params[:id])
  end

  def set_target
    @target = current_user.targets.find(params[:target_id])
  end

  def finding_params
    params.require(:finding).permit(:title, :description, :severity, :tool_id, :verified, :recommendation)
  end

  def evidence_params
    params.require(:evidence).permit(:file_path)
  end

  # Permission methods
  def require_read_findings_permission
    redirect_to root_path, alert: "Access denied" unless current_user.has_permission?('read_findings')
  end

  def require_create_findings_permission
    redirect_to root_path, alert: "Access denied" unless current_user.has_permission?('create_findings')
  end

  def require_update_findings_permission
    redirect_to root_path, alert: "Access denied" unless current_user.has_permission?('update_findings')
  end

  def require_delete_findings_permission
    redirect_to root_path, alert: "Access denied" unless current_user.has_permission?('delete_findings')
  end

  def require_verify_findings_permission
    redirect_to root_path, alert: "Access denied" unless current_user.has_permission?('verify_findings')
  end
end
