class EvidenceController < ApplicationController
  before_action :set_evidence, only: [:show, :destroy]
  before_action :set_finding, only: [:create]

  # Upload a file as evidence
  def create
    @evidence = @finding.evidences.build(evidence_params)
    if @evidence.save
      redirect_to @finding, notice: 'File was successfully uploaded as evidence.'
    else
      redirect_to @finding, alert: 'Unable to upload file.'
    end
  end

  # View a file
  def show
    @finding = @evidence.finding
    if File.exist?(@evidence.file_path)
      send_file(@evidence.file_path, disposition: 'inline')
    else
      redirect_to @finding, alert: 'File not found.'
    end
  end

  # Delete a file
  def destroy
    @finding = @evidence.finding
    if @evidence.destroy
      redirect_to @finding, notice: 'File was successfully deleted.'
    else
      redirect_to @finding, alert: 'Unable to delete file.'
    end
  end

  private

  def set_evidence
    @evidence = Evidence.find(params[:id])
  end

  def set_finding
    @finding = Finding.find(params[:finding_id])
  end

  def evidence_params
    params.require(:evidence).permit(:file_path)
  end
end
