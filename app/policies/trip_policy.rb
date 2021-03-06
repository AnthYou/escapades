class TripPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def index?
    true
  end

  def review?
    record.user == user
  end

  def add_activity?
    record.user == user
  end
end
