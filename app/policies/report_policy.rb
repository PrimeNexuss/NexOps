class ReportPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def show?
    user.present?
  end

  def export_pdf?
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.present?
  end
end
