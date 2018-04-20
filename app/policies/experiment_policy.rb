class ExperimentPolicy < ApplicationPolicy
  def update?
    user.admin? or not experiment.published?
  end

  def admin_list?
    user.admin?
  end
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def update?
    user.admin? or not post.published?
  end
end