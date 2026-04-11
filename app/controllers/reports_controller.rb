class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :export_pdf, :destroy]
  before_action :set_operation, only: [:create, :new]
  before_action :require_read_reports_permission, only: [:index, :show]
  before_action :require_create_reports_permission, only: [:new, :create]
  before_action :require_delete_reports_permission, only: [:destroy]
  before_action :require_export_reports_permission, only: [:export_pdf, :export_csv]

  # GET /reports
  def index
    @reports = current_user.reports.includes(:operation).order(created_at: :desc)
    @total_reports = @reports.count
    @recent_reports = @reports.where('created_at >= ?', 1.week.ago).count
  end

  # GET /reports/new
  def new
    @report = @operation.reports.new
  end

  # POST /reports
  def create
    @report = @operation.reports.build(report_params)
    @report.generated_at = Time.current
    
    if @report.save
      # Create notification
      Notification.create_for_user(
        current_user,
        title: 'Report Generated',
        message: "Report generated for operation #{@operation.name}",
        type: 'success'
      )
      redirect_to @report, notice: 'Report was successfully generated.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /reports/:id
  def show
    @operation = @report.operation
    @findings = @operation.findings.includes(:target, :evidence).order(severity: :desc, created_at: :desc)
    @targets = @operation.targets.includes(:findings)
    
    # Calculate statistics
    @critical_findings = @findings.where(severity: 'critical').count
    @high_findings = @findings.where(severity: 'high').count
    @medium_findings = @findings.where(severity: 'medium').count
    @low_findings = @findings.where(severity: 'low').count
    @verified_findings = @findings.where(verified: true).count
  end

  # GET /reports/:id/export_pdf
  def export_pdf
    require 'prawn'
    require 'prawn/table'

    # Create PDF
    pdf = Prawn::Document.new(page_size: 'A4', margin: 40)
    
    # Add custom styling
    pdf.font_size 12
    
    # Header
    pdf.text "NEXOPS SECURITY REPORT", size: 20, style: :bold, align: :center
    pdf.move_down 10
    pdf.text "Operation: #{@report.operation.name}", size: 14, style: :bold
    pdf.text "Generated: #{@report.generated_at.strftime('%B %d, %Y at %I:%M %p')}", size: 10
    pdf.text "Report ID: ##{@report.id}", size: 10
    pdf.move_down 20
    
    # Executive Summary
    pdf.text "EXECUTIVE SUMMARY", size: 14, style: :bold
    pdf.move_down 10
    
    summary_data = [
      ['Total Targets', @targets.count],
      ['Total Findings', @findings.count],
      ['Critical Findings', @critical_findings],
      ['High Findings', @high_findings],
      ['Verified Findings', @verified_findings]
    ]
    
    pdf.table(summary_data, 
      header: false,
      cell_style: { 
        size: 10, 
        borders: [], 
        padding: [5, 10] 
      }) do
      columns(1).style(font_style: :bold)
    end
    
    pdf.move_down 20
    
    # Findings by Severity
    pdf.text "FINDINGS BY SEVERITY", size: 14, style: :bold
    pdf.move_down 10
    
    severity_data = [['Severity', 'Count', 'Percentage']]
    total_findings = @findings.count
    [
      ['Critical', @critical_findings, total_findings > 0 ? "#{(@critical_findings.to_f / total_findings * 100).round(1)}%" : "0%"],
      ['High', @high_findings, total_findings > 0 ? "#{(@high_findings.to_f / total_findings * 100).round(1)}%" : "0%"],
      ['Medium', @medium_findings, total_findings > 0 ? "#{(@medium_findings.to_f / total_findings * 100).round(1)}%" : "0%"],
      ['Low', @low_findings, total_findings > 0 ? "#{(@low_findings.to_f / total_findings * 100).round(1)}%" : "0%"]
    ].each { |row| severity_data << row }
    
    pdf.table(severity_data,
      header: true,
      cell_style: { size: 10, padding: [5, 8] }) do
      row(0).font_style = :bold
      row(0).background_color = 'E8E8E8'
      columns(2).align = :center
    end
    
    pdf.move_down 20
    
    # Detailed Findings
    pdf.text "DETAILED FINDINGS", size: 14, style: :bold
    pdf.move_down 10
    
    @findings.each_with_index do |finding, index|
      pdf.start_new_page if index > 0 && index % 3 == 0
      
      pdf.text "#{index + 1}. #{finding.title}", size: 12, style: :bold
      pdf.text "Severity: #{finding.severity.upcase}", size: 10, style: :italic
      pdf.text "Target: #{finding.target.host_name} (#{finding.target.ip_address})", size: 10
      pdf.text "Status: #{finding.verified? ? 'Verified' : 'Pending'}", size: 10
      pdf.move_down 5
      pdf.text "Description: #{finding.description}", size: 10
      pdf.move_down 10
    end
    
    # Footer
    pdf.number_pages "Page <page> of <total>", at: [pdf.bounds.right - 50, 0], align: :right, size: 8
    
    # Send PDF to browser
    send_data pdf.render,
              filename: "nexops_report_#{@report.id}_#{@report.generated_at.strftime('%Y%m%d')}.pdf",
              type: 'application/pdf',
              disposition: 'attachment'
  end

  # DELETE /reports/:id
  def destroy
    @report.destroy
    redirect_to reports_path, notice: 'Report was successfully deleted.'
  end

  # GET /reports/:id/export_csv
  def export_csv
    require 'csv'
    
    csv_data = CSV.generate do |csv|
      csv << ['Report ID', 'Operation', 'Target', 'Finding Title', 'Severity', 'Description', 'Verified', 'Created At']
      
      @findings.each do |finding|
        csv << [
          @report.id,
          @operation.name,
          finding.target.host_name,
          finding.title,
          finding.severity,
          finding.description,
          finding.verified? ? 'Yes' : 'No',
          finding.created_at.strftime('%Y-%m-%d %H:%M:%S')
        ]
      end
    end
    
    send_data csv_data,
              filename: "nexops_report_#{@report.id}_#{@report.generated_at.strftime('%Y%m%d')}.csv",
              type: 'text/csv',
              disposition: 'attachment'
  end

  private

  def set_report
    @report = current_user.reports.find(params[:id])
  end

  def set_operation
    @operation = current_user.operations.find(params[:operation_id])
  end

  def report_params
    params.require(:report).permit(:notes, :report_type)
  end

  # Permission methods
  def require_read_reports_permission
    redirect_to root_path, alert: "Access denied" unless current_user.has_permission?('read_reports')
  end

  def require_create_reports_permission
    redirect_to root_path, alert: "Access denied" unless current_user.has_permission?('create_reports')
  end

  def require_delete_reports_permission
    redirect_to root_path, alert: "Access denied" unless current_user.has_permission?('delete_reports')
  end

  def require_export_reports_permission
    redirect_to root_path, alert: "Access denied" unless current_user.has_permission?('export_reports')
  end
end
