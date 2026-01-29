class OperationsController < ApplicationController
  before_action :set_operation, only: [:show, :close, :generate_report]

  # Create a new operation
  def create
    @operation = Operation.new(operation_params)
    if @operation.save
      redirect_to @operation, notice: 'Operation was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # View operation details
  def show
    @targets = @operation.targets
    @findings = @operation.findings
    @reports = @operation.reports
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
    params.require(:operation).permit(:name, :scope, :start_date, :end_date)
  end
end
