class OperationPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def show?
    user.present?
  end

  def close?
    user.present?
  end

  def generate_report?
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.present?
  end
end
