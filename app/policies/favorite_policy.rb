# frozen_string_literal: true

class FavoritePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    user.present?
  end

  def destroy?
    record.user == user
  end
end
