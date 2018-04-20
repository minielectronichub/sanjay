class ExperimentPolicy < ApplicationPolicy
  def update?
    user.admin? or not experiment.published?
  end

  def admin_list?
    user.admin?
  end
end