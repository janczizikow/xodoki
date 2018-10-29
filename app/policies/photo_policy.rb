# frozen_string_literal: true

class PhotoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.present?
  end

  def update?
    record.user == user
  end

  def destroy?
    update?
  end
end
