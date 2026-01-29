class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :destroy]
  before_action :set_operation, only: [:create]

  # Add target to operation
  def create
    @target = @operation.targets.build(target_params)
    if @target.save
      redirect_to @operation, notice: 'Target was successfully added to operation.'
    else
      redirect_to @operation, alert: 'Unable to add target to operation.'
    end
  end

  # View target details
  def show
    @operation = @target.operation
    @findings = @target.findings
  end

  # Remove target from operation
  def destroy
    @operation = @target.operation
    if @target.destroy
      redirect_to @operation, notice: 'Target was successfully removed.'
    else
      redirect_to @operation, alert: 'Unable to remove target.'
    end
  end

  private

  def set_target
    @target = Target.find(params[:id])
  end

  def set_operation
    @operation = Operation.find(params[:operation_id])
  end

  def target_params
    params.require(:target).permit(:host_name, :ip_address)
  end
end
