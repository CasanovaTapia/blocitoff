class ListPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.present? && record.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
