class RolesController < ApplicationController
  before_action :require_admin
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  def index
    @roles = Role.includes(:users).order(:name)
    @total_users = User.count
  end

  # GET /roles/:id
  def show
    @users = @role.users.includes(:user_roles)
    @available_permissions = Role::PERMISSIONS
  end

  # GET /roles/new
  def new
    @role = Role.new
    @available_permissions = Role::PERMISSIONS
  end

  # POST /roles
  def create
    @role = Role.new(role_params)
    
    if @role.save
      redirect_to @role, notice: 'Role was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /roles/:id/edit
  def edit
    @available_permissions = Role::PERMISSIONS
  end

  # PATCH/PUT /roles/:id
  def update
    if @role.update(role_params)
      redirect_to @role, notice: 'Role was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /roles/:id
  def destroy
    if @role.users.any?
      redirect_to roles_path, alert: 'Cannot delete role with assigned users.'
    else
      @role.destroy
      redirect_to roles_path, notice: 'Role was successfully deleted.'
    end
  end

  # POST /roles/:id/assign_user
  def assign_user
    user = User.find(params[:user_id])
    user.assign_role(@role.name)
    redirect_to @role, notice: "User #{user.name} assigned to role #{@role.name}."
  end

  # DELETE /roles/:id/remove_user/:user_id
  def remove_user
    user = User.find(params[:user_id])
    user.remove_role(@role.name)
    redirect_to @role, notice: "User #{user.name} removed from role #{@role.name}."
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, permissions: [])
  end
end
