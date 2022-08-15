# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user&.admin?
  end

  def show?
    true
  end

  def create?
    user&.admin?
  end

  def new?
    create?
  end

  def update?
    user&.admin? || record == user
  end

  def edit?
    update?
  end

  def destroy?
    edit?
  end

  # custom account specific methods
  def account?
    user.present?
  end

  def password?
    record == user
  end
end
