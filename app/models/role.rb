class Role < ApplicationRecord
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles
  
  validates :name, presence: true, uniqueness: true
  validates :permissions, presence: true
  
  serialize :permissions, coder: JSON
  
  # Define available permissions
  PERMISSIONS = %w[
    read_operations
    create_operations
    update_operations
    delete_operations
    close_operations
    read_targets
    create_targets
    update_targets
    delete_targets
    scan_targets
    read_findings
    create_findings
    update_findings
    delete_findings
    verify_findings
    read_reports
    create_reports
    delete_reports
    export_reports
    manage_users
    manage_roles
    view_audit_logs
    system_admin
  ].freeze
  
  # Default roles
  def self.create_default_roles
    roles_data = [
      {
        name: 'admin',
        permissions: PERMISSIONS,
        description: 'Full system administrator access'
      },
      {
        name: 'operator',
        permissions: %w[
          read_operations create_operations update_operations close_operations
          read_targets create_targets update_targets delete_targets scan_targets
          read_findings create_findings update_findings delete_findings verify_findings
          read_reports create_reports delete_reports export_reports
        ],
        description: 'Security operator with full operational access'
      },
      {
        name: 'analyst',
        permissions: %w[
          read_operations
          read_targets
          read_findings create_findings update_findings verify_findings
          read_reports export_reports
        ],
        description: 'Security analyst with read and analysis access'
      },
      {
        name: 'guest',
        permissions: %w[
          read_operations
          read_targets
          read_findings
          read_reports
        ],
        description: 'Read-only access to all data'
      }
    ]
    
    roles_data.each do |role_data|
      find_or_create_by!(name: role_data[:name]) do |role|
        role.permissions = role_data[:permissions]
      end
    end
  end
  
  def has_permission?(permission)
    permissions.include?(permission.to_s) || permissions.include?('system_admin')
  end
  
  def permission_list
    permissions.map { |perm| perm.humanize }
  end
end
