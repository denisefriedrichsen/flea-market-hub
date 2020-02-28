class SpotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def indexMySpots?
    return true
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def edit?
    record.user == user
  end

  def update?
    return true
  end

  def indexMySpots?
    return true
  end

  def destroy?
    return true
  end

  def decline?
    return true
  end

  def confirm?
    return true
  end

end
