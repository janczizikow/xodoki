# frozen_string_literal: true

class HikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    user&.admin? || record.user == user
  end

  def edit?
    update?
  end

  def destroy?
    edit?
  end

  # account specific
  def hikes?
    user.present?
  end
end
