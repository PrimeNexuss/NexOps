class Api::V1::OperationsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_permission, only: [:index, :show]
  before_action :authorize_permission, only: [:create], permission: 'create_operations'
  before_action :authorize_permission, only: [:update], permission: 'update_operations'
  before_action :authorize_permission, only: [:destroy], permission: 'delete_operations'
  before_action :set_operation, only: [:show, :update, :destroy]

  # GET /api/v1/operations
  def index
    @operations = current_user.operations.includes(:targets, :findings, :reports).order(created_at: :desc)
    
    render json: {
      operations: @operations.map do |op|
        {
          id: op.id,
          name: op.name,
          scope: op.scope,
          status: op.status,
          start_date: op.start_date,
          end_date: op.end_date,
          targets_count: op.targets.count,
          findings_count: op.findings.count,
          reports_count: op.reports.count,
          created_at: op.created_at,
          updated_at: op.updated_at
        }
      end,
      meta: {
        total: @operations.count,
        page: 1,
        per_page: @operations.count
      }
    }
  end

  # GET /api/v1/operations/:id
  def show
    render json: {
      id: @operation.id,
      name: @operation.name,
      scope: @operation.scope,
      status: @operation.status,
      start_date: @operation.start_date,
      end_date: @operation.end_date,
      targets: @operation.targets.map do |target|
        {
          id: target.id,
          host_name: target.host_name,
          ip_address: target.ip_address,
          os: target.os,
          state_compromise: target.state_compromise,
          findings_count: target.findings.count
        }
      end,
      findings: @operation.findings.map do |finding|
        {
          id: finding.id,
          title: finding.title,
          description: finding.description,
          severity: finding.severity,
          verified: finding.verified,
          target_id: finding.target_id,
          created_at: finding.created_at
        }
      end,
      created_at: @operation.created_at,
      updated_at: @operation.updated_at
    }
  end

  # POST /api/v1/operations
  def create
    @operation = current_user.operations.new(operation_params)
    
    if @operation.save
      render json: {
        id: @operation.id,
        name: @operation.name,
        scope: @operation.scope,
        status: @operation.status,
        start_date: @operation.start_date,
        end_date: @operation.end_date,
        created_at: @operation.created_at
      }, status: :created
    else
      render json: { 
        errors: @operation.errors.full_messages 
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/operations/:id
  def update
    if @operation.update(operation_params)
      render json: {
        id: @operation.id,
        name: @operation.name,
        scope: @operation.scope,
        status: @operation.status,
        start_date: @operation.start_date,
        end_date: @operation.end_date,
        updated_at: @operation.updated_at
      }
    else
      render json: { 
        errors: @operation.errors.full_messages 
      }, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/operations/:id
  def destroy
    @operation.destroy
    head :no_content
  end

  private

  def set_operation
    @operation = current_user.operations.find(params[:id])
  end

  def operation_params
    params.require(:operation).permit(:name, :scope, :start_date, :end_date, :status)
  end
end
