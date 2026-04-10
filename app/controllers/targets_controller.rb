class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update, :destroy]
  before_action :set_operation, only: [:create, :new]

  # GET /targets
  def index
    @targets = current_user.targets.includes(:operation, :findings).order(created_at: :desc)
    @total_targets = @targets.count
    @active_operations = @targets.joins(:operation).where(operations: { status: 'active' }).count
  end

  # GET /targets/new
  def new
    @target = @operation.targets.new
  end

  # POST /targets
  def create
    @target = @operation.targets.build(target_params)
    if @target.save
      # Create notification
      Notification.create_for_user(
        current_user,
        title: 'New Target Added',
        message: "Target #{@target.host_name} has been added to operation #{@target.operation.name}",
        type: 'success'
      )
      redirect_to @operation, notice: 'Target was successfully added to operation.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /targets/:id
  def show
    @operation = @target.operation
    @findings = @target.findings.includes(:evidence).order(created_at: :desc)
    @evidence = @target.evidence
  end

  # GET /targets/:id/edit
  def edit
  end

  # PATCH/PUT /targets/:id
  def update
    if @target.update(target_params)
      redirect_to @target, notice: 'Target was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /targets/:id
  def destroy
    @operation = @target.operation
    if @target.destroy
      redirect_to @operation, notice: 'Target was successfully removed.'
    else
      redirect_to @operation, alert: 'Unable to remove target.'
    end
  end

  # POST /targets/:id/scan
  def scan
    # Mock scan functionality - in real app, this would trigger actual scanning
    scan_result = {
      ports: [22, 80, 443, 3389],
      services: ['SSH', 'HTTP', 'HTTPS', 'RDP'],
      vulnerabilities: rand(0..5)
    }
    
    # Create a finding if vulnerabilities found
    if scan_result[:vulnerabilities] > 0
      @target.findings.create!(
        title: "Scan Results for #{@target.host_name}",
        description: "Found #{scan_result[:vulnerabilities]} potential vulnerabilities",
        severity: scan_result[:vulnerabilities] > 3 ? 'high' : 'medium'
      )
    end
    
    redirect_to @target, notice: "Scan completed. Found #{scan_result[:vulnerabilities]} potential vulnerabilities."
  end

  private

  def set_target
    @target = current_user.targets.find(params[:id])
  end

  def set_operation
    @operation = current_user.operations.find(params[:operation_id])
  end

  def target_params
    params.require(:target).permit(:host_name, :ip_address, :os, :notes, :state_compromise)
  end
end
