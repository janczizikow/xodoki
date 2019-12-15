class DirectionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user&.admin?
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def new?
    index?
  end

  def update?
    index?
  end

  def edit?
    index?
  end

  def destroy?
    index?
  end
end
