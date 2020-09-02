class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    record.trip.user == user
  end

  def create?
    new?
  end

  def edit?
    record.trip.user == user
  end

  def update?
    edit?
  end
end
