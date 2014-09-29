class ItemPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.present? && record.list.user == user
  end

  def update?
    user.present? && (record.list.user == user || user.role?(:premium))
  end
  class Scope < Scope
    def resolve
      scope
    end
  end
end
