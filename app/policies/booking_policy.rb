class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

   def index?
    record.user == user
  end


  def show?
    record.user == user
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def update?
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
