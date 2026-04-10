class OperationsController < ApplicationController
  before_action :set_operation, only: [:show, :edit, :update, :destroy, :close, :generate_report]

  # GET /operations (dashboard)
  def index
    @operations = current_user.operations
    @total_operations = @operations.count
    @active_operations = @operations.where(status: 'active').count
    @total_findings = @operations.joins(:findings).count
    @critical_findings = @operations.joins(:findings).where(findings: { severity: 'critical' }).count
    
    @recent_operations = @operations.order(created_at: :desc).limit(5)
    @critical_findings_list = Finding.joins(:operation).where(operations: { user: current_user }, severity: 'critical').order(created_at: :desc).limit(5)
    
    # Mock recent activities - in a real app, this would come from a proper activity tracking system
    @recent_activities = [
      {
        title: "Operation '#{@recent_operations.first&.name}' created",
        description: "New security operation initiated",
        time: @recent_operations.first&.created_at&.strftime('%I:%M %p') || 'N/A'
      },
      {
        title: "Critical finding discovered",
        description: "SQL injection vulnerability found in web application",
        time: '2 hours ago'
      },
      {
        title: "Target added to operation",
        description: "New target scope added to penetration test",
        time: '4 hours ago'
      }
    ]
    
    render :dashboard
  end

  # GET /operations/new
  def new
    @operation = Operation.new
  end

  # POST /operations
  def create
    @operation = current_user.operations.new(operation_params)
    if @operation.save
      redirect_to @operation, notice: 'Operation was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /operations/:id
  def show
    @targets = @operation.targets
    @findings = @operation.findings
    @reports = @operation.reports
  end

  # GET /operations/:id/edit
  def edit
  end

  # PATCH/PUT /operations/:id
  def update
    if @operation.update(operation_params)
      redirect_to @operation, notice: 'Operation was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /operations/:id
  def destroy
    @operation.destroy
    redirect_to operations_path, notice: 'Operation was successfully deleted.'
  end

  # Close operation
  def close
    if @operation.update(status: 'closed')
      redirect_to @operation, notice: 'Operation was successfully closed.'
    else
      redirect_to @operation, alert: 'Unable to close operation.'
    end
  end

  # Generate report for operation
  def generate_report
    @report = @operation.reports.build
    if @report.save
      redirect_to @report, notice: 'Report was successfully generated.'
    else
      redirect_to @operation, alert: 'Unable to generate report.'
    end
  end

  private

  def set_operation
    @operation = Operation.find(params[:id])
  end

  def operation_params
    params.require(:operation).permit(:name, :scope, :start_date, :end_date, :status)
  end
end
