class AuditLog < ApplicationRecord
  belongs_to :user
  
  validates :action, presence: true
  validates :resource_type, presence: true
  
  serialize :details, coder: JSON
  
  scope :recent, -> { order(created_at: :desc) }
  scope :for_user, ->(user) { where(user: user) }
  scope :by_action, ->(action) { where(action: action) }
  scope :by_resource, ->(resource_type, resource_id = nil) do
    where(resource_type: resource_type)
      .where(resource_id: resource_id) if resource_id
  end
  scope :today, -> { where('created_at >= ?', Date.current.beginning_of_day) }
  scope :this_week, -> { where('created_at >= ?', 1.week.ago) }
  
  # Actions that can be logged
  ACTIONS = %w[
    create update delete login logout
    scan generate_report export_pdf
    assign_role remove_role
    mark_verified create_finding attach_evidence
  ].freeze
  
  # Resource types
  RESOURCE_TYPES = %w[
    Operation Target Finding Report User Role
    Notification Evidence Tool
  ].freeze
  
  def self.log(user, action, resource_type, resource_id = nil, details = {})
    create!(
      user: user,
      action: action.to_s,
      resource_type: resource_type.to_s,
      resource_id: resource_id,
      details: details,
      ip_address: details[:ip_address] || 'Unknown',
      user_agent: details[:user_agent] || 'Unknown'
    )
  end
  
  def self.log_action(user, action, resource, additional_details = {})
    details = {
      resource_name: resource.respond_to?(:name) ? resource.name : resource.to_s,
      **additional_details
    }
    
    log(user, action, resource.class.name, resource.id, details)
  end
  
  def resource
    return nil unless resource_type && resource_id
    resource_type.constantize.find_by(id: resource_id)
  end
  
  def action_description
    case action
    when 'create' then "Created #{resource_type}"
    when 'update' then "Updated #{resource_type}"
    when 'delete' then "Deleted #{resource_type}"
    when 'login' then "User logged in"
    when 'logout' then "User logged out"
    when 'scan' then "Scanned #{resource_type}"
    when 'generate_report' then "Generated report for #{resource_type}"
    when 'export_pdf' then "Exported PDF for #{resource_type}"
    when 'assign_role' then "Assigned role to user"
    when 'remove_role' then "Removed role from user"
    when 'mark_verified' then "Marked #{resource_type} as verified"
    when 'create_finding' then "Created security finding"
    when 'attach_evidence' then "Attached evidence to #{resource_type}"
    else "#{action.humanize} #{resource_type}"
    end
  end
  
  def self.search(query, filters = {})
    logs = all.includes(:user)
    
    # Text search
    if query.present?
      logs = logs.where(
        "action ILIKE ? OR resource_type ILIKE ? OR details::text ILIKE ?",
        "%#{query}%", "%#{query}%", "%#{query}%"
      )
    end
    
    # Apply filters
    logs = logs.where(user_id: filters[:user_id]) if filters[:user_id].present?
    logs = logs.where(action: filters[:action]) if filters[:action].present?
    logs = logs.where(resource_type: filters[:resource_type]) if filters[:resource_type].present?
    logs = logs.where('created_at >= ?', filters[:date_from]) if filters[:date_from].present?
    logs = logs.where('created_at <= ?', filters[:date_to]) if filters[:date_to].present?
    
    logs
  end
  
  def self.activity_summary(days = 7)
    since_date = days.days.ago
    where('created_at >= ?', since_date)
      .group(:action)
      .count
  end
end
