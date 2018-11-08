class RentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if @user.has_attribute?(:is_admin) && @user.is_admin
        scope.all
      else
        scope.where(user: @user)
      end
    end
  end

  def create?
    @user.id == @record.user_id
  end
end
