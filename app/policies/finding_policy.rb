class FindingPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def show?
    user.present?
  end

  def update_severity?
    user.present?
  end

  def attach_evidence?
    user.present?
  end

  def mark_verified?
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.present?
  end
end
