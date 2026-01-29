class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :export_pdf]
  before_action :set_operation, only: [:create]

  # Generate report
  def create
    @report = @operation.reports.build(report_params)
    if @report.save
      redirect_to @report, notice: 'Report was successfully generated.'
    else
      redirect_to @operation, alert: 'Unable to generate report.'
    end
  end

  # View report
  def show
    @operation = @report.operation
    @findings = @operation.findings
    @targets = @operation.targets
  end

  # Export report as PDF
  def export_pdf
    require 'prawn'

    # Create PDF
    pdf = Prawn::Document.new
    pdf.text "Operation Report", size: 24, style: :bold
    pdf.text "Operation: #{@report.operation.name}", size: 12
    pdf.text "Generated: #{@report.generated_at}", size: 10
    pdf.text " "

    # Add findings to PDF
    pdf.text "Findings:", size: 14, style: :bold
    @report.operation.findings.each do |finding|
      pdf.text "- #{finding.title} (#{finding.severity})", size: 11
      pdf.text "  #{finding.description}", size: 10
    end

    # Send PDF to browser
    send_data pdf.render,
              filename: "report_#{@report.id}.pdf",
              type: 'application/pdf',
              disposition: 'attachment'
  end

  private

  def set_report
    @report = Report.find(params[:id])
  end

  def set_operation
    @operation = Operation.find(params[:operation_id])
  end

  def report_params
    params.require(:report).permit(:generated_at)
  end
end
