class SearchQuery < ApplicationRecord
  belongs_to :user
  
  validates :query, presence: true
  validates :search_type, presence: true, inclusion: { in: %w[global operations targets findings reports] }
  
  serialize :filters, coder: JSON
  
  scope :recent, -> { order(created_at: :desc) }
  scope :for_user, ->(user) { where(user: user) }
  
  def self.search(user, query, search_type = 'global', filters = {})
    results = []
    
    case search_type
    when 'global'
      results += search_operations(user, query, filters)
      results += search_targets(user, query, filters)
      results += search_findings(user, query, filters)
      results += search_reports(user, query, filters)
    when 'operations'
      results = search_operations(user, query, filters)
    when 'targets'
      results = search_targets(user, query, filters)
    when 'findings'
      results = search_findings(user, query, filters)
    when 'reports'
      results = search_reports(user, query, filters)
    end
    
    # Save search query for history
    create!(
      user: user,
      query: query,
      search_type: search_type,
      filters: filters
    )
    
    results
  end
  
  private
  
  def self.search_operations(user, query, filters)
    operations = user.operations
    
    # Text search
    if query.present?
      operations = operations.where(
        "operations.name ILIKE ? OR operations.scope ILIKE ?",
        "%#{query}%", "%#{query}%"
      )
    end
    
    # Apply filters
    operations = filter_operations(operations, filters)
    
    operations.map { |op| { type: 'operation', id: op.id, title: op.name, description: op.scope, url: Rails.application.routes.url_helpers.operation_path(op) } }
  end
  
  def self.search_targets(user, query, filters)
    targets = user.targets.joins(:operation)
    
    # Text search
    if query.present?
      targets = targets.where(
        "targets.host_name ILIKE ? OR targets.ip_address::text ILIKE ?",
        "%#{query}%", "%#{query}%"
      )
    end
    
    # Apply filters
    targets = filter_targets(targets, filters)
    
    targets.map { |target| { type: 'target', id: target.id, title: target.host_name, description: target.ip_address, url: Rails.application.routes.url_helpers.target_path(target) } }
  end
  
  def self.search_findings(user, query, filters)
    findings = user.findings.joins(:operation, :target)
    
    # Text search
    if query.present?
      findings = findings.where(
        "findings.title ILIKE ? OR findings.description ILIKE ? OR findings.severity ILIKE ?",
        "%#{query}%", "%#{query}%", "%#{query}%"
      )
    end
    
    # Apply filters
    findings = filter_findings(findings, filters)
    
    findings.map { |finding| { type: 'finding', id: finding.id, title: finding.title, description: finding.description, url: Rails.application.routes.url_helpers.finding_path(finding) } }
  end
  
  def self.search_reports(user, query, filters)
    reports = user.reports.joins(:operation)
    
    # Text search
    if query.present?
      reports = reports.where(
        "reports.generated_at::text ILIKE ?",
        "%#{query}%"
      )
    end
    
    # Apply filters
    reports = filter_reports(reports, filters)
    
    reports.map { |report| { type: 'report', id: report.id, title: "Report - #{report.generated_at}", description: "Generated on #{report.created_at.strftime('%B %d, %Y')}", url: Rails.application.routes.url_helpers.report_path(report) } }
  end
  
  def self.filter_operations(operations, filters)
    operations = operations.where(status: filters[:status]) if filters[:status].present?
    operations = operations.where("start_date >= ?", filters[:start_date]) if filters[:start_date].present?
    operations = operations.where("end_date <= ?", filters[:end_date]) if filters[:end_date].present?
    operations
  end
  
  def self.filter_targets(targets, filters)
    targets = targets.where("ip_address::text ILIKE ?", "%#{filters[:ip_address]}%") if filters[:ip_address].present?
    targets
  end
  
  def self.filter_findings(findings, filters)
    findings = findings.where(severity: filters[:severity]) if filters[:severity].present?
    findings = findings.where("created_at >= ?", filters[:date_from]) if filters[:date_from].present?
    findings = findings.where("created_at <= ?", filters[:date_to]) if filters[:date_to].present?
    findings
  end
  
  def self.filter_reports(reports, filters)
    reports = reports.where("generated_at >= ?", filters[:date_from]) if filters[:date_from].present?
    reports = reports.where("generated_at <= ?", filters[:date_to]) if filters[:date_to].present?
    reports
  end
end
