# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    # TODO: ONLY ADMIN
    user.present?
  end

  def new?
    # TODO: ONLY ADMIN
    true
  end

  def update?
    record == user
  end

  def edit?
    record == user
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
