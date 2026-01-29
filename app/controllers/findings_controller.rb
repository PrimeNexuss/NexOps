class FindingsController < ApplicationController
  before_action :set_finding, only: [:show, :update_severity, :attach_evidence, :mark_verified]
  before_action :set_target, only: [:create]

  # Add finding to target
  def create
    @finding = @target.findings.build(finding_params)
    if @finding.save
      redirect_to @target, notice: 'Finding was successfully added.'
    else
      redirect_to @target, alert: 'Unable to add finding.'
    end
  end

  # View finding details
  def show
    @evidences = @finding.evidences
  end

  # Assign severity to finding
  def update_severity
    if @finding.update(severity: params[:severity])
      redirect_to @finding, notice: 'Severity was successfully updated.'
    else
      redirect_to @finding, alert: 'Unable to update severity.'
    end
  end

  # Attach evidence to finding
  def attach_evidence
    @evidence = @finding.evidences.build(evidence_params)
    if @evidence.save
      redirect_to @finding, notice: 'Evidence was successfully attached.'
    else
      redirect_to @finding, alert: 'Unable to attach evidence.'
    end
  end

  # Mark finding as verified
  def mark_verified
    if @finding.update(verified: true)
      redirect_to @finding, notice: 'Finding was successfully marked as verified.'
    else
      redirect_to @finding, alert: 'Unable to mark finding as verified.'
    end
  end

  private

  def set_finding
    @finding = Finding.find(params[:id])
  end

  def set_target
    @target = Target.find(params[:target_id])
  end

  def finding_params
    params.require(:finding).permit(:title, :description, :severity)
  end

  def evidence_params
    params.require(:evidence).permit(:file_path)
  end
end
