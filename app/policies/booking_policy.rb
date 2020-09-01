class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    true
  end

  def update?
    true
  end

  def edit?
    true
  end

  def cancel?
    true
  end

  def accept?
    true
  end
end
